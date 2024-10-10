local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- Konstanta GUI
local GUI_CONFIG = {
    MAIN_COLOR = Color3.fromRGB(40, 40, 40),
    ACCENT_COLOR = Color3.fromRGB(0, 170, 255),
    TEXT_COLOR = Color3.fromRGB(255, 255, 255),
    FONT = Enum.Font.GothamSemibold
}

-- Fungsi untuk membuat bayangan
local function addShadow(element)
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 20, 1, 20)
    shadow.Position = UDim2.new(0, -10, 0, -10)
    shadow.Image = "rbxassetid://1316045217"
    shadow.ImageTransparency = 0.5
    shadow.BackgroundTransparency = 1
    shadow.ZIndex = element.ZIndex - 1
    shadow.Parent = element
end

-- Fungsi untuk membuat GUI
local function createKeySystemGUI()
    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "KeySystemGUI"
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 350, 0, 450)
    mainFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
    mainFrame.BackgroundColor3 = GUI_CONFIG.MAIN_COLOR
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    addShadow(mainFrame)

    -- Animasi saat muncul
    mainFrame.Position = UDim2.new(0.5, -175, 1.5, -225)
    local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local showTween = TweenService:Create(mainFrame, tweenInfo, {Position = UDim2.new(0.5, -175, 0.5, -225)})
    showTween:Play()

    -- Rounded Corners
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 12)
    uiCorner.Parent = mainFrame

    -- Profile Picture Frame
    local profileFrame = Instance.new("Frame")
    profileFrame.Name = "ProfileFrame"
    profileFrame.Size = UDim2.new(0, 100, 0, 100)
    profileFrame.Position = UDim2.new(0.5, -50, 0, 30)
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

    -- Username Label
    local usernameLabel = Instance.new("TextLabel")
    usernameLabel.Name = "UsernameLabel"
    usernameLabel.Size = UDim2.new(1, 0, 0, 30)
    usernameLabel.Position = UDim2.new(0, 0, 0, 140)
    usernameLabel.BackgroundTransparency = 1
    usernameLabel.Font = GUI_CONFIG.FONT
    usernameLabel.Text = LocalPlayer.Name
    usernameLabel.TextColor3 = GUI_CONFIG.TEXT_COLOR
    usernameLabel.TextSize = 20
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
    keyBox.TextSize = 16
    keyBox.Parent = mainFrame

    -- Submit Button
    local submitButton = Instance.new("TextButton")
    submitButton.Name = "SubmitButton"
    submitButton.Size = UDim2.new(0.8, 0, 0, 40)
    submitButton.Position = UDim2.new(0.1, 0, 0.65, -20)
    submitButton.BackgroundColor3 = GUI_CONFIG.ACCENT_COLOR
    submitButton.BorderSizePixel = 0
    submitButton.Font = GUI_CONFIG.FONT
    submitButton.Text = "Check Key"
    submitButton.TextColor3 = GUI_CONFIG.TEXT_COLOR
    submitButton.TextSize = 18
    submitButton.Parent = mainFrame
    addShadow(submitButton)

    -- Status Label
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Name = "StatusLabel"
    statusLabel.Size = UDim2.new(0.8, 0, 0, 30)
    statusLabel.Position = UDim2.new(0.1, 0, 0.85, -15)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Font = GUI_CONFIG.FONT
    statusLabel.Text = ""
    statusLabel.TextColor3 = GUI_CONFIG.TEXT_COLOR
    statusLabel.TextSize = 16
    statusLabel.Parent = mainFrame

    -- Button Functionality
    submitButton.MouseButton1Click:Connect(function()
        local key = keyBox.Text
        statusLabel.Text = "Checking key..."

        -- Simulasi pengecekan key
        wait(1.5)
        if #key >= 6 then
            statusLabel.Text = "Key valid!"
            statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)

            -- Animasi ketika key valid
            local tween = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -175, 1.5, -225)})
            tween:Play()
            wait(0.6)
            screenGui:Destroy()
        else
            statusLabel.Text = "Invalid key!"
            statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)

    return screenGui
end

-- Membuat dan menampilkan GUI
local keySystemGUI = createKeySystemGUI()
