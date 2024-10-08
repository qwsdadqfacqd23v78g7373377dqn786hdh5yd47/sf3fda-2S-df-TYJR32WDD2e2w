local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 250)
frame.AnchorPoint = Vector2.new(0.5, 0.5) -- Titik acuan di tengah frame
frame.Position = UDim2.new(0.5, 0, 0.5, 0) -- Posisi di tengah layar
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local headerLabel = Instance.new("TextLabel")
headerLabel.Size = UDim2.new(1, 0, 0, 30)
headerLabel.Position = UDim2.new(0, 0, 0, 0)
headerLabel.Text = "BRUTALITY HUB V4"
headerLabel.Font = Enum.Font.SourceSansBold
headerLabel.TextSize = 18
headerLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
headerLabel.BackgroundTransparency = 1
headerLabel.TextWrapped = true
headerLabel.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.Text = ""
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundTransparency = 1
closeButton.Parent = frame

closeButton.MouseButton1Click:Connect(function()
    local tween = TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, -0.5, -100)})
    tween:Play()
    tween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end)

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 50)
label.Position = UDim2.new(0, 0, 0, 20) 
label.Text = "Nice To Meet You"
label.Font = Enum.Font.SourceSansBold
label.TextSize = 30
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.TextWrapped = true
label.Parent = frame

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 50)
label.Position = UDim2.new(0, 0, 0, 53) 
label.Text = "".. game.Players.LocalPlayer.Name
label.Font = Enum.Font.SourceSansBold
label.TextSize = 20
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.TextWrapped = true
label.Parent = frame

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 50)
label.Position = UDim2.new(0, 0, 0, 55) 
label.Text = ""--.. identifyexecutor()
label.Font = Enum.Font.SourceSansBold
label.TextSize = 20
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.TextWrapped = true
label.Parent = frame

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.8, 0, 0, 30)
textBox.Position = UDim2.new(0.1, 0, 0.4, 0)
textBox.Text = "Enter Key Here"
textBox.Font = Enum.Font.SourceSans
textBox.TextSize = 18
textBox.TextColor3 = Color3.fromRGB(0, 0, 0)
textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textBox.TextWrapped = true
textBox.Parent = frame

local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0.4, 0, 0, 30)
getKeyButton.Position = UDim2.new(0.1, 0, 0.7, 0)
getKeyButton.Text = "Get Key"
getKeyButton.Font = Enum.Font.SourceSansBold
getKeyButton.TextSize = 18
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) --0, 170, 0
getKeyButton.Parent = frame

local checkKeyButton = Instance.new("TextButton")
checkKeyButton.Size = UDim2.new(0.4, 0, 0, 30)
checkKeyButton.Position = UDim2.new(0.5, 0, 0.7, 0)
checkKeyButton.Text = "Check Key"
checkKeyButton.Font = Enum.Font.SourceSansBold
checkKeyButton.TextSize = 18
checkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) --0, 170, 0
checkKeyButton.Parent = frame

local DiscordButton = Instance.new("TextButton")
DiscordButton.Size = UDim2.new(0.8, 0, 0, 30)
DiscordButton.Position = UDim2.new(0.10, 0, 0.850, 0)
DiscordButton.Text = "Join Discord"
DiscordButton.Font = Enum.Font.SourceSansBold
DiscordButton.TextSize = 18
DiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
DiscordButton.Parent = frame

local validationLabel = Instance.new("TextLabel")
validationLabel.Size = UDim2.new(0.8, 0, 0, 30)
validationLabel.Position = UDim2.new(0.1, 0, 0.550, 0)
validationLabel.Text = "Please Get Key"
validationLabel.Font = Enum.Font.SourceSansBold
validationLabel.TextSize = 18
validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
validationLabel.BackgroundTransparency = 1
validationLabel.Parent = frame
local keyFileUrl = "https://37utf92gn8cmz.ahost.marscode.site/as/premium-key.txt"
local savedKey = nil
local savedUsername = nil

-- Fungsi untuk menampilkan pesan
function onMessage(msg)
    print(msg)
end

function saveKey(key, username)
    local keyData = key .. "|" .. (username or "")
    writefile("savedKey.txt", keyData)
    savedKey = key
    savedUsername = username
end

-- Fungsi untuk memuat key dan username yang tersimpan
function loadKey()
    if isfile("savedKey.txt") then
        local keyData = readfile("savedKey.txt")
        savedKey, savedUsername = keyData:match("([^|]+)|([^|]*)")
    end
end

-- Fungsi untuk memverifikasi key normal
function verifyNormalKey(key, content)
    local pattern = '{NormalKey = "' .. key .. '"}'
    return string.find(content, pattern) ~= nil
end

-- Fungsi untuk memverifikasi key premium
function verifyPremiumKey(key, username, content)
    local pattern = '{PremiumKey = "' .. key .. '", Username = "' .. username .. '"}'
    return string.find(content, pattern) ~= nil
end

-- Fungsi utama untuk memverifikasi key
function verify(key, username)
    local status, content = pcall(function()
        return game:HttpGetAsync(keyFileUrl)
    end)

    if status then
        -- Cek apakah key adalah NormalKey
        if verifyNormalKey(key, content) then
            onMessage("Normal key is valid!")
            saveKey(key, nil)
            return true
        end

        -- Cek apakah key adalah PremiumKey
        if username and verifyPremiumKey(key, username, content) then
            onMessage("Premium key is valid!")
            saveKey(key, username)
            return true
        end

        onMessage("Key is invalid!")
        return false
    else
        onMessage("An error occurred while contacting the server!")
        return false
    end
end

-- Event untuk tombol verifikasi key
checkKeyButton.MouseButton1Click:Connect(function()
    local key = textBox.Text
    local username = game.Players.LocalPlayer.Name  -- Mengambil username pemain

    if verify(key, username) then
        validationLabel.Text = "Key Is Valid!"
        validationLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(2)
        validationLabel.Text = "Thanks For Using"
        validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        wait(2)
        local tween = TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 1.5, -100)})
        tween:Play()
        tween.Completed:Connect(function()
            screenGui:Destroy()
        end)
        loadstring(game:HttpGet("https://37uzdt26sof4b.ahost.marscode.site/mekmek/bf.lua", true))()
    else
        validationLabel.Text = "Checking Key..."
        validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        wait(1.7)
        validationLabel.Text = "Key Is Not Valid!"
        validationLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

-- Memuat key dan username yang tersimpan saat awal dijalankan
loadKey()
if savedKey and (savedUsername == nil or verify(savedKey, savedUsername)) then
    onMessage("Saved key is valid!")
    screenGui.Enabled = false
    loadstring(game:HttpGet("https://37uzdt26sof4b.ahost.marscode.site/mekmek/bf.lua", true))()
else
    onMessage("No saved key found or key is invalid, please enter a new key.")
end
