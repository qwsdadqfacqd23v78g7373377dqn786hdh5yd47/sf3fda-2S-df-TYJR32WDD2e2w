local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

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

-- Text di atas textBox, ditempatkan di tengah antara frame atas dan textBox
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 250, 0, 40)
titleLabel.Position = UDim2.new(0.5, -125, 0.1, 0) -- Ditempatkan di tengah antara bagian atas frame dan textBox
titleLabel.Text = "BRUTALITY HUB V4"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 20
titleLabel.Parent = frame


-- Menambahkan background image dengan opacity
local bgImage = Instance.new("ImageLabel")
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.Position = UDim2.new(0, 0, 0, 0)
bgImage.Image = "rbxassetid://107679910024355"  -- Ganti dengan Roblox ID gambar kamu
bgImage.ImageTransparency = 0.8
bgImage.BackgroundTransparency = 1
bgImage.Parent = frame

-- Textbox untuk input key (tengah frame)
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 250, 0, 40)
textBox.Position = UDim2.new(0.5, -125, 0.3, 0) -- Ditempatkan di tengah frame
textBox.Text = "Masukkan Key"
textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 18
textBox.BorderSizePixel = 0
textBox.Parent = frame

-- Tombol Check Key (tengah frame, di bawah TextBox)
local checkKeyButton = Instance.new("TextButton")
checkKeyButton.Size = UDim2.new(0, 250, 0, 40)
checkKeyButton.Position = UDim2.new(0.5, -125, 0.5, 0) -- Di bawah TextBox, tengah frame
checkKeyButton.Text = "Check Key"
checkKeyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)  -- Warna biru
checkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyButton.Font = Enum.Font.GothamBold
checkKeyButton.TextSize = 18
checkKeyButton.BorderSizePixel = 0
checkKeyButton.Parent = frame

-- Tombol Copy Link Key (tengah frame, di bawah Check Key)
local copyLinkKeyButton = Instance.new("TextButton")
copyLinkKeyButton.Size = UDim2.new(0, 250, 0, 40)
copyLinkKeyButton.Position = UDim2.new(0.5, -125, 0.65, 0) -- Di bawah Check Key
copyLinkKeyButton.Text = "Copy Link Key"
copyLinkKeyButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)  -- Warna hijau
copyLinkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyLinkKeyButton.Font = Enum.Font.GothamBold
copyLinkKeyButton.TextSize = 18
copyLinkKeyButton.BorderSizePixel = 0
copyLinkKeyButton.Parent = frame

-- Tombol Copy Link Discord (tengah frame, di bawah Copy Link Key)
local copyDiscordButton = Instance.new("TextButton")
copyDiscordButton.Size = UDim2.new(0, 250, 0, 40)
copyDiscordButton.Position = UDim2.new(0.5, -125, 0.8, 0) -- Di bawah Copy Link Key
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
animationText.Text = "Hello!"
animationText.TextColor3 = Color3.fromRGB(255, 255, 255)
animationText.BackgroundTransparency = 1
animationText.Font = Enum.Font.GothamBold
animationText.TextSize = 40
animationText.Parent = screenGui

wait(1)
animationText.Text = "Thanks For Using"
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
    setclipboard("https://discord.com/invite/brutality-hub-1182005198206545941")
    textBox.Text = "Key invalid!"
end)

-- Tombol salin link key
copyLinkKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://medusastore.tech/halaman/postingan/point-key.html")
    textBox.Text = "Link Get Key Copied!"
end)

-- Tombol salin link Discord
copyDiscordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.com/invite/brutality-hub-1182005198206545941")
    textBox.Text = "Link Discord Copied!"
end)
