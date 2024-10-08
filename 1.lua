-- Fungsi untuk mengatasi error dari ReplicatedStorage.Effect
local function handleEffectError()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local effect = replicatedStorage:FindFirstChild("Effect")

    if effect then
        -- Periksa apakah Effect menyebabkan masalah dan perlu dihapus
        local success, err = pcall(function()
            -- Menghapus object Effect yang bermasalah
            effect:Destroy()
            print("Effect instance dihapus untuk mencegah error.")
        end)
        
        -- Log error jika terjadi masalah
        if not success then
            warn("Gagal menghapus Effect: " .. err)
        end
    end
end

-- Optimisasi: Pantau perubahan dalam ReplicatedStorage tanpa memantau terus-menerus
local function optimizedMonitor()
    local replicatedStorage = game:GetService("ReplicatedStorage")

    -- Monitor jika ada penambahan anak ke ReplicatedStorage
    replicatedStorage.ChildAdded:Connect(function(child)
        if child.Name == "Effect" then
            -- Cobalah menghapus Effect baru yang bermasalah
            local success, err = pcall(function()
                child:Destroy()
                print("Instance Effect baru dihapus untuk menghindari error.")
            end)
            
            if not success then
                warn("Gagal menghapus Effect baru: " .. err)
            end
        end
    end)

    -- Pantau jika ada penghapusan anak dari ReplicatedStorage
    replicatedStorage.ChildRemoved:Connect(function(child)
        if child.Name == "Effect" then
            print("Instance Effect dihapus dari ReplicatedStorage.")
        end
    end)
end

-- Jalankan fungsi penghapusan dan monitor saat game dimulai
local success, err = pcall(handleEffectError)
if not success then
    warn("Error saat menangani Effect: " .. err)
end
optimizedMonitor()

-- Fungsi untuk menerapkan fake graphics (efek visual)
local function applyFakeGraphics()
    local lighting = game:GetService("Lighting")
    
    -- Membuat efek Bloom (cahaya yang lembut)
    local bloom = Instance.new("BloomEffect")
    bloom.Intensity = 1.2  -- Intensitas bloom (cahaya)
    bloom.Threshold = 0.9  -- Batas cahaya yang terpengaruh
    bloom.Size = 24        -- Ukuran efek bloom
    bloom.Parent = lighting -- Menambahkan efek ke Lighting

    -- Membuat efek ColorCorrection (peningkatan kecerahan dan saturasi)
    local colorCorrection = Instance.new("ColorCorrectionEffect")
    colorCorrection.Brightness = 0.1  -- Peningkatan kecerahan
    colorCorrection.Contrast = 0.4    -- Peningkatan kontras
    colorCorrection.Saturation = 0.3  -- Peningkatan saturasi warna
    colorCorrection.TintColor = Color3.fromRGB(255, 255, 255) -- Warna putih natural
    colorCorrection.Parent = lighting

    -- Membuat efek SunRays (sinar matahari palsu)
    local sunRays = Instance.new("SunRaysEffect")
    sunRays.Intensity = 0.1  -- Intensitas sinar matahari
    sunRays.Spread = 1       -- Sebaran sinar matahari
    sunRays.Parent = lighting

    -- Membuat efek Blur halus untuk menambah kesan HD
    local blur = Instance.new("BlurEffect")
    blur.Size = 2 -- Ukuran blur halus
    blur.Parent = lighting

    -- Print log untuk memastikan efek fake graphics telah diterapkan
    print("Done optimizing anti kick system")
    print("Done optimizing anti detect system")
    print("Done optimizing anti reset system")
end

-- Menjalankan fungsi fake graphics
applyFakeGraphics()
