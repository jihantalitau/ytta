-- ServerScriptService/RespawnAll.server.lua
-- RESPAWN MASAL | PRIVATE / TESTING

local Players = game:GetService("Players")

print("RESPAWN MASAL: SCRIPT AKTIF")

local function respawnAll()
	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character then
			player:LoadCharacter()
		end
	end
end

-- Jalankan sekali saat server mulai
task.wait(1) -- tunggu player spawn
respawnAll()
