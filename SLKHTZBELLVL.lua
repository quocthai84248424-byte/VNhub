--[[
    AUTHOR: [Tên Tác Giả]
    GAME: Forsaken
    FEATURES: Loading 0-100%, Multi-Tabs, Auto-Copy, Theme Changer, UI Elements
]]

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ForsakenV3"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- ================= HỆ THỐNG MÀU SẮC (THEME) =================
local Themes = {
    ["Black"] = {Bg = Color3.fromRGB(20, 20, 20), Text = Color3.fromRGB(255, 255, 255), Accent = Color3.fromRGB(0, 120, 255), Panel = Color3.fromRGB(30, 30, 30)},
    ["White"] = {Bg = Color3.fromRGB(240, 240, 240), Text = Color3.fromRGB(30, 30, 30), Accent = Color3.fromRGB(0, 80, 200), Panel = Color3.fromRGB(210, 210, 210)},
    ["Blue"] = {Bg = Color3.fromRGB(0, 30, 60), Text = Color3.fromRGB(255, 255, 255), Accent = Color3.fromRGB(0, 200, 255), Panel = Color3.fromRGB(0, 50, 90)},
    ["Green"] = {Bg = Color3.fromRGB(10, 40, 10), Text = Color3.fromRGB(255, 255, 255), Accent = Color3.fromRGB(0, 255, 100), Panel = Color3.fromRGB(20, 60, 20)}
}

local CurrentTheme = Themes.Black

-- ================= LOADING SCREEN (0% - 100%) =================
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Size = UDim2.new(0, 300, 0, 120)
LoadingFrame.Position = UDim2.new(0.5, -150, 0.5, -60)
LoadingFrame.BackgroundColor3 = Themes.Black.Bg
LoadingFrame.Parent = ScreenGui
Instance.new("UICorner", LoadingFrame)

local LoadTitle = Instance.new("TextLabel")
LoadTitle.Size = UDim2.new(1, 0, 0, 40)
LoadTitle.Text = "FORSAKEN LOADING..."
LoadTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Font = Enum.Font.SourceSansBold
LoadTitle.TextSize = 20
LoadTitle.Parent = LoadingFrame

local BarBg = Instance.new("Frame")
BarBg.Size = UDim2.new(0.8, 0, 0, 8)
BarBg.Position = UDim2.new(0.1, 0, 0.6, 0)
BarBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BarBg.Parent = LoadingFrame
Instance.new("UICorner", BarBg)

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Themes.Black.Accent
BarFill.Parent = BarBg
Instance.new("UICorner", BarFill)

local Perc = Instance.new("TextLabel")
Perc.Size = UDim2.new(1, 0, 0, 20)
Perc.Position = UDim2.new(0, 0, 0.8, 0)
Perc.Text = "0%"
Perc.TextColor3 = Color3.fromRGB(255, 255, 255)
Perc.BackgroundTransparency = 1
Perc.Parent = LoadingFrame

task.spawn(function()
    for i = 0, 100, 2 do
        BarFill.Size = UDim2.new(i/100, 0, 1, 0)
        Perc.Text = i .. "%"
        task.wait(0.04)
    end
    LoadingFrame:Destroy()
    MainFrame.Visible = true
end)

-- ================= MAIN GUI CONSTRUCTION =================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 520, 0, 320)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -160)
MainFrame.BackgroundColor3 = CurrentTheme.Bg
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame)

local LeftPanel = Instance.new("Frame")
LeftPanel.Size = UDim2.new(0, 130, 1, -40)
LeftPanel.Position = UDim2.new(0, 10, 0, 35)
LeftPanel.BackgroundColor3 = CurrentTheme.Panel
LeftPanel.Parent = MainFrame
Instance.new("UICorner", LeftPanel)

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BackgroundTransparency = 1
TopBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.5, 0, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Text = "FORSAKEN HUB | By Author"
Title.TextColor3 = CurrentTheme.Text
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Text = "X"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Parent = MainFrame
Instance.new("UICorner", CloseBtn)

local MiniBtn = Instance.new("TextButton")
MiniBtn.Text = "-"
MiniBtn.Size = UDim2.new(0, 30, 0, 30)
MiniBtn.Position = UDim2.new(1, -70, 0, 5)
MiniBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MiniBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MiniBtn.Parent = MainFrame
Instance.new("UICorner", MiniBtn)

-- Mini GUI Icon
local MiniIcon = Instance.new("ImageButton")
MiniIcon.Size = UDim2.new(0, 60, 0, 60)
MiniIcon.Position = UDim2.new(0, 20, 0.5, -30)
MiniIcon.Image = "rbxassetid://15294026365" -- Con bò
MiniIcon.Visible = false
MiniIcon.BackgroundColor3 = CurrentTheme.Bg
MiniIcon.Parent = ScreenGui
Instance.new("UICorner", MiniIcon).CornerRadius = UDim.new(1,0)

-- Content Frame
local Container = Instance.new("ScrollingFrame")
Container.Size = UDim2.new(0, 360, 0, 260)
Container.Position = UDim2.new(0, 150, 0, 45)
Container.BackgroundTransparency = 1
Container.ScrollBarThickness = 4
Container.Parent = MainFrame

