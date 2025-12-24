-- RESPAWN ALL PLAYER - SERVER EXECUTE
-- Jalankan di Command Bar / Server-side

local Players = game:GetService("Players")

for _, player in ipairs(Players:GetPlayers()) do
	pcall(function()
		player:LoadCharacter()
	end)
end

print("✅ Semua player berhasil di-respawn")
