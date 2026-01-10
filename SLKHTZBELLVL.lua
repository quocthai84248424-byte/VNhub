-- [[ ============================================== ]]
-- [[          SEA | MINH HUB  X  VNHUB              ]]
-- [[ ============================================== ]]

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/main.lua"))()

local function InitMainGUI()
    local success, err = pcall(function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local TabIconColor = Color3.fromRGB(0, 170, 255)
        local RepairDelay = 1.5

        local Window = WindUI:CreateWindow({
            Title = "SEA | MINH HUB - Forsaken",
            Icon = "rbxassetid://13110351239",
            Author = "By ⟦ 春秋禪 ⟧ & Sea | Minh",
            Folder = "huyenvutongforsaken",
            Size = UDim2.fromOffset(580, 420),
            Theme = "Dark", 
            Draggable = true,
            AccentColor = TabIconColor 
        })

        Window:EditOpenButton({
            Title = "Open Hub",
            Icon = "rbxassetid://13110351239", 
            Enabled = true,
            Draggable = true,
        })

        local TabInfo = Window:Tab({ Title = "Info", Icon = "info" })
        TabInfo:Paragraph({ Title = "SEA | MINH HUB X VNHUB", Description = "Discord: https://discord.gg/YQBhUfzY" })

        local TabFarm = Window:Tab({ Title = "Farm", Icon = "coins" })
        TabFarm:Toggle({ Title = "Auto Kill Survivor (Teleport)", Callback = function(s) if s then WindUI:Notify("SEA | MINH HUB", "[SẮP CẬP NHẬT 🤓]", 3) end end })
        TabFarm:Toggle({ Title = "Auto Fix Gen (Teleport)", Callback = function(s) if s then WindUI:Notify("SEA | MINH HUB", "[SẮP CẬP NHẬT 🤓]", 3) end end })

        local TabMain = Window:Tab({ Title = "Main", Icon = "house" })
        TabMain:Toggle({
            Title = "Auto Eat Chicken",
            Icon = "rbxassetid://15243444634",
            Callback = function(state)
                _G.AutoEat = state
                task.spawn(function()
                    while _G.AutoEat do
                        local char = LocalPlayer.Character
                        local bp = LocalPlayer:FindFirstChild("Backpack")
                        if char and bp then
                            local tool = bp:FindFirstChild("Chicken Leg") or char:FindFirstChild("Chicken Leg")
                            if tool then
                                if tool.Parent == bp then char.Humanoid:EquipTool(tool) end
                                tool:Activate()
                            end
                        end
                        task.wait(1)
                    end
                end)
            end
        })

        local TabSet = Window:Tab({ Title = "Settings", Icon = "settings" })
        TabSet:Dropdown({ Title = "Theme", Options = {"Dark", "Light", "Aqua"}, Callback = function(t) Window:SetTheme(t) end })

         WindUI:Notify("SEA | MINH HUB", "Shedletsky Edition Ready!", 5)
    end)

    if not success then
        warn("Lỗi UI: " .. tostring(err))
    end
end

task.spawn(InitMainGUI)
