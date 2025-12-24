-- TELEPORT KE PLAYER TERDEKAT

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local myChar = lp.Character or lp.CharacterAdded:Wait()
local myHRP = myChar:WaitForChild("HumanoidRootPart")

local nearest, dist = nil, math.huge

for _, plr in ipairs(Players:GetPlayers()) do
	if plr ~= lp and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		local d = (plr.Character.HumanoidRootPart.Position - myHRP.Position).Magnitude
		if d < dist then
			dist = d
			nearest = plr
		end
	end
end

if nearest then
	myHRP.CFrame = nearest.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-3)
	print("✅ Teleport ke player terdekat:", nearest.Name)
else
	warn("❌ Tidak ada player")
end
