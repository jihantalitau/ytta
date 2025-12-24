-- FLY MOBILE (TOUCH GUI) - EXECUTOR SAFE

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local humanoid = char:WaitForChild("Humanoid")
local camera = workspace.CurrentCamera

local flying = false
local speed = 40

local bv, bg
local moveDir = Vector3.zero

-- === GUI ===
local gui = Instance.new("ScreenGui")
gui.Name = "FlyMobileGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local function makeBtn(text, pos)
	local b = Instance.new("TextButton")
	b.Size = UDim2.fromScale(0.18, 0.1)
	b.Position = pos
	b.Text = text
	b.TextScaled = true
	b.BackgroundColor3 = Color3.fromRGB(40,40,40)
	b.TextColor3 = Color3.new(1,1,1)
	b.Parent = gui
	return b
end

local btnFly   = makeBtn("FLY",   UDim2.fromScale(0.05, 0.7))
local btnUp    = makeBtn("UP",    UDim2.fromScale(0.78, 0.55))
local btnDown  = makeBtn("DOWN",  UDim2.fromScale(0.78, 0.7))
local btnFwd   = makeBtn("GO",    UDim2.fromScale(0.42, 0.7))

-- === FLY LOGIC ===
local function startFly()
	flying = true
	humanoid.PlatformStand = true

	bv = Instance.new("BodyVelocity")
	bv.MaxForce = Vector3.new(9e9,9e9,9e9)
	bv.Parent = hrp

	bg = Instance.new("BodyGyro")
	bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
	bg.Parent = hrp

	RunService.RenderStepped:Connect(function()
		if not flying then return end
		bg.CFrame = camera.CFrame
		bv.Velocity = moveDir * speed
	end)
end

local function stopFly()
	flying = false
	humanoid.PlatformStand = false
	if bv then bv:Destroy() end
	if bg then bg:Destroy() end
	moveDir = Vector3.zero
end

-- === BUTTON EVENTS ===
btnFly.MouseButton1Click:Connect(function()
	if flying then stopFly() else startFly() end
end)

btnFwd.MouseButton1Down:Connect(function()
	moveDir = camera.CFrame.LookVector
end)
btnFwd.MouseButton1Up:Connect(function()
	moveDir = Vector3.zero
end)

btnUp.MouseButton1Down:Connect(function()
	moveDir = Vector3.new(0,1,0)
end)
btnUp.MouseButton1Up:Connect(function()
	moveDir = Vector3.zero
end)

btnDown.MouseButton1Down:Connect(function()
	moveDir = Vector3.new(0,-1,0)
end)
btnDown.MouseButton1Up:Connect(function()
	moveDir = Vector3.zero
end)

print("✈️ Fly Mobile Loaded")
