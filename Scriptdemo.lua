loadstring(game:HttpGet(("https://raw.githubusercontent.com/daucobonhi/Ui-Redz-V2/refs/heads/main/UiREDzV2.lua")))()

       local Window = MakeWindow({
         Hub = {
         Title = "BenMelonVN Studio",
         Animation = "Youtube: BenMelonVN"
         },
        Key = {
        KeySystem = false,
        Title = "Key System",
        Description = "",
        KeyLink = "",
        Keys = {"1234"},
        Notifi = {
        Notifications = true,
        CorrectKey = "Running the Script...",
       Incorrectkey = "The key is incorrect",
       CopyKeyLink = "Copied to Clipboard"
      }
    }
  })

       MinimizeButton({
       Image = "http://www.roblox.com/asset/?id=98002912463714",
       Size = {60, 60},
       Color = Color3.fromRGB(10, 10, 10),
       Corner = true,
       Stroke = false,
       StrokeColor = Color3.fromRGB(255, 0, 0)
      })
      
------ Tab
     local Tab1o = MakeTab({Name = "Blox Fruits"})
     local Tab2o = MakeTab({Name = "Steal a Brainrot"})
     local Tab3o = MakeTab({Name = "99 Night in The Froest"})
     local Tab4o = MakeTab({Name = "Plants vs Brainrot"})


     
------- BUTTON
    
    AddButton(Tab1o, {
     Name = "Redz Hub",
    Callback = function()
	  local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))(Settings)
  end
  })

    AddButton(Tab1o, {
     Name = "Hoho Hub",
    Callback = function()
	  local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
  end
  })


    AddButton(Tab1o, {
     Name = "Banana Hub (get key)",
    Callback = function()
	  local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}
 repeat wait() until game:IsLoaded() and game.Players.LocalPlayer 
getgenv().Key = "Input Key" 
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
  end
  })

   AddButton(Tab3o, {
   Name = "99 Night In The Froest",
  Callback = function()
	local Settings = {
  JoinTeam = ""; -- Pirates/Marines
  Translator = false; -- true/false
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()  
 end
  })


    AddButton(Tab2o, {
   Name = "Kurd Hub",
  Callback = function()
	local Settings = {
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Ninja10908/S4/refs/heads/main/Kurdhub"))()
 end
  })

    AddButton(Tab4o, {
   Name = "Speed Hub X",
  Callback = function()
	local Settings = {
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
 end
  })

  
    AddButton(Tab4o, {
   Name = "Xenith Hub",
  Callback = function()
	local Settings = {
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/d7be76c234d46ce6770101fded39760c.lua"))()
 end
  })

    AddButton(Tab4o, {
   Name = "UB Hub",
  Callback = function()
	local Settings = {
}
loadstring(game:HttpGet("https://gitlab.com/r_soft/main/-/raw/main/LoadUB.lua"))()
  })

    AddButton(Tab4o, {
   Name = "LDS Hub",
  Callback = function()
	local Settings = {
}
loadstring(game:HttpGet('https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/Loader%20LDS%20HUB'))()
  })
