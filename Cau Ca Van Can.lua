local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local PlayerGui = player:WaitForChild("PlayerGui")

local Events = ReplicatedStorage:WaitForChild("Events")

local FishingRemote = Events:WaitForChild("Fishing")

local ToggleHotbar = Events:WaitForChild("ToggleHotbar")

local UseSkill = Events:WaitForChild("UseSkill")

local AutoFishing = false

local LockedSpot = nil

local Initialized = false

local isCasting = false

local SkillUsed = false

local SkillActive = false

local StartTime = 0

local lastCastTime = 0

local CAST_COOLDOWN = 1.2

local lastFishingEndTime = 0

local END_DELAY = 0.4

local Spots = {

    {cf = CFrame.new(13.57, 9.76, -1342.68)},

    {cf = CFrame.new(57.63, 5.96, 1265.47) * CFrame.Angles(0, math.rad(-155.9), 0)},

    {cf = CFrame.new(-1206.49, 4.85, 1262.03) * CFrame.Angles(0, math.rad(170.3), 0)},

    {cf = CFrame.new(-1256.21, 9.56, -73.59) * CFrame.Angles(0, math.rad(85.8), 0)},

    {cf = CFrame.new(-192.008, 5.563, 53.464) * CFrame.Angles(0, math.rad(-127.672), 0)},

    {

        cf = CFrame.new(

            -1379.47058, 9.7615242, -1394.04956,

            -0.995574415, 0, -0.0939764977,

            0, 1, 0,

            0.0939764977, 0, -0.995574415

        )

    }

}

local function isFishingGuiActive()

    local gui = PlayerGui:FindFirstChild("MainGui")

    local fishing = gui and gui:FindFirstChild("Fishing")

    return fishing and fishing.Visible and fishing:FindFirstChild("BarFrame")

end

local function setRootCFrame(root, cf)

    root.CFrame = CFrame.new(cf.Position, cf.Position + cf.LookVector)

end

-- FIX PC: check cần đơn giản, ổn định

local function hasRod()

    local char = player.Character

    if not char then return false end

    return char:FindFirstChild("Tool") ~= nil

end

local function initSpot()

    local char = player.Character or player.CharacterAdded:Wait()

    local root = char:WaitForChild("HumanoidRootPart")

    local dist = math.huge

    for _, s in ipairs(Spots) do

        local d = (root.Position - s.cf.Position).Magnitude

        if d < dist then

            dist = d

            LockedSpot = s

        end

    end

    if LockedSpot then

        setRootCFrame(root, LockedSpot.cf)

    end

    if not hasRod() then

        pcall(function()

            ToggleHotbar:InvokeServer("1")

        end)

        task.wait(0.7)

    end

    Initialized = true

end

player.CharacterAdded:Connect(function()

    Initialized = false

    isCasting = false

    SkillUsed = false

    SkillActive = false

    StartTime = 0

    lastCastTime = 0

    lastFishingEndTime = 0

end)

task.spawn(function()

    local wasFishing = false

    while task.wait(0.1) do

        if not AutoFishing then

            Initialized = false

            isCasting = false

            wasFishing = false

            continue

        end

        if SkillActive then

            isCasting = false

            continue

        end

        if not Initialized then

            initSpot()

            continue

        end

        local char = player.Character

        local root = char and char:FindFirstChild("HumanoidRootPart")

        if root and LockedSpot then

            setRootCFrame(root, LockedSpot.cf)

        end

        local fishingNow = isFishingGuiActive()

        -- FIX PC: reset state ngay khi câu xong

        if wasFishing and not fishingNow then

            lastFishingEndTime = tick()

            isCasting = false

            SkillActive = false

            SkillUsed = false

        end

        wasFishing = fishingNow

        if not fishingNow

            and not isCasting

            and not SkillActive

            and (tick() - lastCastTime) > CAST_COOLDOWN

            and (tick() - lastFishingEndTime) > END_DELAY then

            if not hasRod()

            and (tick() - lastFishingEndTime) > 0.6 then

                pcall(function()

                    ToggleHotbar:InvokeServer("1")

                end)

                task.wait(0.3)

            end

            if not hasRod() then continue end

            isCasting = true

            lastCastTime = tick()

            local ok = pcall(function()

                FishingRemote:FireServer()

            end)

            if not ok then

                isCasting = false

            end

        elseif fishingNow then

            if tick() - lastCastTime > 2 then

                isCasting = false

            end

        end

    end

end)