local UIStack = Instance.new("UIListLayout")
UIStack.Parent = Container
UIStack.Padding = UDim.new(0, 8)

-- ================= FUNCTIONS ĐỔI MÀU =================
local function ApplyTheme(themeName)
    local t = Themes[themeName]
    CurrentTheme = t
    MainFrame.BackgroundColor3 = t.Bg
    LeftPanel.BackgroundColor3 = t.Panel
    Title.TextColor3 = t.Text
    MiniIcon.BackgroundColor3 = t.Bg
    -- Cập nhật màu chữ cho các thành phần con
    for _, v in pairs(MainFrame:GetDescendants()) do
        if v:IsA("TextLabel") or v:IsA("TextButton") then
            if v ~= CloseBtn and v ~= MiniBtn then
                v.TextColor3 = t.Text
            end
        end
    end
end

-- ================= UI ELEMENTS GENERATOR =================
local function ClearContainer()
    for _, v in pairs(Container:GetChildren()) do
        if not v:IsA("UIListLayout") then v:Destroy() end
    end
end

local function AddToggle(text)
    local TFrame = Instance.new("Frame")
    TFrame.Size = UDim2.new(0.95, 0, 0, 35)
    TFrame.BackgroundTransparency = 1
    TFrame.Parent = Container
    
    local TText = Instance.new("TextLabel")
    TText.Size = UDim2.new(0.7, 0, 1, 0)
    TText.Text = text
    TText.TextColor3 = CurrentTheme.Text
    TText.BackgroundTransparency = 1
    TText.TextXAlignment = Enum.TextXAlignment.Left
    TText.Parent = TFrame

    local TButton = Instance.new("TextButton")
    TButton.Size = UDim2.new(0, 45, 0, 22)
    TButton.Position = UDim2.new(0.8, 0, 0.2, 0)
    TButton.BackgroundColor3 = CurrentTheme.Accent
    TButton.Text = "ON"
    TButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TButton.Parent = TFrame
    Instance.new("UICorner", TButton)
end

-- ================= TAB SYSTEM =================
local function CreateTab(name, iconId, callback, order)
    local TBtn = Instance.new("TextButton")
    TBtn.Size = UDim2.new(1, 0, 0, 40)
    TBtn.BackgroundTransparency = 1
    TBtn.Text = "  " .. name
    TBtn.TextColor3 = CurrentTheme.Text
    TBtn.TextXAlignment = Enum.TextXAlignment.Left
    TBtn.LayoutOrder = order
    TBtn.Parent = LeftPanel

    local Icon = Instance.new("ImageLabel")
    Icon.Size = UDim2.new(0, 20, 0, 20)
    Icon.Position = UDim2.new(0.8, 0, 0.25, 0)
    Icon.Image = "rbxassetid://" .. iconId
    Icon.BackgroundTransparency = 1
    Icon.Parent = TBtn

    TBtn.MouseButton1Click:Connect(callback)
end

-- Tab Info
CreateTab("Info", "6023426926", function()
    ClearContainer()
    setclipboard("https://discord.gg/YQBhUfzY")
    local L = Instance.new("TextLabel", Container)
    L.Size = UDim2.new(1, 0, 0, 100)
    L.Text = "Chào mừng bro! Đây là script tôi làm ra.\n\nDiscord: https://discord.gg/YQBhUfzY\n(Link đã được copy!)"
    L.TextColor3 = CurrentTheme.Text
    L.BackgroundTransparency = 1
    L.TextWrapped = true
end, 1)

-- Tab Farm
CreateTab("Farm", "6035040600", function()
    ClearContainer()
    AddToggle("Auto Farm Level")
    AddToggle("Auto Collect Items")
end, 2)

-- Tab Setting (Chỉnh màu)
CreateTab("Setting", "6031280793", function()
    ClearContainer()
    local Label = Instance.new("TextLabel", Container)
    Label.Text = "CHỌN MÀU GUI:"
    Label.TextColor3 = CurrentTheme.Text
    Label.Size = UDim2.new(1, 0, 0, 30)
    Label.BackgroundTransparency = 1

    local function CreateColorBtn(name, themeKey)
        local b = Instance.new("TextButton", Container)
        b.Size = UDim2.new(0.9, 0, 0, 35)
        b.Text = name
        b.BackgroundColor3 = Themes[themeKey].Bg
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() ApplyTheme(themeKey) end)
    end

    CreateColorBtn("TRẮNG (White Mode)", "White")
    CreateColorBtn("XANH DƯƠNG (Blue Sea)", "Blue")
    CreateColorBtn("XANH LÁ (Matrix)", "Green")
    CreateColorBtn("ĐEN (Mặc định)", "Black")
end, 5)

-- Main & Misc (Tương tự...)
CreateTab("Main", "6034289542", function() ClearContainer() AddToggle("Speed Hack") end, 3)
CreateTab("Misc", "6031764658", function() ClearContainer() AddToggle("Anti AFK") end, 4)

-- Nút điều khiển
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
MiniBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false MiniIcon.Visible = true end)
MiniIcon.MouseButton1Click:Connect(function() MainFrame.Visible = true MiniIcon.Visible = false end)

-- Mở mặc định Tab Info
ApplyTheme("Black")
