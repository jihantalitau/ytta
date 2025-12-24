-- ServerScriptService/RespawnAll_Server.server.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local event = ReplicatedStorage:WaitForChild("RespawnAllEvent")

local ADMINS = {
	[123456789] = true, -- GANTI DENGAN USER ID KAMU
}

event.OnServerEvent:Connect(function(player)
	if not ADMINS[player.UserId] then return end

	for _, plr in ipairs(Players:GetPlayers()) do
		plr:LoadCharacter()
	end
end)
