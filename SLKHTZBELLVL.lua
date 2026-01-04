-- [[ AUTHOR: [Tên Tác Giả] | GAME: Forsaken ]]

-- 1. Load Thư viện WindUI
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesuss/WindUI/releases/latest/download/main.lua"))()

-- 2. Tạo Cửa sổ chính (Window)
local Window = WindUI:CreateWindow({
    Title = "Forsaken Hub - Wind Edition", -- Tên GUI
    Icon = "rbxassetid://112407097340606", -- Icon của bro
    Author = "By [Tên Tác Giả]", 
    Folder = "ForsakenConfig", -- Thư mục lưu cấu hình
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark", -- Mặc định màu đen cực sang
    SideBarWidth = 180,
    HideSearchBar = true -- Làm gọn giao diện
})

-- 3. Nút mở lại GUI khi bị tắt (Open Button)
Window:EditOpenButton({
    Title = "Open Forsaken",
    Icon = "rbxassetid://15294026365", -- Icon con bò
    CornerRadius = UDim.new(0, 10),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("00AAFF"), Color3.fromHex("00FF88")), -- Gradient xanh dương-lá
    Enabled = true,
    Draggable = true
})

-- ================= TAB INFO (Dấu chấm than) =================
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

-- ================= TAB FARM (Cây búa) =================
local TabFarm = Window:Tab({ Title = "Farm", Icon = "hammer" })

TabFarm:Toggle({
    Title = "Auto Farm Level",
    Description = "Tự động đánh quái lên cấp",
    Callback = function(state)
        print("Auto Farm is: ", state)
    end
})

-- ================= TAB MAIN (Ngôi nhà) =================
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

-- ================= TAB MISC (Ngôi sao) =================
local TabMisc = Window:Tab({ Title = "Misc", Icon = "star" })

TabMisc:Button({
    Title = "Anti AFK",
    Description = "Giúp bạn không bị văng game",
    Callback = function()
        -- Code Anti AFK ở đây
        WindUI:Notify("Misc", "Anti AFK đã kích hoạt", 2)
    end
})

-- ================= TAB SETTING (Bánh răng) =================
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

-- Thông báo khi script load xong
WindUI:Notify("System", "Script Forsaken đã sẵn sàng!", 5)

