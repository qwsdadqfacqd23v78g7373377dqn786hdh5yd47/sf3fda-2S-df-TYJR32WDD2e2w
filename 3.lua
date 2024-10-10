local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ProfileSection = Instance.new("Frame")
local ProfileImage = Instance.new("ImageLabel")
local Username = Instance.new("TextLabel")
local KeySection = Instance.new("Frame")
local StatusMessage = Instance.new("TextLabel")
local TextBoxContainer = Instance.new("Frame")
local KeyTextBox = Instance.new("TextBox")
local ButtonsContainer = Instance.new("Frame")
local ButtonsLayout = Instance.new("UIListLayout")
local UICorner_Main = Instance.new("UICorner")
local UICorner_Profile = Instance.new("UICorner")

-- GUI Configuration
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -150)
MainFrame.Size = UDim2.new(0, 600, 0, 300)
MainFrame.BorderSizePixel = 0
UICorner_Main.Parent = MainFrame
UICorner_Main.CornerRadius = UDim.new(0, 10)

-- Profile Section
ProfileSection.Name = "ProfileSection"
ProfileSection.Parent = MainFrame
ProfileSection.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
ProfileSection.Position = UDim2.new(0, 0, 0, 0)
ProfileSection.Size = UDim2.new(0.4, 0, 1, 0)
UICorner_Profile.Parent = ProfileSection
UICorner_Profile.CornerRadius = UDim.new(0, 10)

-- Profile Image with mask
local ImageMask = Instance.new("Frame")
ImageMask.Name = "ImageMask"
ImageMask.Parent = ProfileSection
ImageMask.BackgroundTransparency = 1
ImageMask.Position = UDim2.new(0.1, 0, 0.05, 0)
ImageMask.Size = UDim2.new(0.8, 0, 0.7, 0)
local UICorner_Mask = Instance.new("UICorner")
UICorner_Mask.CornerRadius = UDim.new(1, 0)
UICorner_Mask.Parent = ImageMask

ProfileImage.Name = "ProfileImage"
ProfileImage.Parent = ImageMask
ProfileImage.BackgroundTransparency = 1
ProfileImage.Size = UDim2.new(1, 0, 1, 0)
ProfileImage.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
local UICorner_Image = Instance.new("UICorner")
UICorner_Image.CornerRadius = UDim.new(1, 0)
UICorner_Image.Parent = ProfileImage

Username.Name = "Username"
Username.Parent = ProfileSection
Username.BackgroundTransparency = 1
Username.Position = UDim2.new(0, 0, 0.8, 0)
Username.Size = UDim2.new(1, 0, 0.15, 0)
Username.Font = Enum.Font.GothamBold
Username.Text = "Username"
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.TextSize = 18

-- Key Section
KeySection.Name = "KeySection"
KeySection.Parent = MainFrame
KeySection.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
KeySection.Position = UDim2.new(0.4, 0, 0, 0)
KeySection.Size = UDim2.new(0.6, 0, 1, 0)

-- Status Message
StatusMessage.Name = "StatusMessage"
StatusMessage.Parent = KeySection
StatusMessage.BackgroundTransparency = 1
StatusMessage.Position = UDim2.new(0.1, 0, 0.1, 0)
StatusMessage.Size = UDim2.new(0.8, 0, 0, 30)
StatusMessage.Font = Enum.Font.GothamMedium
StatusMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusMessage.TextSize = 14
StatusMessage.Text = ""
StatusMessage.TextWrapped = true

-- Stylish TextBox
TextBoxContainer.Name = "TextBoxContainer"
TextBoxContainer.Parent = KeySection
TextBoxContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
TextBoxContainer.Position = UDim2.new(0.1, 0, 0.25, 0)
TextBoxContainer.Size = UDim2.new(0.8, 0, 0, 40)
local UICorner_TextBox = Instance.new("UICorner")
UICorner_TextBox.Parent = TextBoxContainer
UICorner_TextBox.CornerRadius = UDim.new(0, 8)

KeyTextBox.Name = "KeyTextBox"
KeyTextBox.Parent = TextBoxContainer
KeyTextBox.BackgroundTransparency = 1
KeyTextBox.Position = UDim2.new(0, 15, 0, 0)
KeyTextBox.Size = UDim2.new(1, -30, 1, 0)
KeyTextBox.Font = Enum.Font.Gotham
KeyTextBox.PlaceholderText = "Enter Key Here"
KeyTextBox.Text = ""
KeyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTextBox.TextSize = 14
KeyTextBox.ClearTextOnFocus = false

