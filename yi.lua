-- PHYSICS GLITCH SELF (CLIENT / EXECUTOR)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local ENABLE = true

local bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(9e9,9e9,9e9)
bv.Parent = hrp

local bg = Instance.new("BodyAngularVelocity")
bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
bg.AngularVelocity = Vector3.new(0,0,0)
bg.Parent = hrp

RunService.RenderStepped:Connect(function()
	if not ENABLE then return end

	bv.Velocity = Vector3.new(
		math.random(-30,30),
		math.random(5,20),
		math.random(-30,30)
	)

	bg.AngularVelocity = Vector3.new(
		math.random(-10,10),
		math.random(-20,20),
		math.random(-10,10)
	)
end)

print("🌀 Physics Glitch Self ON")
