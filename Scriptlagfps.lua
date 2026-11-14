-- Ultra FPS Booster & Light Optimizer (Ultimate Edition + 180 FPS Cap, CastShadow, HUD, Resolution & Ultra Boost)
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Xóa GUI cũ để tránh trùng lặp
if playerGui:FindFirstChild("UltraFPSGui") then
    playerGui.UltraFPSGui:Destroy()
end
if playerGui:FindFirstChild("FpsPingHud") then
    playerGui.FpsPingHud:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local FPSLabel = Instance.new("TextLabel")

local MinimizeBtn = Instance.new("TextButton")
local MinCorner = Instance.new("UICorner")

-- Khung HUD hiển thị FPS & Ping ngoài màn hình (Bật/Tắt)
local HudGui = Instance.new("ScreenGui")
HudGui.Name = "FpsPingHud"
HudGui.Parent = playerGui
HudGui.ResetOnSpawn = false
HudGui.Enabled = false

local HudLabel = Instance.new("TextLabel")
HudLabel.Parent = HudGui
HudLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HudLabel.BackgroundTransparency = 0.4
HudLabel.Position = UDim2.new(0, 15, 0, 15)
HudLabel.Size = UDim2.new(0, 155, 0, 28)
HudLabel.Font = Enum.Font.GothamBold
HudLabel.Text = "FPS: 60 | Ping: 0ms"
HudLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
HudLabel.TextSize = 11

local HudCorner = Instance.new("UICorner")
HudCorner.CornerRadius = UDim.new(0, 6)
HudCorner.Parent = HudLabel

-- Các nút bấm
local ToggleScriptBtn = Instance.new("TextButton")
local RemoveTexBtn = Instance.new("TextButton")
local BrightBtn = Instance.new("TextButton")
local GreySkyBtn = Instance.new("TextButton")
local RemoveFXBtn = Instance.new("TextButton")
local NoShadowBtn = Instance.new("TextButton")
local LowGraphBtn = Instance.new("TextButton")
local CleanBtn = Instance.new("TextButton")
local FpsCapBtn = Instance.new("TextButton")
local FpsPingBtn = Instance.new("TextButton")
local ResolutionBtn = Instance.new("TextButton")
local UltraBoostBtn = Instance.new("TextButton")

ScreenGui.Name = "UltraFPSGui"
ScreenGui.Parent = playerGui
ScreenGui.ResetOnSpawn = false

-- Giao diện chính
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -110, 0.2, 0)
MainFrame.Size = UDim2.new(0, 220, 0, 385)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 4)
Title.Size = UDim2.new(1, 0, 0, 20)
Title.Font = Enum.Font.GothamBold
Title.Text = "⚡ ULTRA FPS (ULTIMATE)"
Title.TextColor3 = Color3.fromRGB(0, 255, 170)
Title.TextSize = 11

MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Parent = MainFrame
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeBtn.Position = UDim2.new(1, -24, 0, 4)
MinimizeBtn.Size = UDim2.new(0, 18, 0, 18)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.TextSize = 11
MinCorner.CornerRadius = UDim.new(0, 4)
MinCorner.Parent = MinimizeBtn

FPSLabel.Name = "FPSLabel"
FPSLabel.Parent = MainFrame
FPSLabel.BackgroundTransparency = 1
FPSLabel.Position = UDim2.new(0, 0, 0, 22)
FPSLabel.Size = UDim2.new(1, 0, 0, 16)
FPSLabel.Font = Enum.Font.Gotham
FPSLabel.Text = "FPS: 60"
FPSLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FPSLabel.TextSize = 10

-- Hàm tạo nút bấm gọn gàng
local function styleButton(btn, yPos, text, color)
    btn.Parent = MainFrame
    btn.BackgroundColor3 = color
    btn.Position = UDim2.new(0.06, 0, 0, yPos)
    btn.Size = UDim2.new(0.88, 0, 0, 25)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 9
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
end

