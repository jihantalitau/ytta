-- ADD COINS TO YOURSELF (SERVER-SIDE)

local Players = game:GetService("Players")
local TARGET_USERID = 9683969863 -- ganti kalau mau
local ADD_AMOUNT = 5000

for _, player in ipairs(Players:GetPlayers()) do
	if player.UserId == TARGET_USERID then
		local stats = player:FindFirstChild("leaderstats")
		if stats then
			local coins = stats:FindFirstChild("Coins")
			if coins and coins:IsA("IntValue") then
				coins.Value += ADD_AMOUNT
				print("✅ Coins ditambahkan ke", player.Name)
			end
		end
	end
end
