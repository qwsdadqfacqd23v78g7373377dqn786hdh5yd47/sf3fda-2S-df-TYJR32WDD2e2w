-- GUI elements from the provided file
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local textBox = Instance.new("TextBox")
local validationLabel = Instance.new("TextLabel")
local checkKeyButton = Instance.new("TextButton")
local getKeyButton = Instance.new("TextButton")
local discordButton = Instance.new("TextButton")
local buttonsContainer = Instance.new("Frame")

-- Properties for GUI elements
screenGui.Name = "ScreenGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
mainFrame.Name = "MainFrame"
mainFrame.Parent = screenGui
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.Size = UDim2.new(0, 300, 0, 200)

titleLabel.Parent = mainFrame
titleLabel.Text = "Key Validation"
titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 20
titleLabel.BackgroundTransparency = 1

textBox.Parent = mainFrame
textBox.PlaceholderText = "Enter your key"
textBox.Size = UDim2.new(0.9, 0, 0.2, 0)
textBox.Position = UDim2.new(0.05, 0, 0.25, 0)
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
textBox.Text = ""

validationLabel.Parent = mainFrame
validationLabel.Size = UDim2.new(0.9, 0, 0.1, 0)
validationLabel.Position = UDim2.new(0.05, 0, 0.5, 0)
validationLabel.Text = "Validation Status"
validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

buttonsContainer.Parent = mainFrame
buttonsContainer.Size = UDim2.new(0.9, 0, 0.25, 0)
buttonsContainer.Position = UDim2.new(0.05, 0, 0.65, 0)

checkKeyButton.Parent = buttonsContainer
checkKeyButton.Text = "Check Key"
checkKeyButton.Size = UDim2.new(0.5, -5, 1, 0)
checkKeyButton.Position = UDim2.new(0, 0, 0, 0)
checkKeyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)

getKeyButton.Parent = buttonsContainer
getKeyButton.Text = "Get Key"
getKeyButton.Size = UDim2.new(0.5, -5, 1, 0)
getKeyButton.Position = UDim2.new(0.5, 5, 0, 0)
getKeyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)

discordButton.Parent = buttonsContainer
discordButton.Text = "Join Discord"
discordButton.Size = UDim2.new(0.9, 0, 0.2, 0)
discordButton.Position = UDim2.new(0.05, 0, 0.92, 0)
discordButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)

-- Logic
local keyFileUrl = "https://raw.githubusercontent.com/1p2o3l4k/sf3fda-2S-df-TYJR32WDD2e2w/refs/heads/main/DZF%23RSDFQ3tHR%5EhEFadf3.txt"
local expiryTimeInSeconds = 24 * 60 * 60 -- 24 jam
local savedKey = nil
local countdownActive = false

function onMessage(msg)
    validationLabel.Text = msg
end

function fWait(seconds)
    wait(seconds)
end

function fSpawn(func)
    spawn(func)
end

-- Simpan key dengan timestamp
function saveKeyWithTimestamp(key)
    local timestamp = os.time()
    local keyWithTimestamp = key .. "|" .. tostring(timestamp)
    writefile("savedKey.txt", keyWithTimestamp)
    savedKey = keyWithTimestamp
end

-- Memuat key yang tersimpan dan memeriksa apakah sudah kadaluarsa
function loadKeyWithTimestamp()
    if isfile("savedKey.txt") then
        savedKey = readfile("savedKey.txt")
        local key, timestamp = parseKeyAndTimestamp(savedKey)
        if os.time() - tonumber(timestamp) >= expiryTimeInSeconds then
            onMessage("Saved key has expired!")
            delfile("savedKey.txt")
            savedKey = nil
        else
            savedKey = key
        end
    end
end

-- Pisahkan key dan timestamp dari format yang disimpan
function parseKeyAndTimestamp(keyWithTimestamp)
    local key, timestamp = keyWithTimestamp:match("([^|]+)|([^|]+)")
    return key, timestamp
end

-- Memulai countdown setelah key divalidasi
function startCountdown(seconds)
    countdownActive = true
    for i = seconds, 0, -1 do
        onMessage("Time remaining: " .. i .. " seconds")
        fWait(1)
    end
    countdownActive = false
    onMessage("Time's up! Please re-enter your key.")
    savedKey = nil
    if isfile("savedKey.txt") then
        delfile("savedKey.txt")
    end
    screenGui.Enabled = true
end

-- Fungsi untuk memeriksa apakah key sesuai dengan format di file
function verifyNormalKey(key, content)
    local pattern = '{Normalkey%s*=%s*"' .. key .. '"}'
    return string.find(content, pattern) ~= nil
end

-- Fungsi utama untuk memvalidasi key
function verify(key)
    onMessage("Checking key...")

    local status, result = pcall(function() 
        return game:HttpGetAsync(keyFileUrl)
    end)
    
    if status then
        if verifyNormalKey(key, result) then
            onMessage("Key is valid!")
            saveKeyWithTimestamp(key) 
            if not countdownActive then
                fSpawn(function()
                    startCountdown(expiryTimeInSeconds) 
                end)
            end
            return true
        else
            onMessage("Key is invalid!")
            return false
        end
    else
        onMessage("An error occurred while contacting the server!")
        return false
    end
end

-- Fungsi untuk mendapatkan key
getKeyButton.MouseButton1Click:Connect(function()
    setclipboard('https://medusastore.tech/halaman/postingan/point-key.html')
    validationLabel.Text = "Link Get Key Copied!"
    validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

-- Fungsi untuk mendapatkan link Discord
discordButton.MouseButton1Click:Connect(function()
    setclipboard('https://discord.com/invite/brutality-hub-1182005198206545941')
    validationLabel.Text = "Link Discord Copied!"
    validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

-- Fungsi untuk mengecek validasi key
checkKeyButton.MouseButton1Click:Connect(function()
    local key = textBox.Text
    if verify(key) then
        validationLabel.Text = "Key Is Valid!"
        validationLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(2)
        validationLabel.Text = "Thanks For Using"
        validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        wait(2)
        local tween = TweenService:Create(mainFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 1.5, -100)})
        tween:Play()
        tween.Completed:Connect(function()
            screenGui:Destroy()
        end)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vldtncywdlojtnvjlmvyrbszljd/asedesa/main/zxcv.lua", true))()
    else
        validationLabel.Text = "Key Is Not Valid!"
        validationLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

-- Animasi tampilan
wait(3)
local tween = TweenService:Create(mainFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 0.5, -100)})
tween:Play()

-- Memuat key yang tersimpan
loadKeyWithTimestamp()
if savedKey then
    if verify(savedKey) then
        onMessage("Saved key is valid!")
        screenGui.Enabled = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vldtncywdlojtnvjlmvyrbszljd/asedesa/main/zxcv.lua", true))()
    else
       
