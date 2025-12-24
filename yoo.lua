-- FAKE NPC PANIC (CLIENT / EXECUTOR)
-- Clone lokal, tidak replikasi

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer
local cam = workspace.CurrentCamera

local ENABLE = true
local CLONES = 5         -- jumlah klon (jangan kebanyakan di HP)
local RADIUS = 40          -- area panik
local SPEED = 18

-- ambil model karakter untuk klon
local srcChar = lp.Character or lp.CharacterAdded:Wait()
local srcHum = srcChar:FindFirstChildOfClass("Humanoid")

local folder = Instance.new("Folder", workspace)
folder.Name = "LocalPanicNPCs"

local clones = {}

local function makeClone(i)
	local c = srcChar:Clone()
	c.Name = "PanicNPC_"..i
	c.Parent = folder
	for _,d in ipairs(c:GetDescendants()) do
		if d:IsA("Script") or d:IsA("LocalScript") then d:Destroy() end
	end
	local hrp = c:FindFirstChild("HumanoidRootPart")
	if hrp then
		hrp.CFrame = cam.CFrame * CFrame.new(math.random(-RADIUS,RADIUS),0,math.random(-RADIUS,RADIUS))
	end
	local hum = c:FindFirstChildOfClass("Humanoid")
	if hum then
		hum.WalkSpeed = SPEED
	end
	return c
end

for i=1,CLONES do
	clones[#clones+1] = makeClone(i)
end

RunService.RenderStepped:Connect(function()
	if not ENABLE then return end
	for _,c in ipairs(clones) do
		local hrp = c:FindFirstChild("HumanoidRootPart")
		local hum = c:FindFirstChildOfClass("Humanoid")
		if hrp and hum then
			local dir = (hrp.Position - cam.CFrame.Position).Unit
			local jitter = Vector3.new(math.random()-0.5,0,math.random()-0.5)
			hum:MoveTo(hrp.Position + (dir + jitter) * 6)
		end
	end
end)

print("🧍 Fake NPC Panic ON")
