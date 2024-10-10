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
local ValidationLabel = Instance.new("TextLabel")
local GetKeyButton = Instance.new("TextButton")
local CheckKeyButton = Instance.new("TextButton")
local DiscordButton = Instance.new("TextButton")

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
ProfileImage.Size = UDim2.new(1, 0, 0.5, 0)
ProfileImage.Image = "rbxassetid://123456789"  -- Ganti dengan asset ID profil

Username.Name = "Username"
Username.Parent = ProfileSection
Username.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Username.Position = UDim2.new(0, 0, 0.6, 0)
Username.Size = UDim2.new(1, 0, 0.2, 0)
Username.Text = game.Players.LocalPlayer.Name
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.TextSize = 18

-- Key Section
KeySection.Name = "KeySection"
KeySection.Parent = MainFrame
KeySection.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
KeySection.Position = UDim2.new(0.4, 0, 0, 0)
KeySection.Size = UDim2.new(0.6, 0, 1, 0)

KeyTextBox.Name = "KeyTextBox"
KeyTextBox.Parent = KeySection
KeyTextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
KeyTextBox.Position = UDim2.new(0.05, 0, 0.1, 0)
KeyTextBox.Size = UDim2.new(0.9, 0, 0.15, 0)
KeyTextBox.PlaceholderText = "Masukkan key di sini"
KeyTextBox.Text = ""

-- Validation Label
ValidationLabel.Name = "ValidationLabel"
ValidationLabel.Parent = KeySection
ValidationLabel.Position = UDim2.new(0.05, 0, 0.3, 0)
ValidationLabel.Size = UDim2.new(0.9, 0, 0.1, 0)
ValidationLabel.Text = "Validation Status"
ValidationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Buttons Container
ButtonsContainer.Name = "ButtonsContainer"
ButtonsContainer.Parent = KeySection
ButtonsContainer.Position = UDim2.new(0.05, 0, 0.5, 0)
ButtonsContainer.Size = UDim2.new(0.9, 0, 0.3, 0)
ButtonsLayout.Padding = UDim.new(0, 15)
ButtonsLayout.Parent = ButtonsContainer
ButtonsLayout.FillDirection = Enum.FillDirection.Vertical
ButtonsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ButtonsLayout.VerticalAlignment = Enum.VerticalAlignment.Center

-- Get Key Button
GetKeyButton.Name = "GetKeyButton"
GetKeyButton.Parent = ButtonsContainer
GetKeyButton.Size = UDim2.new(1, 0, 0.3, 0)
GetKeyButton.Text = "Get Key"

-- Buttons Container
ButtonsContainer.Name = "ButtonsContainer"
ButtonsContainer.Parent = KeySection
ButtonsContainer.BackgroundTransparency = 1
ButtonsContainer.Position = UDim2.new(0.1, 0, 0.4, 0)
ButtonsContainer.Size = UDim2.new(0.8, 0, 0.5, 0)
ButtonContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)



-- Check Key Button
CheckKeyButton.Name = "CheckKeyButton"
CheckKeyButton.Parent = ButtonsContainer
CheckKeyButton.Size = UDim2.new(1, 0, 0.3, 0)
CheckKeyButton.Text = "Check Key"

-- Discord Button
DiscordButton.Name = "DiscordButton"
DiscordButton.Parent = ButtonsContainer
DiscordButton.Size = UDim2.new(1, 0, 0.3, 0)
DiscordButton.Text = "Join Discord"

-- Integrasi Logika
-- Menggunakan logika yang sudah diperbaiki untuk validasi key
local keyFileUrl = "https://raw.githubusercontent.com/1p2o3l4k/sf3fda-2S-df-TYJR32WDD2e2w/refs/heads/main/DZF%23RSDFQ3tHR%5EhEFadf3.txt"
local expiryTimeInSeconds = 24 * 60 * 60 -- 24 jam

function onMessage(msg)
    ValidationLabel.Text = msg
end

function verify(key)
    onMessage("Checking key...")
    local status, result = pcall(function() 
        return game:HttpGetAsync(keyFileUrl)
    end)
    
    if status then
        if result:find('{Normalkey%s*=%s*"' .. key .. '"}') then
            onMessage("Key is valid!")
            return true
        else
            onMessage("Key is invalid!")
            return false
        end
    else
        onMessage("Error checking key!")
        return false
    end
end

CheckKeyButton.MouseButton1Click:Connect(function()
    local key = KeyTextBox.Text
    if verify(key) then
        onMessage("Key Is Valid!")
    else
        onMessage("Key Is Not Valid!")
    end
end)

-- Mengintegrasikan tombol Get Key dan Discord
GetKeyButton.MouseButton1Click:Connect(function()
    setclipboard('https://medusastore.tech/halaman/postingan/point-key.html')
    onMessage("Link Get Key Copied!")
end)

DiscordButton.MouseButton1Click:Connect(function()
    setclipboard('https://discord.com/invite/brutality-hub-1182005198206545941')
    onMessage("Link Discord Copied!")
end)
