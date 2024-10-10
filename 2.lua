local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Membuat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui
screenGui.IgnoreGuiInset = true

-- Membuat frame utama dengan tampilan elegan
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 450, 0, 300)
frame.Position = UDim2.new(0.5, -225, 0.5, -150)
frame.BackgroundTransparency = 0.2
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Parent = screenGui

-- Menambahkan efek bayangan
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 30, 1, 30)
shadow.Position = UDim2.new(0, -15, 0, -15)
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 0.6
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.BackgroundTransparency = 1
shadow.Parent = frame

-- Menambahkan background image dengan opacity
local bgImage = Instance.new("ImageLabel")
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.Position = UDim2.new(0, 0, 0, 0)
bgImage.Image = "rbxassetid://ROBLOX_ID_GAMBAR"  -- Ganti dengan Roblox ID gambar kamu
bgImage.ImageTransparency = 0.8
bgImage.Parent = frame

-- Profil pengguna, dipindah lebih ke bawah
local profileFrame = Instance.new("Frame")
profileFrame.Size = UDim2.new(0, 100, 0, 120)
profileFrame.Position = UDim2.new(0, 10, 0, 50) -- Dipindahkan sedikit ke bawah
profileFrame.BackgroundTransparency = 0.7
profileFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
profileFrame.BorderSizePixel = 0
profileFrame.Parent = frame

local userProfilePic = Instance.new("ImageLabel")
userProfilePic.Size = UDim2.new(0, 80, 0, 80)
userProfilePic.Position = UDim2.new(0.5, -40, 0, 10)
userProfilePic.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"
userProfilePic.Parent = profileFrame

-- Username dipindahkan ke bawah profil
local usernameLabel = Instance.new("TextLabel")
usernameLabel.Size = UDim2.new(1, 0, 0, 30)
usernameLabel.Position = UDim2.new(0, 0, 1, 0)  -- Ditempatkan di bawah user profile
usernameLabel.Text = LocalPlayer.Name
usernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
usernameLabel.BackgroundTransparency = 1
usernameLabel.Font = Enum.Font.GothamBold
usernameLabel.TextSize = 16
usernameLabel.Parent = profileFrame

-- Textbox untuk input key
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 250, 0, 40)
textBox.Position = UDim2.new(1, -270, 0, 40)
textBox.Text = "Masukkan Key"
textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 18
textBox.BorderSizePixel = 0
textBox.Parent = frame

-- Tombol Check Key, ditambahkan warna
local checkKeyButton = Instance.new("TextButton")
checkKeyButton.Size = UDim2.new(0, 250, 0, 40)
checkKeyButton.Position = UDim2.new(1, -270, 0, 90)
checkKeyButton.Text = "Check Key"
checkKeyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)  -- Warna biru
checkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyButton.Font = Enum.Font.GothamBold
checkKeyButton.TextSize = 18
checkKeyButton.BorderSizePixel = 0
checkKeyButton.Parent = frame

-- Tombol Copy Link Key, ditambahkan warna
local copyLinkKeyButton = Instance.new("TextButton")
copyLinkKeyButton.Size = UDim2.new(0, 250, 0, 40)
copyLinkKeyButton.Position = UDim2.new(1, -270, 0, 140)
copyLinkKeyButton.Text = "Copy Link Key"
copyLinkKeyButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)  -- Warna hijau
copyLinkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyLinkKeyButton.Font = Enum.Font.GothamBold
copyLinkKeyButton.TextSize = 18
copyLinkKeyButton.BorderSizePixel = 0
copyLinkKeyButton.Parent = frame

-- Tombol Copy Link Discord, ditambahkan warna
local copyDiscordButton = Instance.new("TextButton")
copyDiscordButton.Size = UDim2.new(0, 250, 0, 40)
copyDiscordButton.Position = UDim2.new(1, -270, 0, 190)
copyDiscordButton.Text = "Copy Link Discord"
copyDiscordButton.BackgroundColor3 = Color3.fromRGB(200, 100, 0)  -- Warna oranye
copyDiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyDiscordButton.Font = Enum.Font.GothamBold
copyDiscordButton.TextSize = 18
copyDiscordButton.BorderSizePixel = 0
copyDiscordButton.Parent = frame

-- Animasi Brutality Hub V4 -> Thanks For Using
local animationText = Instance.new("TextLabel")
animationText.Size = UDim2.new(1, 0, 1, 0)
animationText.Position = UDim2.new(0, 0, 0, 0)
animationText.Text = "Hello : "..LocalPlayer.Name
animationText.TextColor3 = Color3.fromRGB(255, 255, 255)
animationText.BackgroundTransparency = 1
animationText.Font = Enum.Font.GothamBold
animationText.TextSize = 40
animationText.Parent = screenGui

wait(3)
animationText.Text = "Thanks For Using"
wait(3)
animationText.Text = "Brutality Hub V4"
wait(3)
animationText.Text = "Please Get Key :("
wait(3)
animationText.Visible = false
frame.Visible = true

-- Tween untuk transisi halus
frame.Position = UDim2.new(0.5, -225, 1.5, 0)
local tween = TweenService:Create(frame, TweenInfo.new(1), {Position = UDim2.new(0.5, -225, 0.5, -150)})
tween:Play()

-- Logika Key System
local keyFileUrl = "https://raw.githubusercontent.com/1p2o3l4k/sf3fda-2S-df-TYJR32WDD2e2w/refs/heads/main/DZF%23RSDFQ3tHR%5EhEFadf3.txt"
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
            textBox.Text = "Key Valid!"
            textBox.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            textBox.Text = "Key Tidak Valid!"
            textBox.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    else
        textBox.Text = "Username Tidak Dikenali!"
        textBox.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

-- Tombol salin link key
copyLinkKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://medusastore.tech/halaman/postingan/point-key.html")
    copyLinkKeyButton.Text = "Link Key Copied!"
end)

-- Tombol salin link Discord
copyDiscordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.com/invite/brutality-hub-1182005198206545941")
    copyDiscordButton.Text = "Link Discord Copied!"
end)
