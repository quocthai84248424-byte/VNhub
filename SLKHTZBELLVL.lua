--[[
    AUTHOR: [ilovedog(hieuzed05)]
    UI STYLE: WIND UI (Modern Glass)
    GAME: Forsaken
]]

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WindUI_Forsaken"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

local TweenService = game:GetService("TweenService")

-- ================= THEME & COLORS =================
local Theme = {
    Main = Color3.fromRGB(15, 15, 15),
    Secondary = Color3.fromRGB(25, 25, 25),
    Accent = Color3.fromRGB(0, 150, 255), -- Blue
    Text = Color3.fromRGB(255, 255, 255),
    White = Color3.fromRGB(255, 255, 255),
    Green = Color3.fromRGB(0, 255, 120),
}

-- ================= LOADING SCREEN =================
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Size = UDim2.new(0, 250, 0, 80)
LoadingFrame.Position = UDim2.new(0.5, -125, 0.5, -40)
LoadingFrame.BackgroundColor3 = Theme.Main
LoadingFrame.Parent = ScreenGui
Instance.new("UICorner", LoadingFrame).CornerRadius = UDim.new(0, 12)

local LoadTitle = Instance.new("TextLabel")
LoadTitle.Size = UDim2.new(1, 0, 0, 40)
LoadTitle.Text = "script LOADING"
LoadTitle.TextColor3 = Theme.Text
LoadTitle.BackgroundTransparency = 1
LoadTitle.Font = Enum.Font.GothamBold
LoadTitle.TextSize = 14
LoadTitle.Parent = LoadingFrame

local LoadBar = Instance.new("Frame")
LoadBar.Size = UDim2.new(0, 0, 0, 4)
LoadBar.Position = UDim2.new(0.1, 0, 0.7, 0)
LoadBar.BackgroundColor3 = Theme.Accent
LoadBar.Parent = LoadingFrame
Instance.new("UICorner", LoadBar)

task.spawn(function()
    for i = 0, 100, 1 do
        LoadBar.Size = UDim2.new(0.8 * (i/100), 0, 0, 4)
        LoadTitle.Text = "LOADING " .. i .. "%"
        task.wait(0.03)
    end
    LoadingFrame:Destroy()
    MainFrame.Visible = true
end)

-- ================= MAIN WINDOW =================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 550, 0, 350)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
MainFrame.BackgroundColor3 = Theme.Main
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.ClipsDescendants = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

-- Make Draggable
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true; dragStart = input.Position; startPos = MainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

-- TopBar & Buttons
local CloseBtn = Instance.new("TextButton")
CloseBtn.Text = "×"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.TextColor3 = Theme.Text
CloseBtn.BackgroundTransparency = 1
CloseBtn.TextSize = 25
CloseBtn.Parent = MainFrame

local MiniBtn = Instance.new("TextButton")
MiniBtn.Text = "−"
MiniBtn.Size = UDim2.new(0, 30, 0, 30)
MiniBtn.Position = UDim2.new(1, -65, 0, 5)
MiniBtn.TextColor3 = Theme.Text
MiniBtn.BackgroundTransparency = 1
MiniBtn.TextSize = 25
MiniBtn.Parent = MainFrame

-- Left Panel
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 150, 1, 0)
Sidebar.BackgroundColor3 = Theme.Secondary
Sidebar.Parent = MainFrame
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 12)

local SideList = Instance.new("UIListLayout")
SideList.Parent = Sidebar
SideList.Padding = UDim.new(0, 5)
SideList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.Parent = Sidebar
SidebarPadding.PaddingTop = UDim.new(0, 45)

-- Content Area
local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -170, 1, -50)
Container.Position = UDim2.new(0, 160, 0, 40)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

-- Mini Icon (Cow)
local MiniIcon = Instance.new("ImageButton")
MiniIcon.Size = UDim2.new(0, 60, 0, 60)
MiniIcon.Position = UDim2.new(0, 20, 0, 20)
MiniIcon.Image = "rbxassetid://15294026365"
MiniIcon.BackgroundColor3 = Theme.Main
MiniIcon.Visible = false
MiniIcon.Parent = ScreenGui
Instance.new("UICorner", MiniIcon).CornerRadius = UDim.new(1, 0)

-- ================= WIND UI COMPONENTS =================
local function Clear()
    for _, v in pairs(Container:GetChildren()) do if not v:IsA("UIListLayout") then v:Destroy() end end
end

