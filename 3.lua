local keyFileUrl = "https://raw.githubusercontent.com/1p2o3l4k/sf3fda-2S-df-TYJR32WDD2e2w/refs/heads/main/DZF%23RSDFQ3tHR%5EhEFadf3.txt"
local savedKey = nil
local savedTimestamp = nil

function onMessage(msg)
    print(msg)
end

-- Menyimpan normal key ke local storage
function saveKey(key)
    local keyData = key .. "|" .. os.time()
    writefile("savedKey.txt", keyData)
    savedKey = key
    savedTimestamp = os.time()
end

-- Memuat normal key dari local storage
function loadKey()
    if isfile("savedKey.txt") then
        local keyData = readfile("savedKey.txt")
        savedKey, savedTimestamp = keyData:match("([^|]+)|([^|]*)")
        savedTimestamp = tonumber(savedTimestamp)
    end
end

-- Verifikasi normal key dengan data di GitHub
function verifyNormalKey(key, content)
    local pattern = '{Normalkey = "' .. key .. '"}'
    return string.find(content, pattern) ~= nil
end

-- Mengecek apakah key sudah kadaluarsa (lebih dari 24 jam)
function isKeyExpired(timestamp)
    return (os.time() - timestamp) >= (24 * 60 * 60)
end

-- Mendapatkan konten dari raw file GitHub
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

-- Verifikasi key yang dimasukkan oleh pengguna
function verify(key)
    local content = fetchKeyContent()
    
    if content then
        if verifyNormalKey(key, content) then
            onMessage("Normal key is valid!")
            saveKey(key)
            return true
        else
            onMessage("Key is invalid!")
            return false
        end
    else
        return false
    end
end

-- Ketika tombol check key diklik
checkKeyButton.MouseButton1Click:Connect(function()
    local key = textBox.Text

    if verify(key) then
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

-- Load key yang tersimpan saat aplikasi dijalankan
loadKey()

-- Ambil konten dari GitHub untuk validasi
local content = fetchKeyContent()

if savedKey and content then
    -- Cek apakah key kadaluarsa
    if savedTimestamp and isKeyExpired(savedTimestamp) then
        onMessage("Your saved key has expired, please enter a new key.")
        screenGui.Enabled = true
    elseif verifyNormalKey(savedKey, content) then
        onMessage("Saved key is valid!")
        screenGui.Enabled = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1p2o3l4k/251c19q381fdaza6163ezs6-1d6231z6s2/refs/heads/main/L15.lua"))()
    else
        onMessage("Your saved key is invalid, please enter a new key.")
        screenGui.Enabled = true
    end
else
    onMessage("Please enter a key.")
    screenGui.Enabled = true
end
