local UserInputService = game:GetService("UserInputService")

-- Langkah 1: Tekan layar selama 2 detik
local function pressScreen()
    local screenTouch = Instance.new("ScreenTouch")

    local function onTouchBegan(touch)
        screenTouch.Position = touch.Position
    end

    screenTouch.TouchBegan:Connect(onTouchBegan)

    wait(2)  -- Menekan layar selama 2 detik
    screenTouch:Destroy()
end

-- Langkah 2: Jika muncul gambar ikan, klik
local function clickIfFishAppears()
    local fishImage = Instance.new("ImageLabel")
    fishImage.Parent = game.Players.LocalPlayer.PlayerGui
    fishImage.Size = UDim2.new(0, 100, 0, 100)
    fishImage.Position = UDim2.new(0.5, -50, 0.5, -50)
    fishImage.Image = "rbxassetid://123456789"  -- Ganti dengan asset ID gambar ikan

    local clicked = false

    local function onInputBegan(input, gameProcessed)
        if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 and not clicked then
            mouse.click()
            clicked = true
        end
    end

    UserInputService.InputBegan:Connect(onInputBegan)

    -- Hanya melakukan klik jika gambar ikan muncul
    wait(1)  -- Masukan waktu tunggu yang sesuai
    if not clicked then
        mouse.click()  -- Klik jika gambar ikan muncul
    end

    fishImage:Destroy()
end

-- Langkah 3: Jika muncul bar dengan warna merah, jangan klik, hijau, klik dengan cepat
local function clickBasedOnColor()
    local colorBar = Instance.new("Frame")
    colorBar.Parent = game.Players.LocalPlayer.PlayerGui
    colorBar.Size = UDim2.new(0, 200, 0, 50)
    colorBar.Position = UDim2.new(0.5, -100, 0.8, -25)
    colorBar.BackgroundColor3 = Color3.new(0, 1, 0)  -- Default warna hijau

    local clicked = false

    local function onInputBegan(input, gameProcessed)
        if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 and not clicked then
            mouse.click()
            clicked = true
        end
    end

    UserInputService.InputBegan:Connect(onInputBegan)

    -- Cek warna dan aktualisasi klik di layar
    wait(1)  -- Masukan waktu tunggu yang sesuai
    if colorBar.BackgroundColor3 == Color3.new(1, 0, 0) then  -- Warna merah
        -- Jangan klik
        clicked = true
    else  -- Warna hijau
        -- Klik dengan cepat
        mouse.click()
    end

    colorBar:Destroy()
end

-- Main function untuk menjalankan semua langkah
local function main()
    pressScreen()
    clickIfFishAppears()
    clickBasedOnColor()
end

main()
