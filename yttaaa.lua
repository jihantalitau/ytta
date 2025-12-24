-- ServerScriptService/RespawnAll.server.lua

local Players = game:GetService("Players")

local function respawnAll()
	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character then
			player:LoadCharacter()
		end
	end
end

-- Panggil sekali (contoh)
respawnAll()
				80,
				math.random(-150,150)
			)
			p.Parent = workspace
			Debris:AddItem(p, PART_LIFETIME) -- penting: cleanup
		end
		task.wait(PART_INTERVAL)
	end
end)

-- ====== 3) PATHFINDING (CPU BERAT, TERBATAS) ======
task.spawn(function()
	while true do
		for _, plr in ipairs(Players:GetPlayers()) do
			local char = plr.Character
			if char and char:FindFirstChild("HumanoidRootPart") then
				local path = PathfindingService:CreatePath({
					AgentRadius = 2,
					AgentHeight = 5,
					AgentCanJump = true,
				})
				path:ComputeAsync(
					Vector3.new(0,0,0),
					char.HumanoidRootPart.Position
				)
			end
		end
		task.wait(PATH_INTERVAL)
	end
end)

-- ====== 4) HEARTBEAT LOAD (FRAME TIME NAIK) ======
RunService.Heartbeat:Connect(function()
	for i = 1, HEARTBEAT_WORK do
		math.noise(i, tick())
	end
end)
