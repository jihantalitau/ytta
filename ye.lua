-- ADMIN COMMAND: ADD COINS
-- Letakkan di ServerScriptService

local Players = game:GetService("Players")

-- === KONFIG ADMIN ===
local ADMINS = {
	[9683969863] = true, -- owner game
	-- tambah admin lain:
	-- [123456789] = true
}

-- === NAMA STAT ===
local COIN_NAME = "Coins" -- leaderstats.Coins (IntValue)

local PREFIX = ":add"

local function addCoins(player, amount)
	local stats = player:FindFirstChild("leaderstats")
	if not stats then return end

	local coins = stats:FindFirstChild(COIN_NAME)
	if coins and coins:IsA("IntValue") then
		coins.Value += amount
	end
end

Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(msg)
		if not ADMINS[player.UserId] then return end

		local args = string.split(msg, " ")
		if args[1] == PREFIX then
			local amount = tonumber(args[2])
			if not amount then return end

			for _, plr in ipairs(Players:GetPlayers()) do
				addCoins(plr, amount)
			end

			print("✅ Admin", player.Name, "menambah", amount, "coins ke semua player")
		end
	end)
end)
