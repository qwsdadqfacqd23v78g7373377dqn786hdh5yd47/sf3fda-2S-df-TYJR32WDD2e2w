local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Membuat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui
screenGui.IgnoreGuiInset = true

-- Menambahkan efek blur pada layar
local blurEffect = Instance.new("BlurEffect")
blurEffect.Size = 24
blurEffect.Parent = game.Lighting

-- Membuat frame utama dengan tampilan elegan
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 450, 0, 300)
frame.Position = UDim2.new(0.5, -225, 0.5, -150)
frame.BackgroundTransparency = 0.2
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Parent = screenGui

-- Menambahkan background image dengan opacity
local bgImage = Instance.new("ImageLabel")
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.Position = UDim2.new(0, 0, 0, 0)
bgImage.Image = "rbxassetid://107679910024355"  -- Ganti dengan Roblox ID gambar kamu
bgImage.ImageTransparency = 0.8
bgImage.BackgroundTransparency = 1
bgImage.Parent = frame

-- Profil pengguna, diposisikan lebih rapi
local profileFrame = Instance.new("Frame")
profileFrame.Size = UDim2.new(0, 100, 0, 120)
profileFrame.Position = UDim2.new(0.05, 20, 0.5, -60) -- Menggunakan skala 0.05 pada sumbu X
profileFrame.BackgroundTransparency = 1  -- Membuat background sepenuhnya transparan
profileFrame.BorderSizePixel = 0
profileFrame.Parent = frame

local userProfilePic = Instance.new("ImageLabel")
userProfilePic.Size = UDim2.new(0, 100, 0, 100)
userProfilePic.Position = UDim2.new(0.5, -50, 0.5, -50) -- Profil berada di tengah secara vertikal di dalam frame
userProfilePic.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"
userProfilePic.BackgroundTransparency = 1  -- Pastikan foto profil juga tidak memiliki background
userProfilePic.Parent = profileFrame


-- Username dipindahkan ke bawah profil
local usernameLabel = Instance.new("TextLabel")
usernameLabel.Size = UDim2.new(1, 0, 0, 30)
usernameLabel.Position = UDim2.new(0, 20, 1, 10)  -- Geser 20 piksel dari kiri
usernameLabel.Text = LocalPlayer.Name
usernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
usernameLabel.BackgroundTransparency = 1
usernameLabel.Font = Enum.Font.GothamBold
usernameLabel.TextSize = 16
usernameLabel.Parent = profileFrame

-- Textbox untuk input key
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 250, 0, 40)
textBox.Position = UDim2.new(1, -270, 0, 60) -- Disesuaikan agar ada di tengah bawah profil
textBox.Text = "Masukkan Key"
textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 18
textBox.BorderSizePixel = 0
textBox.Parent = frame

-- Tombol Check Key, dengan posisi diperbaiki
local checkKeyButton = Instance.new("TextButton")
checkKeyButton.Size = UDim2.new(0, 250, 0, 40)
checkKeyButton.Position = UDim2.new(1, -270, 0, 110)
checkKeyButton.Text = "Check Key"
checkKeyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)  -- Warna biru
checkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyButton.Font = Enum.Font.GothamBold
checkKeyButton.TextSize = 18
checkKeyButton.BorderSizePixel = 0
checkKeyButton.Parent = frame

-- Tombol Copy Link Key, dengan posisi diperbaiki
local copyLinkKeyButton = Instance.new("TextButton")
copyLinkKeyButton.Size = UDim2.new(0, 250, 0, 40)
copyLinkKeyButton.Position = UDim2.new(1, -270, 0, 160)
copyLinkKeyButton.Text = "Copy Link Key"
copyLinkKeyButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)  -- Warna hijau
copyLinkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyLinkKeyButton.Font = Enum.Font.GothamBold
copyLinkKeyButton.TextSize = 18
copyLinkKeyButton.BorderSizePixel = 0
copyLinkKeyButton.Parent = frame

-- Tombol Copy Link Discord, dengan posisi diperbaiki
local copyDiscordButton = Instance.new("TextButton")
copyDiscordButton.Size = UDim2.new(0, 250, 0, 40)
copyDiscordButton.Position = UDim2.new(1, -270, 0, 210)
copyDiscordButton.Text = "Copy Link Discord"
copyDiscordButton.BackgroundColor3 = Color3.fromRGB(200, 100, 0)  -- Warna oranye
copyDiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyDiscordButton.Font = Enum.Font.GothamBold
copyDiscordButton.TextSize = 18
copyDiscordButton.BorderSizePixel = 0
copyDiscordButton.Parent = frame

-- Animasi intro GUI
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

-- Logika Key System tidak berubah


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
