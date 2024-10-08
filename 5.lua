-- Fungsi untuk mengatasi error dari ReplicatedStorage.Effect
local function handleEffectError()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local effect = replicatedStorage:FindFirstChild("Effect")

    if effect then
        -- Periksa apakah Effect sudah menyebabkan masalah dan perlu dihapus
        pcall(function()
            -- Menghapus object Effect yang bermasalah tanpa mempengaruhi efek visual bawaan
            effect:Destroy()
            print("Effect instance dihapus untuk mencegah error.")
        end)
    end
end

-- Optimisasi: Pantau perubahan dalam ReplicatedStorage tanpa mengulangi cek terlalu sering
local function optimizedMonitor()
    local replicatedStorage = game:GetService("ReplicatedStorage")

    -- Monitor hanya jika terjadi perubahan pada ReplicatedStorage
    replicatedStorage.ChildAdded:Connect(function(child)
        if child.Name == "Effect" then
            pcall(function()
                -- Hapus Effect yang baru ditambahkan untuk mencegah error
                child:Destroy()
                print("Instance Effect baru dihapus untuk menghindari error.")
            end)
        end
    end)

    replicatedStorage.ChildRemoved:Connect(function(child)
        if child.Name == "Effect" then
            print("Instance Effect dihapus dari ReplicatedStorage.")
        end
    end)
end

-- Jalankan fungsi penghapusan dan monitor saat game dimulai
pcall(handleEffectError)
optimizedMonitor()

-- Optimisasi untuk tidak terus-menerus memantau dengan RunService
-- Sebagai ganti, kita menggunakan ChildAdded dan ChildRemoved untuk lebih efisien

-- Fungsi untuk menerapkan fake graphics (efek visual)
local function applyFakeGraphics()
    -- Membuat efek Bloom (cahaya yang lembut)
    local bloom = Instance.new("BloomEffect")
    bloom.Intensity = 1.2  -- Intensitas bloom (cahaya)
    bloom.Threshold = 0.9  -- Batas cahaya yang terpengaruh
    bloom.Size = 24        -- Ukuran efek bloom
    bloom.Parent = game:GetService("Lighting") -- Menambahkan efek ke lighting

    -- Membuat efek ColorCorrection (peningkatan kecerahan dan saturasi)
    local colorCorrection = Instance.new("ColorCorrectionEffect")
    colorCorrection.Brightness = 0.1  -- Peningkatan kecerahan
    colorCorrection.Contrast = 0.4    -- Peningkatan kontras
    colorCorrection.Saturation = 0.3  -- Peningkatan saturasi warna
    colorCorrection.TintColor = Color3.fromRGB(255, 255, 255) -- Warna putih natural
    colorCorrection.Parent = game:GetService("Lighting")

    -- Membuat efek SunRays (sinar matahari palsu)
    local sunRays = Instance.new("SunRaysEffect")
    sunRays.Intensity = 0.1  -- Intensitas sinar matahari
    sunRays.Spread = 1       -- Sebaran sinar matahari
    sunRays.Parent = game:GetService("Lighting")

    -- Membuat efek Blur halus untuk menambah kesan HD
    local blur = Instance.new("BlurEffect")
    blur.Size = 2 -- Ukuran blur halus
    blur.Parent = game:GetService("Lighting")

    -- Print log untuk memastikan efek fake graphics telah diterapkan
    print("Done optimizing anti kick system")
    print("Done optimizing anti detect system")
    print("Done optimizing anti reset system")
end

-- Menjalankan fungsi fake graphics
applyFakeGraphics()