styleButton(ToggleScriptBtn, 40, "💥 GIẢM LAG: [OFF]", Color3.fromRGB(200, 40, 40))
styleButton(RemoveTexBtn, 68, "🖼️ XÓA TEXTURE / ẢNH", Color3.fromRGB(180, 40, 180))
styleButton(BrightBtn, 96, "💡 SÁNG BẢN ĐỒ DỊU: [OFF]", Color3.fromRGB(230, 150, 0))
styleButton(GreySkyBtn, 124, "☁️ BẦU TRỜI XÁM: [OFF]", Color3.fromRGB(80, 80, 80))
styleButton(RemoveFXBtn, 152, "🔥 XÓA HIỆU ỨNG THỪA", Color3.fromRGB(220, 100, 0))
styleButton(NoShadowBtn, 180, "🌑 TẮT BÓNG VẬT THỂ (CASTSHADOW)", Color3.fromRGB(120, 40, 160))
styleButton(LowGraphBtn, 208, "📉 ÉP ĐỒ HỌA MỨC THẤP NHẤT", Color3.fromRGB(0, 100, 150))
styleButton(CleanBtn, 236, "🧹 DỌN RÁC & TỐI ƯU RAM", Color3.fromRGB(0, 140, 180))
styleButton(FpsCapBtn, 264, "⚡ KHÓA 180 FPS", Color3.fromRGB(50, 120, 200))
styleButton(FpsPingBtn, 292, "📊 HIỆN FPS & PING HUD: [OFF]", Color3.fromRGB(0, 120, 150))
styleButton(ResolutionBtn, 320, "📺 ĐỘ PHÂN GIẢI 1680x1050: [OFF]", Color3.fromRGB(100, 50, 180))
styleButton(UltraBoostBtn, 350, "🚀 SIÊU TĂNG TỐC & KHỬ DELAY: [OFF]", Color3.fromRGB(200, 100, 0))

-- Thu nhỏ / Mở rộng GUI
local isOpen = true
MinimizeBtn.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    for _, child in pairs(MainFrame:GetChildren()) do
        if child ~= Title and child ~= MinimizeBtn and child ~= UICorner then
            child.Visible = isOpen
        end
    end
    if isOpen then
        MainFrame.Size = UDim2.new(0, 220, 0, 385)
        MinimizeBtn.Text = "-"
    else
        MainFrame.Size = UDim2.new(0, 220, 0, 30)
        MinimizeBtn.Text = "+"
    end
end)

-- Phím tắt ẩn hiện bảng (RightShift)
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

-- Đếm FPS & Ping thực tế
local RunService = game:GetService("RunService")
local lastTick = tick()
local frameCount = 0

RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local currentTick = tick()
    if currentTick - lastTick >= 1 then
        local currentFps = math.floor(frameCount / (currentTick - lastTick))
        FPSLabel.Text = "FPS: " .. tostring(currentFps)
        
        local currentPing = 0
        pcall(function()
            currentPing = math.floor((player:GetNetworkPing() * 1000) + 0.5)
        end)
        
        if HudGui.Enabled then
            HudLabel.Text = "FPS: " .. currentFps .. " | Ping: " .. currentPing .. "ms"
        end
        
        frameCount = 0
        lastTick = currentTick
    end
end)

-- Bật / Tắt HUD hiển thị FPS và Ping trên màn hình
local isHudOn = false
FpsPingBtn.MouseButton1Click:Connect(function()
    isHudOn = not isHudOn
    HudGui.Enabled = isHudOn
    if isHudOn then
        FpsPingBtn.Text = "📊 HIỆN FPS & PING HUD: [ON]"
        FpsPingBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
    else
        FpsPingBtn.Text = "📊 HIỆN FPS & PING HUD: [OFF]"
        FpsPingBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 150)
    end
end)

-- Các chức năng tối ưu
local isLagReducerOn = false
ToggleScriptBtn.MouseButton1Click:Connect(function()
    isLagReducerOn = not isLagReducerOn
    local Lighting = game:GetService("Lighting")

    if isLagReducerOn then
        ToggleScriptBtn.Text = "💥 GIẢM LAG: [ON]"
        ToggleScriptBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
        Lighting.GlobalShadows = false
        Lighting.Technology = Enum.Technology.Compatibility
        for _, v in pairs(Lighting:GetChildren()) do
            if v:IsA("PostEffect") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect") then
                v.Enabled = false
            end
        end
    else
        ToggleScriptBtn.Text = "💥 GIẢM LAG: [OFF]"
        ToggleScriptBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
        Lighting.GlobalShadows = true
    end
end)

RemoveTexBtn.MouseButton1Click:Connect(function()
    RemoveTexBtn.Text = "ĐÃ XÓA TEXTURE!"
    RemoveTexBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Texture") or v:IsA("Decal") then
            v:Destroy()
        elseif v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
        end
    end
end)

