-- [[ ============================================== ]]
-- [[          SEA | MINH HUB  X  VNHUB              ]]
-- [[ ============================================== ]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TabIconColor = Color3.fromRGB(0, 170, 255)
local RepairDelay = 1.5

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local function InitMainGUI()
    local Window = WindUI:CreateWindow({
        Title = "SEA | MINH HUB - Forsaken",
        Icon = "rbxassetid://112407097340606",
        Author = "By ⟦ 春秋禪 ⟧ & Sea | Minh",
        Folder = "huyenvutongforsaken",
        Size = UDim2.fromOffset(800, 600),
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
    TabFarm:Paragraph({ Title = "| Killer Farm |", Description = "" })
    TabFarm:Toggle({ Title = "Auto Kill Survivor (Teleport)", Callback = function(s) if s then WindUI:Notify("SEA | MINH HUB", "[CÁC TÍNH NĂNG MỚI SẼ CÓ TRONG TƯƠNG LAI 🤓]", 3) end end })
    TabFarm:Toggle({ Title = "Auto Kill Survivor (Walk)", Callback = function(s) if s then WindUI:Notify("SEA | MINH HUB", "[CÁC TÍNH NĂNG MỚI SẼ CÓ TRONG TƯƠNG LAI 🤓]", 3) end end })
    TabFarm:Separator()
    TabFarm:Paragraph({ Title = "| Survivor Farm |", Description = "" })
    TabFarm:Toggle({ Title = "Auto Fix Gen (Teleport)", Callback = function(s) if s then WindUI:Notify("SEA | MINH HUB", "[CÁC TÍNH NĂNG MỚI SẼ CÓ TRONG TƯƠNG LAI 🤓]", 3) end end })
    TabFarm:Toggle({ Title = "Auto Fix Gen (Walk)", Callback = function(s) if s then WindUI:Notify("SEA | MINH HUB", "[CÁC TÍNH NĂNG MỚI SẼ CÓ TRONG TƯƠNG LAI 🤓]", 3) end end })
    TabFarm:Toggle({ Title = "Generator Repair (Solve Puzzle)", Callback = function(s) if s then WindUI:Notify("SEA | MINH HUB", "[CÁC TÍNH NĂNG MỚI SẼ CÓ TRONG TƯƠNG LAI 🤓]", 3) end end })
    TabFarm:Input({ Title = "Delay: (Sửa máy/Giải đố)", Default = "1.5", Callback = function(t) RepairDelay = tonumber(t) or 1.5 end })

    local TabMain = Window:Tab({ Title = "Main", Icon = "house" })
    TabMain:Toggle({
        Title = "Auto Eat Chicken (Shedletsky)",
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
    TabMain:Slider({ Title = "Hitbox Size", Min = 2, Max = 100, Default = 2, Callback = function(v) end })

    local TabPlayer = Window:Tab({ Title = "Player", Icon = "user" })
    TabPlayer:Paragraph({ Title = "Animations", Description = "" })
    TabPlayer:Toggle({ Title = "Slasher", Callback = function() end })
    TabPlayer:Toggle({ Title = "1x1x1x1", Callback = function() end })
    TabPlayer:Toggle({ Title = "Noli", Callback = function() end })
    TabPlayer:Toggle({ Title = "CoolKid", Callback = function() end })
    TabPlayer:Toggle({ Title = "Guests 666", Callback = function() end })

    local TabVisual = Window:Tab({ Title = "Visual", Icon = "eye" })
    TabVisual:Toggle({ Title = "ESP Players", Callback = function(s) if s then WindUI:Notify("SEA | MINH HUB", "[CÁC TÍNH NĂNG MỚI SẼ CÓ TRONG TƯƠNG LAI 🤓]", 3) end end })
    TabVisual:Toggle({ Title = "ESP Killer", Callback = function(s) if s then WindUI:Notify("SEA | MINH HUB", "[CÁC TÍNH NĂNG MỚI SẼ CÓ TRONG TƯƠNG LAI 🤓]", 3) end end })
    TabVisual:Separator()
    TabVisual:Toggle({ Title = "ESP Generators", Callback = function(s) if s then WindUI:Notify("SEA | MINH HUB", "[CÁC TÍNH NĂNG MỚI SẼ CÓ TRONG TƯƠNG LAI 🤓]", 3) end end })
    TabVisual:Toggle({ Title = "ESP Medkits", Callback = function(s) if s then WindUI:Notify("SEA | MINH HUB", "[CÁC TÍNH NĂNG MỚI SẼ CÓ TRONG TƯƠNG LAI 🤓]", 3) end end })
    TabVisual:Toggle({ Title = "ESP Soda", Callback = function(s) if s then WindUI:Notify("SEA | MINH HUB", "[CÁC TÍNH NĂNG MỚI SẼ CÓ TRONG TƯƠNG LAI 🤓]", 3) end end })

    local TabSet = Window:Tab({ Title = "Settings", Icon = "settings" })
    TabSet:Dropdown({ Title = "Theme", Options = {"Dark", "Light", "Aqua"}, Callback = function(t) Window:SetTheme(t) end })

    WindUI:Notify("SEA | MINH HUB", "Shedletsky Edition Ready!", 5)
end

task.spawn(InitMainGUI)

