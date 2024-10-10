local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ProfileSection = Instance.new("Frame")
local ProfileImage = Instance.new("ImageLabel")
local Username = Instance.new("TextLabel")
local KeySection = Instance.new("Frame")
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

ProfileImage.Name = "ProfileImage"
ProfileImage.Parent = ProfileSection
ProfileImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ProfileImage.BackgroundTransparency = 1
ProfileImage.Position = UDim2.new(0, 0, 0, 0)
ProfileImage.Size = UDim2.new(1, 0, 0.8, 0)
ProfileImage.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

Username.Name = "Username"
Username.Parent = ProfileSection
Username.BackgroundTransparency = 1
Username.Position = UDim2.new(0, 0, 0.8, 0)
Username.Size = UDim2.new(1, 0, 0.2, 0)
Username.Font = Enum.Font.GothamBold
Username.Text = ""..identiferusername
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.TextSize = 18

-- Key Section
KeySection.Name = "KeySection"
KeySection.Parent = MainFrame
KeySection.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
KeySection.Position = UDim2.new(0.4, 0, 0, 0)
KeySection.Size = UDim2.new(0.6, 0, 1, 0)

-- Stylish TextBox
local TextBoxContainer = Instance.new("Frame")
TextBoxContainer.Name = "TextBoxContainer"
TextBoxContainer.Parent = KeySection
TextBoxContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
TextBoxContainer.Position = UDim2.new(0.1, 0, 0.2, 0)
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
ButtonsContainer.Position = UDim2.new(0.1, 0, 0.4, 0)
ButtonsContainer.Size = UDim2.new(0.8, 0, 0.5, 0)

ButtonsLayout.Parent = ButtonsContainer
ButtonsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ButtonsLayout.SortOrder = Enum.SortOrder.LayoutOrder
ButtonsLayout.Padding = UDim.new(0, 15)
ButtonsLayout.FillDirection = Enum.FillDirection.Vertical

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
    -- Implementasi pengecekan key di sini
    print("Checking key: " .. KeyTextBox.Text)
end

local function copyLink()
    setclipboard("https://your-link-here.com")
end

local function copyDiscordLink()
    setclipboard("https://discord.gg/your-discord")
end

CheckKeyButton[1].MouseButton1Click:Connect(checkKey)
CopyLinkButton[1].MouseButton1Click:Connect(copyLink)
CopyDiscordButton[1].MouseButton1Click:Connect(copyDiscordLink)

-- Update username and profile picture
local player = game.Players.LocalPlayer
Username.Text = player.Name

-- Get player avatar
local userId = player.UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
ProfileImage.Image = content

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
