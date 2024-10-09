local keyFileUrl = "https://raw.githubusercontent.com/1p2o3l4k/sf3fda-2S-df-TYJR32WDD2e2w/refs/heads/main/DZF%23RSDFQ3tHR%5EhEFadf3.txt"
local savedKey = nil
local savedUsername = nil
local savedTimestamp = nil

function onMessage(msg)
    print(msg)
end

function saveKey(key, username, isNormalKey)
    local keyData = key .. "|" .. (username or "") .. "|" .. (isNormalKey and os.time() or "")
    writefile("savedKey.txt", keyData)
    savedKey = key
    savedUsername = username
    savedTimestamp = isNormalKey and os.time() or nil
end

function loadKey()
    if isfile("savedKey.txt") then
        local keyData = readfile("savedKey.txt")
        savedKey, savedUsername, savedTimestamp = keyData:match("([^|]+)|([^|]*)|([^|]*)")
        savedTimestamp = tonumber(savedTimestamp)
    end
end

function verifyNormalKey(key, content)
    local pattern = '{Normalkey = "' .. key .. '"}'
    return string.find(content, pattern) ~= nil
end

function verifyPremiumKey(key, username, content)
    local pattern = '{PertaliteKey%s*=%s*"' .. key .. '"%s*Username%s*=%s*"' .. username .. '"}'
    return string.find(content, pattern) ~= nil
end


function isKeyExpired(timestamp)
    return (os.time() - timestamp) >= (24 * 60 * 60)
end

function fetchKeyContent()
    local status, content = pcall(function()
        return game:HttpGetAsync(keyFileUrl)
    end)
    
    if status then
        return content
    else
        onMessage("Error contacting the server!")
        return nil
    end
end

function verify(key, username)
    local content = fetchKeyContent()
    
    if content then
        if verifyNormalKey(key, content) then
            onMessage("Normal key is valid!")
            saveKey(key, nil, true)
            return true
        end

        if username and verifyPremiumKey(key, username, content) then
            onMessage("Premium key is valid!")
            saveKey(key, username, false)
            return true
        end

        onMessage("Key is invalid!")
        return false
    else
        return false
    end
end

checkKeyButton.MouseButton1Click:Connect(function()
    local key = textBox.Text
    local username = game.Players.LocalPlayer.Name

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
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1p2o3l4k/251c19q381fdaza6163ezs6-1d6231z6s2/refs/heads/main/L15.lua"))()
    else
        validationLabel.Text = "Checking Key..."
        validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        wait(1.7)
        validationLabel.Text = "Key Is Not Valid!"
        validationLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

loadKey()

local content = fetchKeyContent()

if savedKey and content then
    if savedTimestamp and isKeyExpired(savedTimestamp) then
        onMessage("Please enter a new key.")
        screenGui.Enabled = true 
    elseif verify(savedKey, savedUsername) then
        onMessage("Saved key is valid!")
        screenGui.Enabled = false 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1p2o3l4k/251c19q381fdaza6163ezs6-1d6231z6s2/refs/heads/main/L15.lua"))()
    else
        onMessage("Please enter a new key.")
        screenGui.Enabled = true
    end
else
    onMessage("Please enter a new key.")
    screenGui.Enabled = true
end
