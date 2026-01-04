-- [[ AUTHOR: [ilovedog (hieuzed06)| GAME: Forsaken ]]

-- 1. Load Thư viện WindUI
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesuss/WindUI/releases/latest/download/main.lua"))()

-- 2. Tạo Cửa sổ chính (Window)
local Window = WindUI:CreateWindow({
    Title = "Forsaken Hub - Wind Edition", 
    Icon = "rbxassetid://112407097340606",
    Author = "By [Tên Tác Giả]", 
    Folder = "ForsakenConfig",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark", 
    SideBarWidth = 180,
    HideSearchBar = true 
})


Window:EditOpenButton({
    Title = "Open Forsaken",
    Icon = "rbxassetid://15294026365", 
    CornerRadius = UDim.new(0, 10),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("00AAFF"), Color3.fromHex("00FF88")), 
    Enabled = true,
    Draggable = true
})

local TabInfo = Window:Tab({ Title = "Info", Icon = "info" })

TabInfo:Button({
    Title = "Copy Discord Link",
    Description = "Bấm để copy server hỗ trợ",
    Callback = function()
        setclipboard("https://discord.gg/YQBhUfzY")
        WindUI:Notify("Success", "Đã copy link Discord vào bộ nhớ!", 3)
    end
})

TabInfo:Paragraph({
    Title = "Lời giới thiệu",
    Description = "Đây là script tôi làm ra, mong bạn chơi vui vẻ! Đây là server discord của tôi: https://discord.gg/YQBhUfzY"
})

local TabFarm = Window:Tab({ Title = "Farm", Icon = "hammer" })

TabFarm:Toggle({
    Title = "Auto Farm gen",
    Description = "Tự động sửa máy phát điện",
    Callback = function(state)
        print("Auto Farm is: ", state)
    end
})

local TabMain = Window:Tab({ Title = "Main", Icon = "home" })

TabMain:Slider({
    Title = "WalkSpeed",
    Description = "Chỉnh tốc độ chạy",
    Min = 16,
    Max = 300,
    Default = 16,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

local TabMisc = Window:Tab({ Title = "Misc", Icon = "star" })

TabMisc:Button({
    Title = "Anti AFK",
    Description = "Giúp bạn không bị văng game",
    Callback = functio
       
        WindUI:Notify("Misc", "Anti AFK đã kích hoạt", 2)
    end
})
local TabSetting = Window:Tab({ Title = "Setting", Icon = "settings" })

TabSetting:Dropdown({
    Title = "Change Theme",
    Description = "Chọn màu sắc bạn thích",
    Options = {"Dark", "Light", "Aqua", "Rose"},
    Default = "Dark",
    Callback = function(selected)
        Window:SetTheme(selected)
    end
})

WindUI:Notify("System", "Script Forsaken đã sẵn sàng!", 5)

