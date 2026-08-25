-- BENDUAHAUVNMADEINSCRIPT: V2 CODE --
-- code script by me don't copy --

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-------------------------------------------------
-- SIMPLE
-------------------------------------------------

local SavedWalkSpeed = 16
local SavedJumpPower = 50
local FlySpeed = 60
local SavedPosition = nil

-------------------------------------------------
-- RAYFIELD
-------------------------------------------------

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Ben Hub",
    LoadingTitle = "Ben Hub",
    LoadingSubtitle = "SLAP DUELS",
    ConfigurationSaving = {Enabled = false},
    KeySystem = false
})

local Tab = Window:CreateTab("Main", 4483362458)

-------------------------------------------------
-- CHARACTER
-------------------------------------------------

local humConn

local function getChar()
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    return char, hum, root
end

local function applyMovement(char)

    local hum = char:WaitForChild("Humanoid",5)
    if not hum then return end

    hum.UseJumpPower = true
    hum.WalkSpeed = SavedWalkSpeed
    hum.JumpPower = SavedJumpPower

    if humConn then humConn:Disconnect() end

    humConn = hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if hum.WalkSpeed ~= SavedWalkSpeed then
            hum.WalkSpeed = SavedWalkSpeed
        end
    end)

end

player.CharacterAdded:Connect(function(char)
    task.wait(.05)
    applyMovement(char)
end)

if player.Character then
    applyMovement(player.Character)
end

-------------------------------------------------
-- WALKSPEED
-------------------------------------------------

Tab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16,150},
    Increment = 1,
    CurrentValue = SavedWalkSpeed,
    Callback = function(v)

        SavedWalkSpeed = v

        local _,hum = getChar()
        if hum then hum.WalkSpeed = v end

    end
})

-------------------------------------------------
-- JUMPPOWER
-------------------------------------------------

Tab:CreateSlider({
    Name = "JumpPower",
    Range = {50,250},
    Increment = 5,
    CurrentValue = SavedJumpPower,
    Callback = function(v)

        SavedJumpPower = v

        local _,hum = getChar()
        if hum then
            hum.UseJumpPower = true
            hum.JumpPower = v
        end

    end
})

-------------------------------------------------
-- FLY
-------------------------------------------------

local flying = false
local flyConn
local bv, bg

local function flyOff()

    flying = false

    if flyConn then flyConn:Disconnect() flyConn = nil end
    if bv then bv:Destroy() bv = nil end
    if bg then bg:Destroy() bg = nil end

    local _, hum = getChar()

    if hum then
        hum.PlatformStand = false
    end

end


local function flyOn()

    local char, hum, root = getChar()
    if not char or not hum or not root then return end

    flying = true
    hum.PlatformStand = true

    bg = Instance.new("BodyGyro")
    bg.P = 9e4
    bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
    bg.CFrame = root.CFrame
    bg.Parent = root

    bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(9e9,9e9,9e9)
    bv.Parent = root

    flyConn = RunService.RenderStepped:Connect(function()

        if not flying then return end

        local cam = workspace.CurrentCamera
        local moveDir = hum.MoveDirection
        local localDir = cam.CFrame:VectorToObjectSpace(moveDir)

        local move =
            (cam.CFrame.RightVector * localDir.X) -
            (cam.CFrame.LookVector * localDir.Z)

        local vertical = 0

        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            vertical += 1
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            vertical -= 1
        end

        bv.Velocity =
            (move * FlySpeed) +
            Vector3.new(0, vertical * FlySpeed, 0)

        bg.CFrame = cam.CFrame

    end)

end

Tab:CreateButton({
    Name = "Fly",
    Callback = function()

        if flying then
            flyOff()
        else
            flyOn()
        end

    end
})

-------------------------------------------------
-- SAVE POS
-------------------------------------------------

Tab:CreateButton({
    Name = "Save Position",
    Callback = function()

        local _,_,root = getChar()
        if root then
            SavedPosition = root.CFrame
        end

    end
})

Tab:CreateButton({
    Name = "Go To Saved Position",
    Callback = function()

        local _,_,root = getChar()
        if root and SavedPosition then
            root.CFrame = SavedPosition
        end

    end
})

-------------------------------------------------
-- DESCRIPTION
-------------------------------------------------

Tab:CreateParagraph({
    Title = "Description",
    Content = "Made in Viet Nam 🇻🇳"
})

Rayfield:Notify({
    Title = "Ben Hub",
    Content = "Loaded",
    Duration = 3
})