-- Buttons Container
ButtonsContainer.Name = "ButtonsContainer"
ButtonsContainer.Parent = KeySection
ButtonsContainer.BackgroundTransparency = 1
ButtonsContainer.Position = UDim2.new(0.1, 0, 0.45, 0)
ButtonsContainer.Size = UDim2.new(0.8, 0, 0.5, 0)

ButtonsLayout.Parent = ButtonsContainer
ButtonsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ButtonsLayout.SortOrder = Enum.SortOrder.LayoutOrder
ButtonsLayout.Padding = UDim.new(0, 15)
ButtonsLayout.FillDirection = Enum.FillDirection.Vertical

-- Function to show status message
local function showStatus(message, color)
    StatusMessage.TextColor3 = color
    StatusMessage.Text = message
    
    -- Animation for status message
    StatusMessage.TextTransparency = 1
    game:GetService("TweenService"):Create(StatusMessage, TweenInfo.new(0.3), {
        TextTransparency = 0
    }):Play()
    
    -- Clear message after 3 seconds
    delay(3, function()
        game:GetService("TweenService"):Create(StatusMessage, TweenInfo.new(0.3), {
            TextTransparency = 1
        }):Play()
    end)
end

-- Create Stylish Buttons
local function createStylishButton(name, text, color)
    local ButtonContainer = Instance.new("Frame")
    ButtonContainer.Name = name .. "Container"
    ButtonContainer.Parent = ButtonsContainer
    ButtonContainer.BackgroundColor3 = color
    ButtonContainer.Size = UDim2.new(1, 0, 0, 40)
    
    local UICorner_Button = Instance.new("UICorner")
    UICorner_Button.Parent = ButtonContainer
    UICorner_Button.CornerRadius = UDim.new(0, 8)
    
    local Button = Instance.new("TextButton")
    Button.Name = name
    Button.Parent = ButtonContainer
    Button.BackgroundTransparency = 1
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.Font = Enum.Font.GothamBold
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    
    return Button, ButtonContainer
end

local CheckKeyButton = createStylishButton("CheckKeyButton", "Check Key", Color3.fromRGB(46, 204, 113))
local CopyLinkButton = createStylishButton("CopyLinkButton", "Copy Link", Color3.fromRGB(52, 152, 219))
local CopyDiscordButton = createStylishButton("CopyDiscordButton", "Copy Discord Link", Color3.fromRGB(155, 89, 182))

-- Button Functions
local function checkKey()
    local key = KeyTextBox.Text
    if key == "" then
        showStatus("Please enter a key first!", Color3.fromRGB(231, 76, 60))
    else
        -- Implementasi pengecekan key di sini
        showStatus("Checking key...", Color3.fromRGB(241, 196, 15))
        wait(1) -- Simulasi pengecekan
        showStatus("Invalid key!", Color3.fromRGB(231, 76, 60))
        -- Jika key valid:
        -- showStatus("Key verified successfully!", Color3.fromRGB(46, 204, 113))
    end
end

local function copyLink()
    setclipboard("https://your-link-here.com")
    showStatus("Link copied to clipboard!", Color3.fromRGB(52, 152, 219))
end

local function copyDiscordLink()
    setclipboard("https://discord.gg/your-discord")
    showStatus("Discord link copied to clipboard!", Color3.fromRGB(155, 89, 182))
end

CheckKeyButton[1].MouseButton1Click:Connect(checkKey)
CopyLinkButton[1].MouseButton1Click:Connect(copyLink)
CopyDiscordButton[1].MouseButton1Click:Connect(copyDiscordLink)

-- Update username and profile picture
local player = game.Players.LocalPlayer
Username.Text = player.Name

-- Get player avatar
local function updateProfileImage()
    local userId = player.UserId
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    
    local success, content = pcall(function()
        return game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    end)
    
    if success then
        ProfileImage.Image = content
    else
        warn("Failed to load profile image:", content)
    end
end

-- Try to update profile image
updateProfileImage()

-- Add hover effects
local function addHoverEffect(buttonContainer)
    local originalColor = buttonContainer.BackgroundColor3
    local button = buttonContainer:FindFirstChildOfClass("TextButton")
    
    button.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(buttonContainer, TweenInfo.new(0.3), {
            BackgroundColor3 = originalColor:Lerp(Color3.fromRGB(255, 255, 255), 0.2)
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(buttonContainer, TweenInfo.new(0.3), {
            BackgroundColor3 = originalColor
        }):Play()
    end)
end

addHoverEffect(CheckKeyButton[2])
addHoverEffect(CopyLinkButton[2])
addHoverEffect(CopyDiscordButton[2])
