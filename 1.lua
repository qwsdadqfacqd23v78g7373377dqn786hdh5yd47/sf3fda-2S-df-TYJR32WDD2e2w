local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ProfileSection = Instance.new("Frame")
local ProfileImage = Instance.new("ImageLabel")
local Username = Instance.new("TextLabel")
local KeySection = Instance.new("Frame")
local KeyTextBox = Instance.new("TextBox")
local ButtonsLayout = Instance.new("UIListLayout")
local CheckKeyButton = Instance.new("TextButton")
local CopyLinkButton = Instance.new("TextButton")
local CopyDiscordButton = Instance.new("TextButton")

-- Konfigurasi GUI
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -100)
MainFrame.Size = UDim2.new(0, 500, 0, 200)
MainFrame.BorderSizePixel = 0

-- Bagian Profil
ProfileSection.Name = "ProfileSection"
ProfileSection.Parent = MainFrame
ProfileSection.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
ProfileSection.Position = UDim2.new(0, 0, 0, 0)
ProfileSection.Size = UDim2.new(0.4, 0, 1, 0)
ProfileSection.BorderSizePixel = 0

ProfileImage.Name = "ProfileImage"
ProfileImage.Parent = ProfileSection
ProfileImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ProfileImage.Position = UDim2.new(0.5, -40, 0.2, 0)
ProfileImage.Size = UDim2.new(0, 80, 0, 80)
ProfileImage.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

Username.Name = "Username"
Username.Parent = ProfileSection
Username.BackgroundTransparency = 1
Username.Position = UDim2.new(0, 0, 0.6, 0)
Username.Size = UDim2.new(1, 0, 0, 30)
Username.Font = Enum.Font.SourceSansBold
Username.Text = "Username"
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.TextSize = 18

-- Bagian Key
KeySection.Name = "KeySection"
KeySection.Parent = MainFrame
KeySection.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
KeySection.Position = UDim2.new(0.4, 0, 0, 0)
KeySection.Size = UDim2.new(0.6, 0, 1, 0)
KeySection.BorderSizePixel = 0

KeyTextBox.Name = "KeyTextBox"
KeyTextBox.Parent = KeySection
KeyTextBox.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
KeyTextBox.Position = UDim2.new(0.1, 0, 0.1, 0)
KeyTextBox.Size = UDim2.new(0.8, 0, 0, 30)
KeyTextBox.Font = Enum.Font.SourceSans
KeyTextBox.PlaceholderText = "Enter Key Here"
KeyTextBox.Text = ""
KeyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTextBox.TextSize = 14

ButtonsLayout.Parent = KeySection
ButtonsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ButtonsLayout.SortOrder = Enum.SortOrder.LayoutOrder
ButtonsLayout.Padding = UDim.new(0, 10)

-- Tombol-tombol
local function createButton(name, text)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = KeySection
    button.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
    button.Position = UDim2.new(0.1, 0, 0.4, 0)
    button.Size = UDim2.new(0.8, 0, 0, 30)
    button.Font = Enum.Font.SourceSansBold
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    return button
end

CheckKeyButton = createButton("CheckKeyButton", "Check Key")
CopyLinkButton = createButton("CopyLinkButton", "Copy Link")
CopyDiscordButton = createButton("CopyDiscordButton", "Copy Discord Link")

-- Posisi tombol-tombol
CheckKeyButton.Position = UDim2.new(0.1, 0, 0.4, 0)
CopyLinkButton.Position = UDim2.new(0.1, 0, 0.6, 0)
CopyDiscordButton.Position = UDim2.new(0.1, 0, 0.8, 0)

-- Fungsi untuk tombol-tombol
local function checkKey()
    -- Implementasi pengecekan key di sini
    print("Checking key: " .. KeyTextBox.Text)
end

local function copyLink()
    -- Implementasi copy link di sini
    setclipboard("https://your-link-here.com")
end

local function copyDiscordLink()
    -- Implementasi copy discord link di sini
    setclipboard("https://discord.gg/your-discord")
end

CheckKeyButton.MouseButton1Click:Connect(checkKey)
CopyLinkButton.MouseButton1Click:Connect(copyLink)
CopyDiscordButton.MouseButton1Click:Connect(copyDiscordLink)

-- Update username
local player = game.Players.LocalPlayer
Username.Text = player.Name

-- Mengambil avatar pemain
local userId = player.UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
ProfileImage.Image = content
