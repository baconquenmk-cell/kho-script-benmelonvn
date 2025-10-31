local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=83190276951914"

UICorner.CornerRadius = UDim.new(1, 10) 
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat wait() until game:IsLoaded()
local Window = Fluent:CreateWindow({
    Title = "BEN DƯA HẤU VN",
    SubTitle = "Blox Fruit",
    TabWidth = 157,
    Size = UDim2.fromOffset(450, 300),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.End
})
local Tabs = {
        Main0=Window:AddTab({ Title="Thông Tin" }),
        Main1=Window:AddTab({ Title="Blox Fruit" }),
        Main2=Window:AddTab({ Title="Other Game" }),
}
    Tabs.Main0:AddButton({
    Title = "Discord",
    Description = "shiina park",
    Callback = function()
        setclipboard("https://discord.gg/vrYFbfBD7Z")
    end
})

    Tabs.Main0:AddButton({
    Title = "Youtuber",
    Description = "BenMelonVN Roblox",
    Callback = function()
        setclipboard("https://www.youtube.com/@benmelonvnroblox")
    end
})
    
    Tabs.Main1:AddButton({
    Title="Redz Hub",
    Description="",
    Callback=function()
	  local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"))(Settings)
  end
})

Tabs.Main1:AddButton({
    Title="Hoho Hub",
    Description="",
    Callback=function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
  end
})

Tabs.Main2:AddButton({
    Title="Steal a Brainrot (Find Server)",
    Description="",
    Callback=function()
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/049dc8b14207dcca7e0f9812e1960141.lua"))() 
  end
})

Tabs.Main2:AddButton({
    Title="Steal a Brainrot (Vietnamese Hub)",
    Description="",
    Callback=function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/replit8173/VietnamHub/refs/heads/main/VietnamseHub.lua", true))()  end
  end
})

Tabs.Main2:AddButton({
    Title="Steal a Brainrot (Kurd Hub)",
    Description="",
    Callback=function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Ninja10908/S4/refs/heads/main/Kurdhub"))()
  end
})