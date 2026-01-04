local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Huyền Vũ Tông - Forsaken",
    Icon = "rbxassetid://84155435407343",
    Author = "BY ⟦ 春秋禪 ⟧ https://discord.gg/YQBhUfzY",
    Folder = "huyenvutongforsaken",
    
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
})

local TabInfo = Window:Tab({ Title = "Info", Icon = "info" })

TabInfo:Button({
    Title = "Copy Discord Link",
    Description = "Copy link Discord",
    Callback = function()
        setclipboard("https://discord.gg/YQBhUfzY")
        Notify("Info", "Đã copy link Discord!")
    end
})

TabInfo:Paragraph({
    Title = "Đây là script tôi làm ra, mong bạn chơi vui vẻ!",
    Description = "vui"
})
