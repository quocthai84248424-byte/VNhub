-- [[ ============================================== ]]
-- [[          SEA | MINH HUB X  VNHUB              ]]
-- [[ ============================================== ]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local TabIconColor = Color3.fromRGB(0, 170, 255)
local MainTextColor = Color3.fromRGB(255, 255, 255) 

local AutoFixFast, AutoFixSecurity = false, false
local securityDelay = 3
local HitboxSize = 2
local ESP_Settings = { Killer = false, Players = false, Generators = false }

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local function Notify(title, desc, time)
    WindUI:Notify(title, desc, time or 3)
end

local function InitMainGUI()
    local Window = WindUI:CreateWindow({
        Title = "VN Hub and Sea | Minh Hub - Forsaken",
        Icon = "rbxassetid://112407097340606",
        Author = "By ⟦ 春秋禪 ⟧ & Sea | Minh",
        Folder = "huyenvutongforsaken",
        Size = UDim2.fromOffset(600, 550),
        Theme = "Dark",
        Draggable = true,
        AccentColor = TabIconColor 
    })

    Window:OnClose(function()
        local ConfirmDialog = WindUI:Dialog({
            Title = "Xác nhận",
            Content = "Bạn muốn tắt?",
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
                        game:GetService("CoreGui"):FindFirstChild("WindUI"):Destroy()
                    end
                },
                {
                    Title = "No",
                    Callback = function() end
                }
            }
        })
        ConfirmDialog:Open()
    end)

    Window:EditOpenButton({
        Title = "Open Hub",
        Icon = "rbxassetid://135835616335960", 
        Enabled = true, 
        Draggable = true, 
    })

    local TabInfo = Window:Tab({ Title = "Info", Icon = "info" })
    TabInfo:Paragraph({ 
        Title = "SEA | MINH HUB X VNHUB", 
        Description = "Chào mừng bro! Script đang đc thử nghiệm.\n\nDiscord: https://discord.gg/YQBhUfzY" 
    })

    local TabFarm = Window:Tab({ Title = "Farm", Icon = "coins" })
    
    TabFarm:Toggle({ 
        Title = "Auto Fix Gen (Fast)", 
        Description = "Tự động bay và sửa máy siêu tốc",
        Callback = function(state) AutoFixFast = state end 
    })
    
    TabFarm:Toggle({ 
        Title = "Auto Fix Gen (Security)", 
        Description = "Sửa máy an toàn khi đứng gần",
        Callback = function(state) AutoFixSecurity = state end 
    })

    local TabMain = Window:Tab({ Title = "Main", Icon = "house" })
    
    TabMain:Paragraph({ Title = "Combat System", Description = "Tất cả chữ trong tab này đều màu trắng" })
    
    TabMain:Slider({
        Title = "Hitbox Size",
        Min = 2, Max = 100, Default = 2,
        Callback = function(v)
            HitboxSize = v
            task.spawn(function()
                while task.wait(1) do
                    for _, p in pairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local hrp = p.Character.HumanoidRootPart
                            hrp.Size = Vector3.new(v, v, v)
                            hrp.Transparency = 0.7
                            hrp.CanCollide = false
                        end
                    end
                end
            end)
        end
    })

    local TabMisc = Window:Tab({ Title = "Misc", Icon = "box" })
    
    TabMisc:Toggle({ Title = "ESP Killer", Callback = function(s) end })
    TabMisc:Toggle({ Title = "ESP Players", Callback = function(s) end })
    TabMisc:Toggle({ Title = "ESP Generators", Callback = function(s) end })

    local TabSetting = Window:Tab({ Title = "Setting", Icon = "settings" })
    
    TabSetting:Button({
        Title = "Install Auto-Start",
        Callback = function()
            if writefile then
                writefile("autoexec/VN_Hub_Forsaken.lua", [[loadstring(game:HttpGet("Link_Cua_Bro"))()]])
                Notify("System", "Đã cài đặt vào Delta X!")
            end
        end
    })

    Notify("VN Hub & Sea", "Giao diện Sea | Minh Hub đã sẵn sàng!", 5)
end

task.spawn(function()
    print("SEA | MINH HUB X VNHUB")
    print("Loading: 100%")
    InitMainGUI()
end)

