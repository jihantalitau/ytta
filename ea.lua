local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local mouse = localPlayer:GetMouse()

-- Membuat tanda "Auto" yang mengambang di layar
local autoLabel = Instance.new("TextLabel")
autoLabel.Size = UDim2.new(0, 100, 0, 50)
autoLabel.Position = UDim2.new(0.5, -50, 0.5, -25)
autoLabel.Text = "Auto"
autoLabel.TextColor3 = Color3.new(1, 1, 1)  -- Putih
autoLabel.BackgroundColor3 = Color3.new(0, 0, 0)  -- Hitam
autoLabel.BackgroundTransparency = 0.5
autoLabel.Font = Enum.Font.SourceSansBold
autoLabel.FontSize = "Size18"
autoLabel.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Fungsi debug
local function debugPrint(message)
    print("DEBUG: " .. message)
end

-- Langkah 1: Tekan layar selama 2 detik
local function pressScreen()
    debugPrint("Mulai menekan layar selama 2 detik")
    local startTime = tick()
    while tick() - startTime < 2 do
        mouse.click()
        wait(0.01)  -- Click dengan interval kecil untuk mendukung serta
    end
    debugPrint("Selesai menekan layar")
end

-- Langkah 2: Jika muncul gambar ikan, klik
local function clickIfFishAppears()
    debugPrint("Mulai menunggu gambar ikan")
    local fishGui = localPlayer.PlayerGui:FindFirstChild("FishImage")  -- Ganti dengan nama GUI yang benar
    if fishGui then
        debugPrint("Gambar ikan ditemukan, melakukan klik")
        mouse.click()
    else
        debugPrint("Gambar ikan tidak ditemukan")
    end
end

-- Langkah 3: Jika muncul bar dengan warna merah, jangan klik, hijau, klik dengan cepat
local function clickBasedOnColor()
    debugPrint("Mulai mengecek warna bar")
    local colorBar = localPlayer.PlayerGui:FindFirstChild("ColorBar")  -- Ganti dengan nama GUI yang benar
    if colorBar then
        local color = colorBar.BackgroundColor3
        if color == Color3.new(1, 0, 0) then  -- Warna merah
            debugPrint("Warna bar merah, tidak melakukan klik")
        else  -- Warna hijau
            debugPrint("Warna bar hijau, melakukan klik dengan cepat")
            local startTime = tick()
            while tick() - startTime < 1 do  -- Sesuaikan waktu dengan kewajiban
                mouse.click()
                wait(0.01)
            end
        end
    else
        debugPrint("Bar warna tidak ditemukan")
    end
end

-- Main function untuk menjalankan semua langkah
local function main()
    pressScreen()
    clickIfFishAppears()
    clickBasedOnColor()
end

-- Jika "Auto" aktif, jalanan script
if autoLabel then
    debugPrint("Script 'Auto' aktif, mulai menjalankan fungsi-fungsi")
    main()
end
