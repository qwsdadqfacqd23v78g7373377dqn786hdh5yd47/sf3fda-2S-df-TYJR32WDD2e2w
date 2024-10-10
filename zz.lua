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
usernameLabel.Position = UDim2.new(0.5, -50, 0.12, -50)  -- Geser 20 piksel dari kiri
usernameLabel.Text = --LocalPlayer.Name
usernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
usernameLabel.BackgroundTransparency = 1
usernameLabel.Font = Enum.Font.GothamBold
usernameLabel.TextSize = 16
usernameLabel.Parent = profileFrame

-- Textbox untuk input key
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 250, 0, 40)
textBox.Position = UDim2.new(1, -270, 0, 60) -- Disesuaikan agar ada di tengah bawah profil
textBox.Text = "Enter Key Here"
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
local keyFileUrl = "https://raw.githubusercontent.com/1p2o3l4k/sf3fda-2S-df-TYJR32WDD2e2w/refs/heads/main/DZF%23RSDFQ3tHR%5EhEFadf3.txt"
local allowPassThrough = false
local expiryTimeInSeconds = 24 * 60 * 60 -- 24 hours
local validUsernames = { "RobloxArmor1", "zilhannopasif", "Memek28222" }
local savedKey = nil

-- Fungsi dasar
function onMessage(msg)
    print(msg)
end

-- Fungsi untuk menyimpan key dengan timestamp
function saveKeyWithTimestamp(key)
    local timestamp = os.time()
    local keyWithTimestamp = key .. "|" .. tostring(timestamp)
    writefile("BotunaKey.txt", keyWithTimestamp)
    savedKey = keyWithTimestamp
end

-- Fungsi untuk memuat key yang tersimpan
function loadKeyWithTimestamp()
    if isfile("BotunaKey.txt") then
        savedKey = readfile("BotunaKey.txt")
        local key, timestamp = parseKeyAndTimestamp(savedKey)
        if os.time() - tonumber(timestamp) >= expiryTimeInSeconds then
            onMessage("Saved key has expired!")
            delfile("BotunaKey.txt")
            savedKey = nil
        else
            savedKey = key
        end
    end
end

-- Fungsi untuk memisahkan key dan timestamp
function parseKeyAndTimestamp(keyWithTimestamp)
    local key, timestamp = keyWithTimestamp:match("([^|]+)|([^|]+)")
    return key, timestamp
end

-- Fungsi untuk memverifikasi key
function verify(key)
    onMessage("Checking key...")
    local status, result = pcall(function() 
        return game:HttpGetAsync(keyFileUrl)
    end)
    
    if status then
        if string.find(result, '{Normalkey%s*=%s*"' .. key .. '"}') then
            onMessage("Key is valid!")
            saveKeyWithTimestamp(key)
            return true
        else
            onMessage("Key is invalid!")
            return false
        end
    else
        onMessage("An error occurred while contacting the server!")
        return allowPassThrough
    end
end

-- Fungsi untuk memverifikasi username
function verifyUsername(username)
    for _, validUsername in ipairs(validUsernames) do
        if username == validUsername then
            return true
        end
    end
    return false
end

-- Tombol untuk menyalin link key
copyLinkKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://medusastore.tech/halaman/postingan/point-key.html")
    copyLinkKeyButton.Text = "Link Key Copied!"
end)

-- Tombol untuk menyalin link Discord
copyDiscordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.com/invite/brutality-hub-1182005198206545941")
    copyDiscordButton.Text = "Link Discord Copied!"
end)

-- Tombol untuk memeriksa key
checkKeyButton.MouseButton1Click:Connect(function()
    local key = textBox.Text
    local username = game.Players.LocalPlayer.Name
    
    if verifyUsername(username) then
        MessageLabel.Text = "You are authorized"
        MessageLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(2)
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 1.5, -100)})
        tween:Play()
        tween.Completed:Connect(function()
            screenGui:Destroy()
        end)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1p2o3l4k/251c19q381fdaza6163ezs6-1d6231z6s2/refs/heads/main/L15.lua", true))()
    else
        if verify(key) then
            MessageLabel.Text = "Key is valid!"
            MessageLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            wait(2)
            MessageLabel.Text = "Thanks for using!"
            MessageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            wait(2)
            local tween = TweenService:Create(MainFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 1.5, -100)})
            tween:Play()
            tween.Completed:Connect(function()
                screenGui:Destroy()
            end)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/1p2o3l4k/251c19q381fdaza6163ezs6-1d6231z6s2/refs/heads/main/L15.lua", true))()
        else
            MessageLabel.Text = "Key is not valid!"
            MessageLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end
end)

-- Animasi frame
wait(3)
local tween = TweenService:Create(MainFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 0.5, -100)})
tween:Play()

-- Muat key yang tersimpan
loadKeyWithTimestamp()
if savedKey then
    if verify(savedKey) then
        onMessage("Saved key is valid!")
        screenGui.Enabled = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vldtncywdlojtnvjlmvyrbszljd/asedesa/main/zxcv.lua", true))()
    else
        onMessage("Please enter a new key.")
    end
end