RunService.RenderStepped:Connect(function()

    if not AutoFishing then return end

    local gui = PlayerGui:FindFirstChild("MainGui")

    local fishing = gui and gui:FindFirstChild("Fishing")

    if not fishing or not fishing.Visible then return end

    local bar = fishing.BarFrame and fishing.BarFrame:FindFirstChild("Bar")

    if bar then

        bar.AnchorPoint = Vector2.new(0.5, 0.5)

        bar.Position = UDim2.fromScale(0.5, 0.5)

    end

    local perfectBtn =

        fishing:FindFirstChild("PerfectButton")

        and fishing.PerfectButton:FindFirstChild("Button")

    if perfectBtn then

        for _, c in ipairs(getconnections(perfectBtn.Activated)) do c:Fire() end

        for _, c in ipairs(getconnections(perfectBtn.MouseButton1Click)) do c:Fire() end

        pcall(function() perfectBtn:Activate() end)

    end

end)

local SelectedSkills = { "Random" }

local SkillDropdown = MainTab:Dropdown({

    Title = "Chọn Skill muốn dùng",

    Desc = "Chọn skill dùng khi đang câu trong chức năng Premium",

    Values = { "Random", "V", "C", "Z", "X" },

    Value = { "Random" },

    Multi = true,

    AllowNone = true,

    Callback = function(v)

        if not IsPremium() then

            return

        end

        SelectedSkills = v

    end

})

SkillDropdown:Lock()

if IsPremium() then

    SkillDropdown:Unlock()

end

RunService.Heartbeat:Connect(function()

    if not AutoFishing then return end

    local fishing = PlayerGui:FindFirstChild("MainGui")

        and PlayerGui.MainGui:FindFirstChild("Fishing")

    if not fishing or not fishing.Visible then

        SkillUsed = false

        SkillActive = false

        StartTime = 0

        return

    end

    if StartTime == 0 then StartTime = tick() end

    if tick() - StartTime < 3 then return end

    if SkillUsed then return end

    local frame =

        fishing:FindFirstChild("SkillButton")

        and fishing.SkillButton:FindFirstChild("Frame")

    if not frame then return end

    local available = {}

    for _, k in ipairs({ "C", "V", "Z", "X" }) do

        local f = frame:FindFirstChild(k)

        if f and f.Visible then

            table.insert(available, k)

        end

    end

    if #available == 0 then return end

    local fireList = {}

    if table.find(SelectedSkills, "Random") then

        fireList = { available[math.random(#available)] }

    else

        for _, s in ipairs(SelectedSkills) do

            if table.find(available, s) then

                table.insert(fireList, s)

            end

        end

    end

    if #fireList == 0 then return end

    SkillUsed = true

    SkillActive = true

    for _, k in ipairs(fireList) do

        UseSkill:FireServer(k)

        task.wait(0.15)

    end

    task.delay(1.2, function()

        SkillUsed = false

        SkillActive = false

        StartTime = 0

    end)

end)

local Toggle

Toggle = MainTab:Toggle({

    Title = "Tự Động Câu Premium",

    Desc = "tự động câu và sử dụng chiêu",

    Type = "Toggle",

    Value = false,

    Callback = function(state)

        if not IsPremium() then

            Toggle:Set(false)

            return

        end

        AutoFishing = state

        if not state then

            Initialized = false

            isCasting = false

            SkillUsed = false

            SkillActive = false

            StartTime = 0

            lastCastTime = 0

            lastFishingEndTime = 0

        end

    end

})