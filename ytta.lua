-- ServerScriptService/LagExample_Bad.server.lua

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local PathfindingService = game:GetService("PathfindingService")

-- 1) LOOP TANPA JEDA (CPU SPIKE)
spawn(function()
	while true do
		-- kerja berat tanpa jeda
		local x = 0
		for i = 1, 1e6 do
			x += math.sqrt(i)
		end
	end
end)

-- 2) SPAWN PART TANPA BATAS (MEMORY + PHYSICS OVERLOAD)
spawn(function()
	while true do
		local p = Instance.new("Part")
		p.Size = Vector3.new(4,4,4)
		p.Anchored = false
		p.Position = Vector3.new(math.random(-100,100), 50, math.random(-100,100))
		p.Parent = workspace
	end
end)

-- 3) PATHFINDING BERULANG (CPU BERAT)
spawn(function()
	while true do
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
				local path = PathfindingService:CreatePath()
				path:ComputeAsync(Vector3.new(0,0,0), plr.Character.HumanoidRootPart.Position)
			end
		end
	end
end)

-- 4) RUNSERVICE HEARTBEAT TANPA KONTROL (FRAME DROP)
RunService.Heartbeat:Connect(function()
	for i = 1, 10000 do
		math.noise(i, tick())
	end
end)
