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
ImageButton.Image = "http://www.roblox.com/asset/?id=132003147574164"

UICorner.CornerRadius = UDim.new(1, 10) 
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat wait() until game:IsLoaded()
local Window = Fluent:CreateWindow({
    Title = "Ben Dưa Hấu VN Hub",
    SubTitle = "script made by benduahauvn",
    TabWidth = 157,
    Size = UDim2.fromOffset(450, 300),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.End
})
local Tabs = {
        Main0=Window:AddTab({ Title="Thông Tin" }),
        Main1=Window:AddTab({ Title="Blox Fruits" }),
        Main2=Window:AddTab({ Title="Steal a Brainrot" }),
        Main3=Window:AddTab({ Title="99 Night In The Forest" }),
        Main4=Window:AddTab({ Title="Forsaken" }),
        Main5=Window:AddTab({ Title="COMING SOON" }),
}
    Tabs.Main0:AddButton({
    Title = "Discord",
    Description = "Ben Dưa Hấu VN Hub Community",
    Callback = function()
        setclipboard("https://discord.gg/2EjEFwfqWm")
    end
})

    Tabs.Main0:AddButton({
    Title = "Youtuber",
    Description = "Ben Dưa Hấu VN Roblox",
    Callback = function()
        setclipboard("https://www.youtube.com/@benmelonvnroblox")
    end
})

    Tabs.Main0:AddButton({
    Title = "Youtuber",
    Description = "TSG (staff discord)",
    Callback = function()
        setclipboard("https://www.youtube.com/@TSG01.1")
    end
})
    
    Tabs.Main1:AddButton({
    Title="Redz Hub",
    Description="",
    Callback=function()
      loadstring(game:HttpGet("https://keyscripthub.vercel.app/redz.lua"))()
  end
})

    Tabs.Main1:AddButton({
    Title="GreenZ Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaAnarchist/GreenZ-Hub/refs/heads/main/KaitunDoughKing.lua"))()
  end
})

   Tabs.Main1:AddButton({
    Title="Hoho Hub",
    Description="",
    Callback=function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
  end
})

    Tabs.Main1:AddButton({
    Title="TSG Heb",
    Description="",
    Callback=function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/baconquenmk-cell/kho-script-benmelonvn/refs/heads/main/tsgavabenhub.txt"))()
  end
})

     Tabs.Main1:AddButton({
    Title="Blue Hub",
    Description="",
    Callback=function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/Main.lua"))()
  end
})

    Tabs.Main2:AddButton({
    Title="Aurora Hub",
    Description="",
    Callback=function()
      loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/c2e485181b4b948563c128a147224546.lua"))()
  end
})
    Tabs.Main2:AddButton({
    Title="Kurd Hub",
    Description="",
    Callback=function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Ninja10908/S4/refs/heads/main/Kurdhub"))()
  end
})

    Tabs.Main2:AddButton({
    Title="Lennze Hub (Find Server)",
    Description="",
    Callback=function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/salmdoske2233-spec/LennzeHub/refs/heads/main/salm-obfuscated.lua"))()  
  end
})
    Tabs.Main3:AddButton({
    Title="Vape Voidware",
    Description="",
    Callback=function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))() 
  end
})
   