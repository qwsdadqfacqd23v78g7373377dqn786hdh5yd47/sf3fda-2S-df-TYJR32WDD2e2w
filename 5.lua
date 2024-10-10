-- Tambahkan TextLabel untuk menampilkan pesan di atas TextBox
local MessageLabel = Instance.new("TextLabel")
MessageLabel.Name = "MessageLabel"
MessageLabel.Parent = KeySection
MessageLabel.BackgroundTransparency = 1
MessageLabel.Position = UDim2.new(0.1, 0, 0.15, 0) -- Di atas TextBox
MessageLabel.Size = UDim2.new(0.8, 0, 0, 30)
MessageLabel.Font = Enum.Font.GothamBold
MessageLabel.Text = ""
MessageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
MessageLabel.TextSize = 16
MessageLabel.Visible = false -- Awalnya tidak terlihat

-- Fungsi untuk menampilkan pesan di atas TextBox
local function showMessage(text)
    MessageLabel.Text = text
    MessageLabel.Visible = true
    wait(2)  -- Pesan akan muncul selama 2 detik
    MessageLabel.Visible = false
end

-- Fungsi checkKey dengan pesan
local function checkKey()
    -- Logika untuk mengecek key dapat ditambahkan di sini
    print("Checking key: " .. KeyTextBox.Text)
    
    -- Menampilkan pesan di atas TextBox
    if KeyTextBox.Text == "" then
        showMessage("Please enter a key!")
    else
        showMessage("Key submitted: " .. KeyTextBox.Text)
    end
end

-- Fungsi untuk copy link dengan pesan "Link Copied"
local function copyLink()
    setclipboard("https://your-link-here.com")
    showMessage("Link copied!")
end

-- Fungsi untuk copy Discord link dengan pesan "Link Copied"
local function copyDiscordLink()
    setclipboard("https://discord.gg/your-discord")
    showMessage("Discord link copied!")
end

-- Koneksi tombol dengan fungsi yang sesuai
CheckKeyButton.MouseButton1Click:Connect(checkKey)
CopyLinkButton.MouseButton1Click:Connect(copyLink)
CopyDiscordButton.MouseButton1Click:Connect(copyDiscordLink)

-- Update username and profile picture
local player = game.Players.LocalPlayer
Username.Text = player.Name

-- Get player avatar
local userId = player.UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
ProfileImage.Image = content

-- Add hover effects
local function addHoverEffect(buttonContainer)
    local originalColor = buttonContainer.BackgroundColor3
    local button = buttonContainer:FindFirstChildOfClass("TextButton")
    
    button.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(buttonContainer, TweenInfo.new(0.3), {
            BackgroundColor3 = originalColor:Lerp(Color3.fromRGB(255, 255, 255), 0.2)
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(buttonContainer, TweenInfo.new(0.3), {
            BackgroundColor3 = originalColor
        }):Play()
    end)
end

addHoverEffect(CheckKeyButtonContainer)
addHoverEffect(CopyLinkButtonContainer)
addHoverEffect(CopyDiscordButtonContainer)
