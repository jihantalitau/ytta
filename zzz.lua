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

-- Langkah 1: Tekan layar selama 2 detik
local function pressScreen()
    local function onTouchBegan(input, gameProcessed)
        if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
            local startTime = tick()
            while tick() - startTime < 2 do
                mouse.click()
                wait(0.01)  -- Click dengan interval kecil untuk mendukung serta
            end
        end
    end

    UserInputService.InputBegan:Connect(onTouchBegan)
end

-- Langkah 2: Jika muncul gambar ikan, klik
local function clickIfFishAppears()
    local function onInputBegan(input, gameProcessed)
        if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
            local fishGui = localPlayer.PlayerGui:FindFirstChild("FishImage")  -- Ganti dengan nama GUI yang benar
            if fishGui then
                mouse.click()
            end
        end
    end

    UserInputService.InputBegan:Connect(onInputBegan)
end

-- Langkah 3: Jika muncul bar dengan warna merah, jangan klik, hijau, klik dengan cepat
local function clickBasedOnColor()
    local function onInputBegan(input, gameProcessed)
        if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
            local colorBar = localPlayer.PlayerGui:FindFirstChild("ColorBar")  -- Ganti dengan nama GUI yang benar
            if colorBar then
                local color = colorBar.BackgroundColor3
                if color == Color3.new(1, 0, 0) then  -- Warna merah
                    -- Jangan klik
                else  -- Warna hijau
                    -- Klik dengan cepat
                    local startTime = tick()
                    while tick() - startTime < 1 do  -- Sesuaikan waktu dengan kewajiban
                        mouse.click()
                        wait(0.01)
                    end
                end
            end
        end
    end

    UserInputService.InputBegan:Connect(onInputBegan)
end

-- Main function untuk menjalankan semua langkah
local function main()
    pressScreen()
    clickIfFishAppears()
    clickBasedOnColor()
end

-- Jika "Auto" aktif, jalanan script
if autoLabel then
    main()
end
