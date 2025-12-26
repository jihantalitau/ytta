local Players = game:GetService("Players")

-- Kordinat posisi awal atau checkpoint
local respawnPosition = Vector3.new(0, 5, 0)  -- Ganti dengan kordinat yang benar

-- Fungsi untuk respawn semua pemain
local function respawnAllPlayers()
    print("Respawn semua pemain...")
    for _, player in pairs(Players:GetPlayers()) do
        local character = player.Character or player.CharacterAdded:Wait()
        -- Reset karakter
        character:BreakJoints()
        player.LoadCharacter()
        -- Tunggu sampai karakter baru dibuat
        character = player.Character or player.CharacterAdded:Wait()
        character:SetPrimaryPartCFrame(CFrame.new(respawnPosition))
    end
end

-- Koneksi ke event PlayerAdded
Players.PlayerAdded:Connect(function(player)
    print(player.Name .. " bergabung ke server.")
    player.CharacterAdded:Connect(function(character)
        character:SetPrimaryPartCFrame(CFrame.new(respawnPosition))
    end)
end)

-- Contoh penggunaan: Respawn semua pemain setelah 10 detik
wait(2)
respawnAllPlayers()
