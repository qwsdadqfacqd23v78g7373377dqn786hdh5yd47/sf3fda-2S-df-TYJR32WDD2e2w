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
    print("Fake graphics applied: Super HD mode on (visual only)")
end

-- Menjalankan fungsi fake graphics
applyFakeGraphics()
