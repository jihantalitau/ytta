-- SERVER STRESS TEST (TERKONTROL)
-- Jalankan di Studio / Private Server SAJA
-- Ada LIMIT + STOP SWITCH

local RunService = game:GetService("RunService")
local PathfindingService = game:GetService("PathfindingService")

local ENABLE = true        -- set false untuk stop
local MAX_NPC = 50       -- naikkan perlahan (jangan lompat)
local TICK_BUDGET = 0.01   -- throttle agar tidak liar

local npcs = {}
local last = os.clock()

local function spawnNPC()
	local m = Instance.new("Model")
	local hrp = Instance.new("Part")
	hrp.Name = "HumanoidRootPart"
	hrp.Size = Vector3.new(2,2,1)
	hrp.Position = Vector3.new(math.random(-100,100), 10, math.random(-100,100))
	hrp.Parent = m

	local hum = Instance.new("Humanoid")
	hum.Parent = m

	m.Parent = workspace
	return m
end

for i = 1, MAX_NPC do
	table.insert(npcs, spawnNPC())
end

RunService.Heartbeat:Connect(function()
	if not ENABLE then return end
	if os.clock() - last < TICK_BUDGET then return end
	last = os.clock()

	for _, m in ipairs(npcs) do
		local hrp = m:FindFirstChild("HumanoidRootPart")
		local hum = m:FindFirstChildOfClass("Humanoid")
		if hrp and hum then
			local goal = hrp.Position + Vector3.new(math.random(-40,40),0,math.random(-40,40))
			local path = PathfindingService:CreatePath()
			path:ComputeAsync(hrp.Position, goal)
			if path.Status == Enum.PathStatus.Success then
				for _, wp in ipairs(path:GetWaypoints()) do
					hum:MoveTo(wp.Position)
					hum.MoveToFinished:Wait(0.2)
				end
			end
		end
	end
end)
