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
textBox.Text = "Input Your Key"
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
animationText.Text = "Welcome Brothers"
animationText.TextColor3 = Color3.fromRGB(255, 255, 255)
animationText.BackgroundTransparency = 1
animationText.Font = Enum.Font.GothamBold
animationText.TextSize = 40
animationText.Parent = screenGui

wait(2)
animationText.Text = "Subscribe Medusa Script"
wait(2)
animationText.Text = "Thanks For Using"
animationText.Visible = false
frame.Visible = true

-- Tween untuk transisi halus
frame.Position = UDim2.new(0.5, -225, 1.5, 0)
local tween = TweenService:Create(frame, TweenInfo.new(1), {Position = UDim2.new(0.5, -225, 0.5, -150)})
tween:Play()
------------------------------------------------------------------------------------------------
local keyFileUrl = "https://raw.githubusercontent.com/1p2o3l4k/sf3fda-2S-df-TYJR32WDD2e2w/refs/heads/main/DZF%23RSDFQ3tHR%5EhEFadf3.txt"
local allowPassThrough = false
local rateLimit = false
local rateLimitCountdown = 0
local errorWait = false
local useDataModel = true 
local countdownActive = false
local savedKey = nil
local expiryTimeInSeconds = 24 * 60 * 60 
local validUsernames = { "RobloxArmor1", "zilhannopasif", "Memek228222" }

function onMessage(msg)
    print(msg)
end

function fWait(seconds)
    wait(seconds)
end

function fSpawn(func)
    spawn(func)
end

function saveKeyWithTimestamp(key)
    local timestamp = os.time()
    local keyWithTimestamp = key .. "|" .. tostring(timestamp)
    writefile("BotunaKey.txt", keyWithTimestamp)
    savedKey = keyWithTimestamp
end

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

function parseKeyAndTimestamp(keyWithTimestamp)
    local key, timestamp = keyWithTimestamp:match("([^|]+)|([^|]+)")
    return key, timestamp
end

function startCountdown(seconds)
    countdownActive = true
    for i = seconds, 0, -1 do
        onMessage("Time remaining: " .. i .. " seconds")
        fWait(1)
    end
    countdownActive = false
    onMessage("Time's up! Please re-enter your key.")
    savedKey = nil
    if isfile("BotunaKey.txt") then
        delfile("BotunaKey.txt")
    end
    screenGui.Enabled = true
end

function verifyNormalKey(key, content)
    local pattern = '{Normalkey%s*=%s*"' .. key .. '"}'
    return string.find(content, pattern) ~= nil
end

function verifyUsername(username)
    for _, validUsername in ipairs(validUsernames) do
        if username == validUsername then
            return true
        end
    end
    return false
end

function verify(key)
    if errorWait or rateLimit then 
        return false
    end

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
        return allowPassThrough
    end
end
------------------------------------------------------------------------------------------------

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

checkKeyButton.MouseButton1Click:Connect(function()
    local key = textBox.Text
    local username = Players.LocalPlayer.Name
    if verifyUsername(username) then
        textBox.Text = "You are authorized"
        textBox.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(2)
        local tween = TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -225, 0.5, -150)})
        tween:Play()
        tween.Completed:Connect(function()
        blurEffect:Destroy()
        screenGui:Destroy()
    end)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1p2o3l4k/251c19q381fdaza6163ezs6-1d6231z6s2/refs/heads/main/L15.lua", true))()
    else
        if verify(key) then
            textBox.Text = "Key Is Valid!"
            textBox.TextColor3 = Color3.fromRGB(0, 255, 0)
            wait(2)
            textBox.Text = "Thanks For Using"
            textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            wait(2)
            local tween = TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -225, 0.5, -150)})
            tween:Play()
            tween.Completed:Connect(function()
              blurEffect:Destroy()
              screenGui:Destroy()
            end)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/1p2o3l4k/251c19q381fdaza6163ezs6-1d6231z6s2/refs/heads/main/L15.lua", true))()
        else
            textBox.Text = "Checking Key..."
            textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            wait(1.7)
            textBox.Text = "Key Is Not Valid!"
            textBox.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end
end)

wait(3)
local tween = TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -225, 0.5, -150)})
tween:Play()

loadKeyWithTimestamp()
if savedKey then
    if verify(savedKey) then
        onMessage("Saved key is valid!")
        screenGui.Enabled = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1p2o3l4k/251c19q381fdaza6163ezs6-1d6231z6s2/refs/heads/main/L15.lua", true))()
    else
        onMessage("Please enter a new key.")
    end
end
