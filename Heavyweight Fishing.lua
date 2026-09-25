-- ============================================================
-- GUI HOHO HUB STYLE
-- ============================================================
local function UI()
    -- Palette
    local C = {
        bg          = Color3.fromRGB(18, 18, 22),
        sidebar     = Color3.fromRGB(24, 24, 30),
        content     = Color3.fromRGB(30, 30, 38),
        card        = Color3.fromRGB(38, 38, 48),
        accent      = Color3.fromRGB(255, 200, 70),
        accent2     = Color3.fromRGB(255, 140, 40),
        text        = Color3.fromRGB(240, 240, 245),
        textDim     = Color3.fromRGB(150, 150, 165),
        success     = Color3.fromRGB(80, 220, 120),
        danger      = Color3.fromRGB(240, 70, 70),
    }

    local gui = Instance.new("ScreenGui")
    gui.Name = "HWF_HoHoUI"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = LP:WaitForChild("PlayerGui")

    -- ============ MAIN WINDOW ============
    local main = Instance.new("Frame")
    main.Name = "Main"
    main.Size = UDim2.new(0, 620, 0, 420)
    main.Position = UDim2.new(0.5, -310, 0.5, -210)
    main.BackgroundColor3 = C.bg
    main.BorderSizePixel = 0
    main.Active = true
    main.Draggable = true
    main.ClipsDescendants = true
    main.Parent = gui

    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
    local stroke = Instance.new("UIStroke", main)
    stroke.Color = Color3.fromRGB(60, 60, 75)
    stroke.Thickness = 1
    stroke.Transparency = 0.3

    -- Shadow (fake)
    local shadow = Instance.new("ImageLabel", main)
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 40, 1, 40)
    shadow.Position = UDim2.new(0, -20, 0, -20)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://5028857084"
    shadow.ImageColor3 = Color3.new(0, 0, 0)
    shadow.ImageTransparency = 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(24, 24, 276, 276)
    shadow.ZIndex = -1

    -- ============ TITLE BAR ============
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 42)
    titleBar.BackgroundColor3 = C.sidebar
    titleBar.BorderSizePixel = 0
    titleBar.Parent = main

    local titleCorner = Instance.new("UICorner", titleBar)
    titleCorner.CornerRadius = UDim.new(0, 12)

    local titleMask = Instance.new("Frame", titleBar)
    titleMask.Size = UDim2.new(1, 0, 0, 20)
    titleMask.Position = UDim2.new(0, 0, 1, -20)
    titleMask.BackgroundColor3 = C.sidebar
    titleMask.BorderSizePixel = 0

    -- Logo dot
    local logoDot = Instance.new("Frame", titleBar)
    logoDot.Size = UDim2.new(0, 8, 0, 8)
    logoDot.Position = UDim2.new(0, 16, 0.5, -4)
    logoDot.BackgroundColor3 = C.accent
    logoDot.BorderSizePixel = 0
    Instance.new("UICorner", logoDot).CornerRadius = UDim.new(1, 0)

    local titleLabel = Instance.new("TextLabel", titleBar)
    titleLabel.Size = UDim2.new(1, -100, 1, 0)
    titleLabel.Position = UDim2.new(0, 34, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Heavyweight Fishing  •  HoHo UI"
    titleLabel.TextColor3 = C.text
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar

    -- Window buttons
    local function makeWinBtn(x, text, color, cb)
        local b = Instance.new("TextButton", titleBar)
        b.Size = UDim2.new(0, 26, 0, 26)
        b.Position = UDim2.new(1, x, 0.5, -13)
        b.BackgroundColor3 = C.card
        b.Text = text
        b.TextColor3 = C.textDim
        b.Font = Enum.Font.GothamBold
        b.TextSize = 14
        b.BorderSizePixel = 0
        b.AutoButtonColor = false
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
        b.MouseEnter:Connect(function() b.BackgroundColor3 = color; b.TextColor3 = C.text end)
        b.MouseLeave:Connect(function() b.BackgroundColor3 = C.card; b.TextColor3 = C.textDim end)
        b.MouseButton1Click:Connect(cb)
        return b
    end

    makeWinBtn(-64, "—", C.card, function()
        main.Visible = false
        -- tạo nút mở lại
        local reopen = Instance.new("TextButton", gui)
        reopen.Size = UDim2.new(0, 44, 0, 44)
        reopen.Position = UDim2.new(0, 20, 0.5, -22)
        reopen.BackgroundColor3 = C.bg
        reopen.Text = "🐟"
        reopen.TextSize = 22
        reopen.BorderSizePixel = 0
        Instance.new("UICorner", reopen).CornerRadius = UDim.new(0, 10)
        local st = Instance.new("UIStroke", reopen)
        st.Color = C.accent; st.Thickness = 1.5
        reopen.MouseButton1Click:Connect(function()
            main.Visible = true
            reopen:Destroy()
        end)
    end)

    makeWinBtn(-34, "✕", C.danger, function() gui:Destroy() end)

    -- ============ SIDEBAR ============
    local sidebar = Instance.new("Frame", main)
    sidebar.Name = "Sidebar"
    sidebar.Size = UDim2.new(0, 150, 1, -42)
    sidebar.Position = UDim2.new(0, 0, 0, 42)
    sidebar.BackgroundColor3 = C.sidebar
    sidebar.BorderSizePixel = 0

    -- Content area
    local content = Instance.new("Frame", main)
    content.Name = "Content"
    content.Size = UDim2.new(1, -150, 1, -42)
    content.Position = UDim2.new(0, 150, 0, 42)
    content.BackgroundColor3 = C.bg
    content.BorderSizePixel = 0

    -- ============ TABS ============
    local tabs = {
        {name = "Chính",  icon = "🏠"},
        {name = "Farm",   icon = "⚔️"},
        {name = "Equip",  icon = "🎣"},
        {name = "Phụ",    icon = "⚙️"},
        {name = "Credit", icon = "💎"},
    }

    local pages = {}
    local tabBtns = {}

    local function selectTab(idx)
        for i, b in ipairs(tabBtns) do
            local active = (i == idx)
            b.BackgroundColor3 = active and C.card or C.sidebar
            b.TextColor3 = active and C.accent or C.textDim
            if b:FindFirstChild("Indicator") then
                b.Indicator.Visible = active
            end
            pages[i].Visible = active
        end
    end

    for i, t in ipairs(tabs) do
        local b = Instance.new("TextButton", sidebar)
        b.Size = UDim2.new(1, -16, 0, 42)
        b.Position = UDim2.new(0, 8, 0, 8 + (i - 1) * 46)
        b.BackgroundColor3 = C.sidebar
        b.Text = "  " .. t.icon .. "   " .. t.name
        b.TextColor3 = C.textDim
        b.Font = Enum.Font.GothamMedium
        b.TextSize = 13
        b.TextXAlignment = Enum.TextXAlignment.Left
        b.BorderSizePixel = 0
        b.AutoButtonColor = false
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)

        local ind = Instance.new("Frame", b)
        ind.Name = "Indicator"
        ind.Size = UDim2.new(0, 3, 0, 20)
        ind.Position = UDim2.new(0, 0, 0.5, -10)
        ind.BackgroundColor3 = C.accent
        ind.BorderSizePixel = 0
        ind.Visible = false
        Instance.new("UICorner", ind).CornerRadius = UDim.new(1, 0)

        tabBtns[i] = b

        local p = Instance.new("ScrollingFrame", content)
        p.Size = UDim2.new(1, -20, 1, -20)
        p.Position = UDim2.new(0, 10, 0, 10)
        p.BackgroundTransparency = 1
        p.BorderSizePixel = 0
        p.ScrollBarThickness = 3
        p.ScrollBarImageColor3 = C.accent
        p.ScrollBarImageTransparency = 0.3
        p.CanvasSize = UDim2.new(0, 0, 0, 0)
        p.AutomaticCanvasSize = Enum.AutomaticSize.Y
        p.Visible = i == 1
        pages[i] = p

        b.MouseEnter:Connect(function()
            if not pages[i].Visible then
                b.BackgroundColor3 = Color3.fromRGB(32, 32, 40)
            end
        end)
        b.MouseLeave:Connect(function()
            if not pages[i].Visible then
                b.BackgroundColor3 = C.sidebar
            end
        end)
        b.MouseButton1Click:Connect(function() selectTab(i) end)
    end

    -- ============ UI HELPERS ============
    local function sectionLabel(parent, y, text)
        local l = Instance.new("TextLabel", parent)
        l.Size = UDim2.new(1, -20, 0, 22)
        l.Position = UDim2.new(0, 10, 0, y)
        l.BackgroundTransparency = 1
        l.Text = string.upper(text)
        l.TextColor3 = C.textDim
        l.Font = Enum.Font.GothamBold
        l.TextSize = 11
        l.TextXAlignment = Enum.TextXAlignment.Left
        return l
    end

    -- Card container cho nhóm toggle
    local function makeCard(parent, y, height)
        local card = Instance.new("Frame", parent)
        card.Size = UDim2.new(1, -20, 0, height)
        card.Position = UDim2.new(0, 10, 0, y)
        card.BackgroundColor3 = C.card
        card.BorderSizePixel = 0
        Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)
        return card
    end

    -- Toggle đẹp
    local function toggle(parent, y, text, cb, def)
        local f = Instance.new("Frame", parent)
        f.Size = UDim2.new(1, -20, 0, 40)
        f.Position = UDim2.new(0, 10, 0, y)
        f.BackgroundColor3 = C.card
        f.BorderSizePixel = 0
        Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)

        local lbl = Instance.new("TextLabel", f)
        lbl.Size = UDim2.new(0.7, 0, 1, 0)
        lbl.Position = UDim2.new(0, 14, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.TextColor3 = C.text
        lbl.Font = Enum.Font.GothamMedium
        lbl.TextSize = 13
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        -- Switch track
        local track = Instance.new("Frame", f)
        track.Size = UDim2.new(0, 44, 0, 22)
        track.Position = UDim2.new(1, -58, 0.5, -11)
        track.BackgroundColor3 = def and C.accent or Color3.fromRGB(60, 60, 72)
        track.BorderSizePixel = 0
        Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

        local thumb = Instance.new("Frame", track)
        thumb.Size = UDim2.new(0, 16, 0, 16)
        thumb.Position = def and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
        thumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        thumb.BorderSizePixel = 0
        Instance.new("UICorner", thumb).CornerRadius = UDim.new(1, 0)

        local btn = Instance.new("TextButton", f)
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.BackgroundTransparency = 1
        btn.Text = ""

        local state = def or false
        local function anim(toState)
            local targetPos = toState and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
            local targetColor = toState and C.accent or Color3.fromRGB(60, 60, 72)
            TweenService:Create(track, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {BackgroundColor3 = targetColor}):Play()
            TweenService:Create(thumb, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {Position = targetPos}):Play()
        end

        btn.MouseButton1Click:Connect(function()
            state = not state
            anim(state)
            if cb then cb(state) end
        end)
    end

    -- Button đẹp
    local function actionBtn(parent, y, text, cb)
        local b = Instance.new("TextButton", parent)
        b.Size = UDim2.new(1, -20, 0, 40)
        b.Position = UDim2.new(0, 10, 0, y)
        b.BackgroundColor3 = C.accent
        b.Text = text
        b.TextColor3 = Color3.fromRGB(20, 20, 25)
        b.Font = Enum.Font.GothamBold
        b.TextSize = 13
        b.BorderSizePixel = 0
        b.AutoButtonColor = false
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)

        local grad = Instance.new("UIGradient", b)
        grad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.accent),
            ColorSequenceKeypoint.new(1, C.accent2),
        })
        grad.Rotation = 0

        b.MouseEnter:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.15), {Size = UDim2.new(1, -20, 0, 42)}):Play()
        end)
        b.MouseLeave:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.15), {Size = UDim2.new(1, -20, 0, 40)}):Play()
        end)
        b.MouseButton1Click:Connect(cb)
    end

    -- Dropdown đẹp
    local function dropdown(parent, y, label, options, onSelect)
        local f = Instance.new("Frame", parent)
        f.Size = UDim2.new(1, -20, 0, 40)
        f.Position = UDim2.new(0, 10, 0, y)
        f.BackgroundColor3 = C.card
        f.BorderSizePixel = 0
        Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)

        local lbl = Instance.new("TextLabel", f)
        lbl.Size = UDim2.new(0.5, 0, 1, 0)
        lbl.Position = UDim2.new(0, 14, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = label
        lbl.TextColor3 = C.text
        lbl.Font = Enum.Font.GothamMedium
        lbl.TextSize = 13
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        local sel = Instance.new("TextButton", f)
        sel.Size = UDim2.new(0, 150, 0, 26)
        sel.Position = UDim2.new(1, -164, 0.5, -13)
        sel.BackgroundColor3 = Color3.fromRGB(48, 48, 60)
        sel.Text = options[1]
        sel.TextColor3 = C.accent
        sel.Font = Enum.Font.GothamMedium
        sel.TextSize = 12
        sel.BorderSizePixel = 0
        Instance.new("UICorner", sel).CornerRadius = UDim.new(0, 6)

        local idx = 1
        sel.MouseButton1Click:Connect(function()
            idx = idx % #options + 1
            sel.Text = options[idx]
            if onSelect then onSelect(options[idx]) end
        end)
    end

    -- Notification
    local function notify(text, color)
        local n = Instance.new("Frame", gui)
        n.Size = UDim2.new(0, 240, 0, 46)
        n.Position = UDim2.new(1, -260, 1, 60)
        n.BackgroundColor3 = C.card
        n.BorderSizePixel = 0
        Instance.new("UICorner", n).CornerRadius = UDim.new(0, 10)
        local st = Instance.new("UIStroke", n)
        st.Color = color or C.accent
        st.Thickness = 1.5

        local dot = Instance.new("Frame", n)
        dot.Size = UDim2.new(0, 6, 0, 26)
        dot.Position = UDim2.new(0, 10, 0.5, -13)
        dot.BackgroundColor3 = color or C.accent
        dot.BorderSizePixel = 0
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

        local t = Instance.new("TextLabel", n)
        t.Size = UDim2.new(1, -30, 1, 0)
        t.Position = UDim2.new(0, 24, 0, 0)
        t.BackgroundTransparency = 1
        t.Text = text
        t.TextColor3 = C.text
        t.Font = Enum.Font.GothamMedium
        t.TextSize = 12
        t.TextXAlignment = Enum.TextXAlignment.Left

        TweenService:Create(n, TweenInfo.new(0.3), {Position = UDim2.new(1, -260, 1, -70)}):Play()
        task.delay(2.5, function()
            TweenService:Create(n, TweenInfo.new(0.3), {Position = UDim2.new(1, -260, 1, 60)}):Play()
            task.wait(0.3)
            n:Destroy()
        end)
    end

    -- ============ TAB CHÍNH ============
    sectionLabel(pages[1], 5, "Farm Cá")
    toggle(pages[1], 30, "Auto Farm Cá", function(s)
        Config.AutoFarm = s
        if s then task.spawn(AutoFarm) end
        notify("Auto Farm Cá: " .. (s and "ON" or "OFF"))
    end, false)

    toggle(pages[1], 76, "Auto Sell Cá", function(s)
        Config.AutoSell = s
        if s then task.spawn(AutoSell) end
        notify("Auto Sell Cá: " .. (s and "ON" or "OFF"))
    end, false)

    toggle(pages[1], 122, "Tự Động Nhập Code", function(s)
        Config.AutoCode = s
        if s then task.spawn(AutoCode) end
        notify("Auto Code: " .. (s and "ON" or "OFF"))
    end, false)

    sectionLabel(pages[1], 175, "Di Chuyển")
    dropdown(pages[1], 200, "Teleport Island", {
        "Beginning Isle","Coconut Isle","Frost Isle","Fallout Isle",
        "Volcano Isle","Sky Isle","Crystal Isle","Shadow Isle",
        "Heaven Isle","Abyss Isle"
    }, function(v)
        Config.SelectedIsland = v
        TeleportIsland(v)
        notify("Teleport → " .. v)
    end)

    -- ============ TAB FARM ============
    sectionLabel(pages[2], 5, "Kỹ Năng")
    toggle(pages[2], 30, "Auto Skill (Z X C V)", function(s)
        Config.AutoSkill = s
        if s then task.spawn(AutoSkill) end
        notify("Auto Skill: " .. (s and "ON" or "OFF"))
    end, false)

    sectionLabel(pages[2], 83, "Boss")
    toggle(pages[2], 108, "Auto Farm Boss (đảo hiện tại)", function(s)
        BossConfig.Enabled = s
        if s then task.spawn(AutoFarmBoss) end
        notify("Auto Farm Boss: " .. (s and "ON" or "OFF"), C.danger)
    end, false)

    sectionLabel(pages[2], 161, "Khác")
    toggle(pages[2], 186, "Anti AFK", function(s)
        Config.AntiAFK = s
        notify("Anti AFK: " .. (s and "ON" or "OFF"))
    end, true)

    -- ============ TAB EQUIP ============
    sectionLabel(pages[3], 5, "Trang Bị")
    actionBtn(pages[3], 30, "🎣  Equip Best Rod", function()
        local n = EquipBestRod()
        notify(n and ("Đã equip Rod: " .. n) or "Không tìm thấy Rod")
    end)
    actionBtn(pages[3], 78, "🪱  Equip Best Bait", function()
        local n = EquipBestBait()
        notify(n and ("Đã equip Bait: " .. n) or "Không tìm thấy Bait")
    end)
    actionBtn(pages[3], 126, "🔮  Equip Best Orbs", function()
        local n = EquipBestOrbs()
        notify(n and ("Đã equip Orbs: " .. n) or "Không tìm thấy Orbs")
    end)

    -- ============ TAB PHỤ ============
    sectionLabel(pages[4], 5, "Di Chuyển Nâng Cao")
    toggle(pages[4], 30, "Đi Trên Nước", function(s)
        Config.WaterWalk = s
        if s then task.spawn(WaterWalk) end
        notify("Đi trên nước: " .. (s and "ON" or "OFF"))
    end, false)

    toggle(pages[4], 76, "Inf Jump", function(s)
        Config.InfJump = s
        notify("Inf Jump: " .. (s and "ON" or "OFF"))
    end, false)

    toggle(pages[4], 122, "Fly (WASD + Space/Ctrl)", function(s)
        Config.Fly = s
        if s then StartFly() else StopFly() end
        notify("Fly: " .. (s and "ON" or "OFF"))
    end, false)

    sectionLabel(pages[4], 175, "Tốc Độ")
    actionBtn(pages[4], 200, "Walk Speed: 16  (click để tăng)", function(self)
        Config.WalkSpeed = Config.WalkSpeed + 10
        if Config.WalkSpeed > 200 then Config.WalkSpeed = 16 end
        ApplyWalkSpeed(Config.WalkSpeed)
        self.Text = "Walk Speed: " .. Config.WalkSpeed .. "  (click để tăng)"
        notify("Walk Speed: " .. Config.WalkSpeed)
    end)

    -- ============ TAB CREDIT ============
    local creditCard = Instance.new("Frame", pages[5])
    creditCard.Size = UDim2.new(1, -20, 0, 180)
    creditCard.Position = UDim2.new(0, 10, 0, 20)
    creditCard.BackgroundColor3 = C.card
    creditCard.BorderSizePixel = 0
    Instance.new("UICorner", creditCard).CornerRadius = UDim.new(0, 10)

    local gradCredit = Instance.new("UIGradient", creditCard)
    gradCredit.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(38, 38, 48)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 28, 36)),
    })
    gradCredit.Rotation = 45

    local creditTitle = Instance.new("TextLabel", creditCard)
    creditTitle.Size = UDim2.new(1, -20, 0, 40)
    creditTitle.Position = UDim2.new(0, 10, 0, 20)
    creditTitle.BackgroundTransparency = 1
    creditTitle.Text = "🏆 SCRIPT INFO"
    creditTitle.TextColor3 = C.accent
    creditTitle.Font = Enum.Font.GothamBold
    creditTitle.TextSize = 16

    local creditBody = Instance.new("TextLabel", creditCard)
    creditBody.Size = UDim2.new(1, -20, 0, 100)
    creditBody.Position = UDim2.new(0, 10, 0, 65)
    creditBody.BackgroundTransparency = 1
    creditBody.Text = "SCRIPT ĐƯỢC TẠO BỞI:\nDEEPSEEK AI\n\nTẠO RA:\nBEN DƯA HẤU VN"
    creditBody.TextColor3 = C.text
    creditBody.Font = Enum.Font.GothamMedium
    creditBody.TextSize = 14
    creditBody.TextWrapped = true
    creditBody.TextYAlignment = Enum.TextYAlignment.Top

    notify("HoHo UI đã load thành công", C.success)
end