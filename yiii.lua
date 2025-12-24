-- FAKE NPC TELEPORT SPAM (CLIENT / LOCAL)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer
local cam = workspace.CurrentCamera

local ENABLE = true
local CLONES = 8        -- jangan kebanyakan di HP
local RADIUS = 50

local srcChar = lp.Character or lp.CharacterAdded:Wait()

local folder = Instance.new("Folder", workspace)
folder.Name = "FakeTeleportNPCs"

local clones = {}

for i = 1, CLONES do
	local c = srcChar:Clone()
	c.Name = "FakeNPC_"..i
	c.Parent = folder

	for _,d in ipairs(c:GetDescendants()) do
		if d:IsA("Script") or d:IsA("LocalScript") then
			d:Destroy()
		end
	end

	clones[#clones+1] = c
end

RunService.RenderStepped:Connect(function()
	if not ENABLE then return end

	for _,c in ipairs(clones) do
		local hrp = c:FindFirstChild("HumanoidRootPart")
		if hrp then
			hrp.CFrame =
				cam.CFrame *
				CFrame.new(
					math.random(-RADIUS,RADIUS),
					math.random(-5,5),
					math.random(-RADIUS,RADIUS)
				)
		end
	end
end)

print("👥 Fake NPC Teleport Spam ON")
