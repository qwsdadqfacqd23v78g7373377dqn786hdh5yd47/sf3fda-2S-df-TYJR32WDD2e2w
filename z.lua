local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- Konstanta GUI
local GUI_CONFIG = {
    MAIN_COLOR = Color3.fromRGB(32, 32, 32),
    ACCENT_COLOR = Color3.fromRGB(0, 170, 255),
    TEXT_COLOR = Color3.fromRGB(255, 255, 255),
    FONT = Enum.Font.GothamSemibold
}

-- Fungsi untuk membuat GUI
local function createKeySystemGUI()
    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "KeySystemGUI"
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 300, 0, 400)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    mainFrame.BackgroundColor3 = GUI_CONFIG.MAIN_COLOR
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui

    -- Rounded Corners
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 10)
    uiCorner.Parent = mainFrame

    -- Profile Picture Frame
    local profileFrame = Instance.new("Frame")
    profileFrame.Name = "ProfileFrame"
    profileFrame.Size = UDim2.new(0, 100, 0, 100)
    profileFrame.Position = UDim2.new(0.5, -50, 0, 20)
    profileFrame.BackgroundColor3 = GUI_CONFIG.ACCENT_COLOR
    profileFrame.Parent = mainFrame

    local profileCorner = Instance.new("UICorner")
    profileCorner.CornerRadius = UDim.new(1, 0)
    profileCorner.Parent = profileFrame

    -- Profile Picture (Player Image)
    local profileImage = Instance.new("ImageLabel")
    profileImage.Name = "ProfileImage"
    profileImage.Size = UDim2.new(1, 0, 1, 0)
    profileImage.BackgroundTransparency = 1
    profileImage.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
    profileImage.Parent = profileFrame

    local imageCorner = Instance.new("UICorner")
    imageCorner.CornerRadius = UDim.new(1, 0)
    imageCorner.Parent = profileImage

    -- Username Label
    local usernameLabel = Instance.new("TextLabel")
    usernameLabel.Name = "UsernameLabel"
    usernameLabel.Size = UDim2.new(1, 0, 0, 30)
    usernameLabel.Position = UDim2.new(0, 0, 0, 130)
    usernameLabel.BackgroundTransparency = 1
    usernameLabel.Font = GUI_CONFIG.FONT
    usernameLabel.Text = LocalPlayer.Name
    usernameLabel.TextColor3 = GUI_CONFIG.TEXT_COLOR
    usernameLabel.TextSize = 18
    usernameLabel.Parent = mainFrame

    -- Key Input Box
    local keyBox = Instance.new("TextBox")
    keyBox.Name = "KeyBox"
    keyBox.Size = UDim2.new(0.8, 0, 0, 40)
    keyBox.Position = UDim2.new(0.1, 0, 0.5, -20)
    keyBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    keyBox.BorderSizePixel = 0
    keyBox.Font = GUI_CONFIG.FONT
    keyBox.PlaceholderText = "Enter Key..."
    keyBox.Text = ""
    keyBox.TextColor3 = GUI_CONFIG.TEXT_COLOR
    keyBox.TextSize = 14
    keyBox.Parent = mainFrame

    local keyBoxCorner = Instance.new("UICorner")
    keyBoxCorner.CornerRadius = UDim.new(0, 5)
    keyBoxCorner.Parent = keyBox

    -- Submit Button
    local submitButton = Instance.new("TextButton")
    submitButton.Name = "SubmitButton"
    submitButton.Size = UDim2.new(0.8, 0, 0, 40)
    submitButton.Position = UDim2.new(0.1, 0, 0.7, -20)
    submitButton.BackgroundColor3 = GUI_CONFIG.ACCENT_COLOR
    submitButton.BorderSizePixel = 0
    submitButton.Font = GUI_CONFIG.FONT
    submitButton.Text = "Submit Key"
    submitButton.TextColor3 = GUI_CONFIG.TEXT_COLOR
    submitButton.TextSize = 16
    submitButton.Parent = mainFrame

    local submitCorner = Instance.new("UICorner")
    submitCorner.CornerRadius = UDim.new(0, 5)
    submitCorner.Parent = submitButton

    -- Status Label
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Name = "StatusLabel"
    statusLabel.Size = UDim2.new(0.8, 0, 0, 30)
    statusLabel.Position = UDim2.new(0.1, 0, 0.85, -15)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Font = GUI_CONFIG.FONT
    statusLabel.Text = ""
    statusLabel.TextColor3 = GUI_CONFIG.TEXT_COLOR
    statusLabel.TextSize = 14
    statusLabel.Parent = mainFrame

    -- Button Functionality
    submitButton.MouseButton1Click:Connect(function()
        local key = keyBox.Text
        statusLabel.Text = "Checking key..."
        
        -- Simulasi pengecekan key (ganti dengan logika pengecekan key yang sebenarnya)
        wait(1.5)
        if #key >= 6 then -- Contoh validasi sederhana
            statusLabel.Text = "Key valid!"
            statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            
            -- Animasi ketika key valid
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(mainFrame, tweenInfo, {Position = UDim2.new(0.5, -150, 1.5, -200)})
            tween:Play()
            
            wait(0.6)
            screenGui:Destroy()
            -- Di sini Anda bisa menambahkan kode untuk memuat script utama
        else
            statusLabel.Text = "Invalid key!"
            statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)

    -- Hover Effects
    submitButton.MouseEnter:Connect(function()
        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(submitButton, tweenInfo, {BackgroundColor3 = GUI_CONFIG.ACCENT_COLOR:Lerp(Color3.new(1, 1, 1), 0.2)})
        tween:Play()
    end)

    submitButton.MouseLeave:Connect(function()
        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(submitButton, tweenInfo, {BackgroundColor3 = GUI_CONFIG.ACCENT_COLOR})
        tween:Play()
    end)

    return screenGui
end

-- Membuat dan menampilkan GUI
local keySystemGUI = createKeySystemGUI()
