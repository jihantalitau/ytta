-- SIMPLE FLY SCRIPT (EXECUTOR)
-- Key: F = Toggle Fly | WASD = Move | Space = Up | Ctrl = Down

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local flying = false
local speed = 50

local bv, bg
local control = {F=0,B=0,L=0,R=0,U=0,D=0}

local function startFly()
	flying = true
	humanoid.PlatformStand = true

	bv = Instance.new("BodyVelocity")
	bv.MaxForce = Vector3.new(9e9,9e9,9e9)
	bv.Velocity = Vector3.zero
	bv.Parent = hrp

	bg = Instance.new("BodyGyro")
	bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
	bg.CFrame = hrp.CFrame
	bg.Parent = hrp

	RunService.RenderStepped:Connect(function()
		if not flying then return end
		local cam = workspace.CurrentCamera
		local move =
			(cam.CFrame.LookVector * (control.F - control.B)) +
			(cam.CFrame.RightVector * (control.R - control.L)) +
			(Vector3.new(0,1,0) * (control.U - control.D))

		if move.Magnitude > 0 then
			bv.Velocity = move.Unit * speed
		else
			bv.Velocity = Vector3.zero
		end

		bg.CFrame = cam.CFrame
	end)
end

local function stopFly()
	flying = false
	humanoid.PlatformStand = false
	if bv then bv:Destroy() end
	if bg then bg:Destroy() end
end

UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.F then
		if flying then stopFly() else startFly() end
	end
	if input.KeyCode == Enum.KeyCode.W then control.F = 1 end
	if input.KeyCode == Enum.KeyCode.S then control.B = 1 end
	if input.KeyCode == Enum.KeyCode.A then control.L = 1 end
	if input.KeyCode == Enum.KeyCode.D then control.R = 1 end
	if input.KeyCode == Enum.KeyCode.Space then control.U = 1 end
	if input.KeyCode == Enum.KeyCode.LeftControl then control.D = 1 end
end)

UIS.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.W then control.F = 0 end
	if input.KeyCode == Enum.KeyCode.S then control.B = 0 end
	if input.KeyCode == Enum.KeyCode.A then control.L = 0 end
	if input.KeyCode == Enum.KeyCode.D then control.R = 0 end
	if input.KeyCode == Enum.KeyCode.Space then control.U = 0 end
	if input.KeyCode == Enum.KeyCode.LeftControl then control.D = 0 end
end)

print("✈️ Fly Script Loaded | Press F to Fly")
