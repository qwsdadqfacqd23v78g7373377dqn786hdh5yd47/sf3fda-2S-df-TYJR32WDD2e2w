
-- Inisialisasi GUI
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

-- Permanent key definition
local permanentKey = "BrutalityHubV4_CnV2Sdwwjr"
local savedUsername = nil
local expiryTime = nil
local usernameValidDuration = 24 * 60 * 60  -- 24 hours in seconds

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
Username.Text = "username"
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

local CheckKeyButton, CheckKeyButtonContainer = createStylishButton("CheckKeyButton", "Check Key", Color3.fromRGB(46, 204, 113))

-- Button Functions
local function checkKey()
    local inputKey = KeyTextBox.Text

    -- Check if the input key matches the permanent key
    if inputKey == permanentKey then
        -- Save the username and the current time
        savedUsername = game.Players.LocalPlayer.Name
        expiryTime = os.time() + usernameValidDuration
        print("Key correct! Username saved:", savedUsername)
    else
        print("Invalid key!")
    end
end

-- Check if the username needs to be reset (24-hour expiry)
local function checkUsernameExpiry()
    if savedUsername and os.time() >= expiryTime then
        savedUsername = nil
        expiryTime = nil
        print("Username has expired. Key input required again.")
    end
end

-- Continuously check for expiry
spawn(function()
    while true do
        checkUsernameExpiry()
        wait(60) -- Check every minute
    end
end)

CheckKeyButton.MouseButton1Click:Connect(checkKey)

-- Update username and profile picture
local player = game.Players.LocalPlayer
Username.Text = player.Name

-- Get player avatar
local userId = player.UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
ProfileImage.Image = content
