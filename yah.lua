-- ServerScriptService/RejoinAll.server.lua
-- REJOIN MASAL | PRIVATE / TESTING

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local PLACE_ID = game.PlaceId

print("REJOIN MASAL: SCRIPT AKTIF")

-- Fungsi rejoin semua pemain
local function rejoinAll()
	for _, player in ipairs(Players:GetPlayers()) do
		local ok, err = pcall(function()
			TeleportService:Teleport(PLACE_ID, player)
		end)
		if not ok then
			warn("Gagal teleport:", player.Name, err)
		end
	end
end

-- Jalankan SEKALI saat server start
task.wait(2) -- beri waktu player spawn
rejoinAll()