local function AddToggle(name)
    local TFrame = Instance.new("Frame")
    TFrame.Size = UDim2.new(1, 0, 0, 40)
    TFrame.BackgroundColor3 = Theme.Secondary
    TFrame.Parent = Container
    Instance.new("UICorner", TFrame).CornerRadius = UDim.new(0, 8)

    local TText = Instance.new("TextLabel")
    TText.Size = UDim2.new(0.6, 0, 1, 0)
    TText.Position = UDim2.new(0.05, 0, 0, 0)
    TText.Text = name
    TText.TextColor3 = Theme.Text
    TText.BackgroundTransparency = 1
    TText.TextXAlignment = Enum.TextXAlignment.Left
    TText.Font = Enum.Font.Gotham
    TText.Parent = TFrame

    local TBtn = Instance.new("TextButton")
    TBtn.Size = UDim2.new(0, 40, 0, 20)
    TBtn.Position = UDim2.new(0.85, 0, 0.25, 0)
    TBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TBtn.Text = ""
    TBtn.Parent = TFrame
    Instance.new("UICorner", TBtn).CornerRadius = UDim.new(1, 0)

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0, 16, 0, 16)
    Dot.Position = UDim2.new(0, 2, 0.5, -8)
    Dot.BackgroundColor3 = Theme.White
    Dot.Parent = TBtn
    Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)

    local state = false
    TBtn.MouseButton1Click:Connect(function()
        state = not state
        TweenService:Create(TBtn, TweenInfo.new(0.3), {BackgroundColor3 = state and Theme.Accent or Color3.fromRGB(50, 50, 50)}):Play()
        TweenService:Create(Dot, TweenInfo.new(0.3), {Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)}):Play()
    end)
end

-- ================= TAB SYSTEM =================
local function CreateTab(name, iconId, callback)
    local Tab = Instance.new("TextButton")
    Tab.Size = UDim2.new(0.9, 0, 0, 35)
    Tab.BackgroundColor3 = Theme.Secondary
    Tab.BackgroundTransparency = 1
    Tab.Text = "    " .. name
    Tab.TextColor3 = Theme.Text
    Tab.TextXAlignment = Enum.TextXAlignment.Left
    Tab.Font = Enum.Font.Gotham
    Tab.Parent = Sidebar

    local Icon = Instance.new("ImageLabel")
    Icon.Size = UDim2.new(0, 18, 0, 18)
    Icon.Position = UDim2.new(0.05, 0, 0.5, -9)
    Icon.Image = "rbxassetid://" .. iconId
    Icon.BackgroundTransparency = 1
    Icon.Parent = Tab

    Tab.MouseButton1Click:Connect(callback)
end

-- INFO TAB
CreateTab("Info", "6023426926", function()
    Clear()
    setclipboard("https://discord.gg/YQBhUfzY")
    local L = Instance.new("TextLabel", Container)
    L.Size = UDim2.new(1, 0, 1, 0)
    L.Text = "Đây là script tôi làm ra, mong bạn chơi vui vẻ!\n\nDiscord: https://discord.gg/YQBhUfzY\n(Link đã tự động copy)"
    L.TextColor3 = Theme.Text
    L.BackgroundTransparency = 1
    L.TextWrapped = true
    L.Font = Enum.Font.Gotham
end)

-- FARM TAB
CreateTab("Farm", "6035040600", function()
    Clear()
    AddToggle("Auto Quest")
    AddToggle("Auto Mob")
    AddToggle("Auto Farm Chest")
end)

-- SETTING TAB (Change Theme)
CreateTab("Setting", "6031280793", function()
    Clear()
    local function ColorOpt(name, color, key)
        local B = Instance.new("TextButton", Container)
        B.Size = UDim2.new(1, 0, 0, 35)
        B.BackgroundColor3 = color
        B.Text = name
        B.TextColor3 = Theme.White
        B.Font = Enum.Font.GothamBold
        Instance.new("UICorner", B)
        B.MouseButton1Click:Connect(function()
            Theme.Accent = color
            if key == "White" then
                 MainFrame.BackgroundColor3 = Theme.White
                 Sidebar.BackgroundColor3 = Color3.fromRGB(230,230,230)
                 Theme.Text = Color3.fromRGB(30,30,30)
            else
                 MainFrame.BackgroundColor3 = Theme.Main
                 Sidebar.BackgroundColor3 = Theme.Secondary
                 Theme.Text = Theme.White
            end
        end)
    end
    ColorOpt("BLUE THEME", Color3.fromRGB(0, 150, 255), "Blue")
    ColorOpt("GREEN THEME", Color3.fromRGB(0, 255, 120), "Green")
    ColorOpt("WHITE MODE", Color3.fromRGB(200, 200, 200), "White")
    ColorOpt("DARK MODE", Color3.fromRGB(30, 30, 30), "Dark")
end)

-- Tab Main & Misc
CreateTab("Main", "6034289542", function() Clear() AddToggle("Infinite Jump") AddToggle("No Clip") end)
CreateTab("Misc", "6031764658", function() Clear() AddToggle("FPS Boost") AddToggle("Anti AFK") end)

local Layout = Instance.new("UIListLayout", Container)
Layout.Padding = UDim.new(0, 8)

-- Controls
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
MiniBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false MiniIcon.Visible = true end)
MiniIcon.MouseButton1Click:Connect(function() MainFrame.Visible = true MiniIcon.Visible = false end)

