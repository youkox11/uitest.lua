
-- YOUKO HUB | UI TEST V1

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("YoukoTestUI")
if old then
    old:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "YoukoTestUI"
gui.ResetOnSpawn = false
gui.DisplayOrder = 100
gui.Parent = playerGui

local function button(parent, name, size, pos, color)
    local b = Instance.new("TextButton")
    b.Size = size
    b.Position = pos
    b.Text = name
    b.TextColor3 = Color3.new(1, 1, 1)
    b.BackgroundColor3 = color
    b.Font = Enum.Font.GothamBold
    b.TextSize = 15
    b.Parent = parent
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
    return b
end

local open = button(
    gui, "YOUKO HUB",
    UDim2.fromOffset(120, 45),
    UDim2.fromScale(0.03, 0.4),
    Color3.fromRGB(35, 100, 240)
)

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(300, 190)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "YOUKO HUB EXCLUSIVE"
title.TextColor3 = Color3.fromRGB(80, 160, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = frame

local toggle = button(
    frame, "TEST: OFF",
    UDim2.fromOffset(260, 45),
    UDim2.fromOffset(20, 65),
    Color3.fromRGB(180, 45, 45)
)

local close = button(
    frame, "CLOSE MENU",
    UDim2.fromOffset(260, 40),
    UDim2.fromOffset(20, 130),
    Color3.fromRGB(55, 60, 75)
)

local enabled = false

toggle.Activated:Connect(function()
    enabled = not enabled

    toggle.Text = enabled and "TEST: ON" or "TEST: OFF"

    toggle.BackgroundColor3 = enabled
        and Color3.fromRGB(30, 180, 90)
        or Color3.fromRGB(180, 45, 45)
end)

close.Activated:Connect(function()
    frame.Visible = false
    open.Visible = true
end)

open.Activated:Connect(function()
    frame.Visible = true
    open.Visible = false
end)

open.Visible = false

print("[YOUKO HUB] UI TEST LOADED")
