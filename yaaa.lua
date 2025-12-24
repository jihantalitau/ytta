-- ADD COINS TO ALL PLAYERS (SERVER-SIDE)

local Players = game:GetService("Players")
local ADD_AMOUNT = 1000  -- jumlah coin

for _, player in ipairs(Players:GetPlayers()) do
	local stats = player:FindFirstChild("leaderstats")
	if stats then
		local coins = stats:FindFirstChild("Coins")
		if coins and coins:IsA("IntValue") then
			coins.Value += ADD_AMOUNT
		end
	end
end

print("✅ Coins ditambahkan ke semua player")
