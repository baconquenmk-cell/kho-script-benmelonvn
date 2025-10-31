loadstring(game:HttpGet(("https://raw.githubusercontent.com/daucobonhi/Ui-Redz-V2/refs/heads/main/UiREDzV2.lua")))()

       local Window = MakeWindow({
         Hub = {
         Title = "BenMelonVN Roblox",
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
       Image = "http://www.roblox.com/asset/?id=139329317387050",
       Size = {60, 60},
       Color = Color3.fromRGB(10, 10, 10),
       Corner = true,
       Stroke = false,
       StrokeColor = Color3.fromRGB(255, 0, 0)
      })
      
------ Tab
     local Tab1o = MakeTab({Name = "Script Blox Fruits"})
     local Tab2o = MakeTab({Name = "Script Other Game"})

     
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
     Name = "Speed Hub X",
    Callback = function()
	  local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
  end
  })

        AddButton(Tab1o, {
     Name = "Master Hub",
    Callback = function()
	  local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/KiddoHiru/BloxFruits/main/MasterHub.lua"))()
  end
  })

       AddButton(Tab2o, {
     Name = "Steal a Brainrot (Find Server)",
    Callback = function()
	  local Settings = {
  JoinTeam = ""; -- Pirates/Marines
  Translator = false; -- true/false
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/049dc8b14207dcca7e0f9812e1960141.lua"))() 
  end
  })



     AddButton(Tab2o, {
     Name = "Steal a Brainrot (Kurd Hub)",
    Callback = function()
	  local Settings = {
  JoinTeam = ""; -- Pirates/Marines
  Translator = false; -- true/false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/Ninja10908/S4/refs/heads/main/Kurdhub"))()
  end
  })

     AddButton(Tab2o, {
     Name = "Steal a Brainrot (Vietnamese Hub)",
    Callback = function()
	  local Settings = {
  JoinTeam = ""; -- Pirates/Marines
  Translator = false; -- true/false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/replit8173/VietnamHub/refs/heads/main/VietnamseHub.lua", true))()  end
  })

     AddButton(Tab2o, {
     Name = "Plants vs Brainrot (Zenith Hub)",
    Callback = function()
	  local Settings = {
  JoinTeam = ""; -- Pirates/Marines
  Translator = false; -- true/false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/isightz/bladeball-scripts/refs/heads/main/ZyxHub", true))()
 end
 })

    AddButton(Tab2o, {
     Name = "Plants vs Brainrot (DUPE)",
    Callback = function()
	  local Settings = {
  JoinTeam = ""; -- Pirates/Marines
  Translator = false; -- true/false
}

loadstring(game:HttpGet("https://pastefy.app/mzVQeKxE/raw"))()
 end
 })