local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Membuat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui

-- Membuat frame utama dengan animasi
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 250)
frame.Position = UDim2.new(0.5, -200, 0.5, -125)
frame.BackgroundTransparency = 0.5
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Menambahkan background image
local bgImage = Instance.new("ImageLabel")
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.Image = "rbxassetid://ROBLOX_ID_GAMBAR"  -- Ganti dengan Roblox ID gambar kamu
bgImage.Parent = frame

-- Profil pengguna
local profileFrame = Instance.new("Frame")
profileFrame.Size = UDim2.new(0, 100, 0, 150)
profileFrame.Position = UDim2.new(0, 10, 0, 10)
profileFrame.BackgroundTransparency = 0.8
profileFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
profileFrame.Parent = frame

local userProfilePic = Instance.new("ImageLabel")
userProfilePic.Size = UDim2.new(0, 80, 0, 80)
userProfilePic.Position = UDim2.new(0.5, -40, 0, 10)
userProfilePic.Image = LocalPlayer.UserId  -- Mengambil gambar profil Roblox pengguna
userProfilePic.Parent = profileFrame

local usernameLabel = Instance.new("TextLabel")
usernameLabel.Size = UDim2.new(1, 0, 0, 40)
usernameLabel.Position = UDim2.new(0, 0, 1, -50)
usernameLabel.Text = LocalPlayer.Name  -- Menampilkan nama pengguna
usernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
usernameLabel.BackgroundTransparency = 1
usernameLabel.Font = Enum.Font.SourceSans
usernameLabel.TextSize = 16
usernameLabel.Parent = profileFrame

-- Textbox untuk input key
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.Position = UDim2.new(1, -210, 0, 10)
textBox.Text = "Masukkan Key"
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Font = Enum.Font.SourceSans
textBox.TextSize = 16
textBox.Parent = frame

-- Tombol Check Key
local checkKeyButton = Instance.new("TextButton")
checkKeyButton.Size = UDim2.new(0, 150, 0, 40)
checkKeyButton.Position = UDim2.new(1, -170, 0, 70)
checkKeyButton.Text = "Check Key"
checkKeyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
checkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyButton.Font = Enum.Font.SourceSans
checkKeyButton.TextSize = 16
checkKeyButton.Parent = frame

-- Tombol Copy Link Key
local copyLinkKeyButton = Instance.new("TextButton")
copyLinkKeyButton.Size = UDim2.new(0, 150, 0, 40)
copyLinkKeyButton.Position = UDim2.new(1, -170, 0, 120)
copyLinkKeyButton.Text = "Copy Link Key"
copyLinkKeyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
copyLinkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyLinkKeyButton.Font = Enum.Font.SourceSans
copyLinkKeyButton.TextSize = 16
copyLinkKeyButton.Parent = frame

-- Tombol Copy Link Discord
local copyDiscordButton = Instance.new("TextButton")
copyDiscordButton.Size = UDim2.new(0, 150, 0, 40)
copyDiscordButton.Position = UDim2.new(1, -170, 0, 170)
copyDiscordButton.Text = "Copy Link Discord"
copyDiscordButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
copyDiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyDiscordButton.Font = Enum.Font.SourceSans
copyDiscordButton.TextSize = 16
copyDiscordButton.Parent = frame

-- Animasi Brutality Hub V4 -> Thanks For Using
local animationText = Instance.new("TextLabel")
animationText.Size = UDim2.new(1, 0, 1, 0)
animationText.Position = UDim2.new(0, 0, 0, 0)
animationText.Text = "Brutality Hub V4"
animationText.TextColor3 = Color3.fromRGB(255, 255, 255)
animationText.BackgroundTransparency = 1
animationText.Font = Enum.Font.SourceSans
animationText.TextSize = 32
animationText.Parent = screenGui

wait(3)
animationText.Text = "Thanks For Using"
wait(3)
animationText.Visible = false

-- Tween untuk menampilkan frame
frame.Position = UDim2.new(0.5, -200, 1.5, -125)
local tween = TweenService:Create(frame, TweenInfo.new(1), {Position = UDim2.new(0.5, -200, 0.5, -125)})
tween:Play()

-- Logika Key System
local keyFileUrl = "https://raw.githubusercontent.com/1p2o3l4k/sf3fda-2S-df-TYJR32WDD2e2w/refs/heads/main/DZF%23RSDFQ3tHR%5EhEFadf3.txt"
local expiryTimeInSeconds = 24 * 60 * 60 
local validUsernames = { "RobloxArmor1", "zilhannopasif", "Memek28222" }

function verifyNormalKey(key)
    local result = game:HttpGet(keyFileUrl)
    local pattern = '{NormalKey%s*=%s*"' .. key .. '"}'
    return string.find(result, pattern) ~= nil
end

checkKeyButton.MouseButton1Click:Connect(function()
    local key = textBox.Text
    local username = LocalPlayer.Name

    if table.find(validUsernames, username) then
        if verifyNormalKey(key) then
            -- Validasi berhasil
            textBox.Text = "Key Valid!"
        else
            textBox.Text = "Key Tidak Valid!"
        end
    else
        textBox.Text = "Username Tidak Dikenali!"
    end
end)

-- Tombol salin link key
copyLinkKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://medusastore.tech/halaman/postingan/point-key.html")
end)

-- Tombol salin link Discord
copyDiscordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.com/invite/brutality-hub-1182005198206545941")
end)