local isMaxBright = false
BrightBtn.MouseButton1Click:Connect(function()
    isMaxBright = not isMaxBright
    local Lighting = game:GetService("Lighting")
    if isMaxBright then
        BrightBtn.Text = "💡 SÁNG DỊU: [ON]"
        BrightBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 220)
        Lighting.Brightness = 1.5
        Lighting.ClockTime = 14
        Lighting.OutdoorAmbient = Color3.fromRGB(180, 180, 180)
    else
        BrightBtn.Text = "💡 SÁNG BẢN ĐỒ DỊU: [OFF]"
        BrightBtn.BackgroundColor3 = Color3.fromRGB(230, 150, 0)
        Lighting.Brightness = 1
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end
end)

local isGreySky = false
GreySkyBtn.MouseButton1Click:Connect(function()
    isGreySky = not isGreySky
    local Lighting = game:GetService("Lighting")
    if isGreySky then
        GreySkyBtn.Text = "☁️ BẦU TRỜI XÁM: [ON]"
        GreySkyBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
        for _, v in pairs(Lighting:GetChildren()) do
            if v:IsA("Sky") or v:IsA("Atmosphere") then
                v:Destroy()
            end
        end
    else
        GreySkyBtn.Text = "☁️ BẦU TRỜI XÁM: [OFF]"
        GreySkyBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end
end)

RemoveFXBtn.MouseButton1Click:Connect(function()
    RemoveFXBtn.Text = "ĐÃ XÓA HIỆU ỨNG!"
    RemoveFXBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Smoke") or v:IsA("Fire") then
            v:Destroy()
        end
    end
end)

NoShadowBtn.MouseButton1Click:Connect(function()
    NoShadowBtn.Text = "ĐÃ TẮT BÓNG VẬT THỂ!"
    NoShadowBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CastShadow = false
        end
    end
end)

LowGraphBtn.MouseButton1Click:Connect(function()
    LowGraphBtn.Text = "ĐÃ ÉP ĐỒ HỌA THẤP NHẤT!"
    LowGraphBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
    pcall(function()
        UserSettings():GetService("UserGameSettings").SavedQualityLevel = Enum.QualityLevel.Level01
    end)
end)

CleanBtn.MouseButton1Click:Connect(function()
    CleanBtn.Text = "ĐÃ DỌN RÁC!"
    CleanBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
    collectgarbage("collect")
end)

FpsCapBtn.MouseButton1Click:Connect(function()
    if setfpscap then
        setfpscap(180)
        FpsCapBtn.Text = "⚡ ĐÃ KHÓA 180 FPS"
        FpsCapBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
    else
        FpsCapBtn.Text = "❌ EXECUTOR KHÔNG HỖ TRỢ"
    end
end)

-- TÍNH NĂNG ĐỘ PHÂN GIẢI 1680x1050
local isResOn = false
local resConnection = nil
ResolutionBtn.MouseButton1Click:Connect(function()
    isResOn = not isResOn
    local Camera = workspace.CurrentCamera
    if isResOn then
        ResolutionBtn.Text = "📺 1680x1050: [ON]"
        ResolutionBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
        resConnection = RunService.RenderStepped:Connect(function()
            if Camera then
                Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.875, 0, 0, 0, 1)
            end
        end)
    else
        ResolutionBtn.Text = "📺 ĐỘ PHÂN GIẢI 1680x1050: [OFF]"
        ResolutionBtn.BackgroundColor3 = Color3.fromRGB(100, 50, 180)
        if resConnection then
            resConnection:Disconnect()
            resConnection = nil
        end
    end
end)

-- TÍNH NĂNG SIÊU TĂNG TỐC & KHỬ DELAY
local isUltraBoostOn = false
UltraBoostBtn.MouseButton1Click:Connect(function()
    isUltraBoostOn = not isUltraBoostOn
    local Lighting = game:GetService("Lighting")
    local Terrain = workspace:FindFirstChildOfClass("Terrain")

    if isUltraBoostOn then
        UltraBoostBtn.Text = "🚀 SIÊU TĂNG TỐC & KHỬ DELAY: [ON]"
        UltraBoostBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
        
        Lighting.GlobalShadows = false
        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        Lighting.ShadowSoftness = 0
        
        if Terrain then
            Terrain.WaterWaveSize = 0
            Terrain.WaterWaveSpeed = 0
            Terrain.WaterTransparency = 1
            Terrain.WaterReflectance = 0
        end

        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Explosion") or v:IsA("Sparkles") then
                v:Destroy()
            end
        end
    else
        UltraBoostBtn.Text = "🚀 SIÊU TĂNG TỐC & KHỬ DELAY: [OFF]"
        UltraBoostBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 0)
        Lighting.GlobalShadows = true
    end
end)