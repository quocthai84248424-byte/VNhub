-- [[ VN Hub and Sea | Game: Forsaken ]]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local AutoFinishGen = false
local genDelay = 3
local solveGeneratorCooldown = false

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local function Notify(title, desc, time)
    WindUI:Notify(title, desc, time or 3)
end

local function getClosestGenerator()
    local closest, dist = nil, math.huge
    for _, v in pairs(Workspace:GetChildren()) do
        if v.Name == "Generator" and v:FindFirstChild("HumanoidRootPart") then
            local d = (LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
            if d < dist then
                closest = v
                dist = d
            end
        end
    end
    return closest
end

local Window = WindUI:CreateWindow({
    Title = "VN Hub and Sea | Minh Hub - Forsaken",
    Icon = "rbxassetid://112407097340606",
    Author = "By ⟦ 春秋禪 ⟧ & Sea | Minh",
    Folder = "huyenvutongforsaken",
    Size = UDim2.fromOffset(580, 460), 
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 180,
    HideSearchBar = true,
})

Window:EditOpenButton({
    Title = "Open Huyền Vũ Tông",
    Icon = "monitor",
    CornerRadius = UDim.new(0,12),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
    Enabled = true, Dragable = true
})
local TabInfo = Window:Tab({ Title = "Info", Icon = "info" })

TabInfo:Button({
    Title = "Copy Discord VN Hub",
    Callback = function()
        setclipboard("https://discord.gg/YQBhUfzY")
        Notify("Success", "Đã copy link VN Hub!")
    end
})

TabInfo:Button({
    Title = "Copy Discord Sea | Minh Hub",
    Callback = function()
        setclipboard("https://discord.gg/nHnsJF9TbN")
        Notify("Success", "Đã copy link Sea Hub!")
    end
})

TabInfo:Paragraph({
    Title = "Lời giới thiệu",
    Description = "Đây là script tôi làm ra, mong bạn chơi vui vẻ! Chúc bạn có những giây phút giải trí tuyệt vời."
})


local TabMain = Window:Tab({ Title = "Main", Icon = "house" })

TabMain:Button({
    Title = "Finish Closest Generator",
    Description = "Hoàn thành máy phát điện gần nhất ngay lập tức",
    Callback = function()
        if solveGeneratorCooldown or AutoFinishGen then 
            return Notify("Error", "Đang trong cooldown hoặc đang bật Auto!") 
        end
        
        local gen = getClosestGenerator()
        if gen and gen:FindFirstChild("Remotes") then
            gen.Remotes.RE:FireServer()
            solveGeneratorCooldown = true
            task.delay(genDelay, function() solveGeneratorCooldown = false end)
            Notify("Generator", "Đã hoàn thành máy phát điện!")
        else
            Notify("Warning", "Không tìm thấy máy phát điện nào gần đây.")
        end
    end
})

TabMain:Toggle({
    Title = "Auto Finish Generator",
    Default = false,
    Callback = function(state)
        AutoFinishGen = state
        if state then
            task.spawn(function()
                while AutoFinishGen do
                    local gen = getClosestGenerator()
                    if gen and gen:FindFirstChild("Remotes") then
                        gen.Remotes.RE:FireServer()
                        task.wait(genDelay)
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

TabMain:Input({
    Title = "Generator Delay",
    Placeholder = "Mặc định: 3",
    Callback = function(input)
        genDelay = tonumber(input) or 3
    end
})
local TabMisc = Window:Tab({ Title = "Misc", Icon = "star" })

TabMisc:Toggle({
    Title = "Always Show Chat",
    Callback = function(state)
        local chatConfig = game:GetService("TextChatService"):FindFirstChildOfClass("ChatWindowConfiguration")
        if chatConfig then chatConfig.Enabled = state end
    end
})
local TabSetting = Window:Tab({ Title = "Setting", Icon = "settings" })

TabSetting:Dropdown({
    Title = "Giao diện",
    Options = {"Dark", "Light", "Aqua", "Rose"},
    Default = "Dark",
    Callback = function(t) Window:SetTheme(t) end
})

Notify("VN Hub & Sea", "Script Loaded Successfully!", 4)

