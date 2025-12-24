-- ServerScriptService/RespawnAll_Delayed.server.lua

local Players = game:GetService("Players")

local function respawnAllDelayed(delayPerPlayer)
	for _, player in ipairs(Players:GetPlayers()) do
		task.wait(delayPerPlayer or 0.2)
		player:LoadCharacter()
	end
end

respawnAllDelayed(0.25)
