-- ServerScriptService/ServerStressTest.server.lua
-- HANYA UNTUK MAP SENDIRI / AKUN SENDIRI / PRIVATE SERVER

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local PathfindingService = game:GetService("PathfindingService")
local Debris = game:GetService("Debris")

-- ====== KONFIGURASI (NAIKKAN BERTAHAP) ======
local CPU_LOAD_ITER = 3e5        -- beban CPU
local PART_BATCH = 20            -- jumlah part per batch
local PART_INTERVAL = 0.25       -- interval spawn
local PART_LIFETIME = 6          -- auto cleanup
local PATH_INTERVAL = 1.5        -- interval pathfinding
local HEARTBEAT_WORK = 4000      -- kerja per frame

-- ====== 1) CPU LOAD (SERVER-SIDE) ======
task.spawn(function()
	while true do
		local acc = 0
		for i = 1, CPU_LOAD_ITER do
			acc += math.sqrt(i)
		end
		task.wait(0.1)
	end
end)

-- ====== 2) PHYSICS + MEMORY LOAD (TERKONTROL) ======
task.spawn(function()
	while true do
		for i = 1, PART_BATCH do
			local p = Instance.new("Part")
			p.Size = Vector3.new(3,3,3)
			p.Anchored = false
			p.Position = Vector3.new(
				math.random(-150,150),
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
