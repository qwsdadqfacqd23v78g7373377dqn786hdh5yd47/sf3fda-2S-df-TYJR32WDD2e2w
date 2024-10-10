local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Membuat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Menambahkan efek blur pada layar
local blurEffect = Instance.new("BlurEffect")
blurEffect.Parent = game:GetService("Lighting")
blurEffect.Size = 0
local blurTween = TweenService:Create(blurEffect, TweenInfo.new(1), {Size = 24})
blurTween:Play()

-- Membuat frame utama dengan tampilan elegan
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 450, 0, 300)
frame.Position = UDim2.new(0.5, -225, 1.5, 0)
frame.BackgroundTransparency = 0.2
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Parent = screenGui

-- Animasi intro GUI
local animationText = Instance.new("TextLabel")
animationText.Size = UDim2.new(1, 0, 1, 0)
animationText.Position = UDim2.new(0, 0, 0, 0)
animationText.Text = "Hello : " .. LocalPlayer.Name
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
