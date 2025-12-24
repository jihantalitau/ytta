-- CHARACTER STATE SPAM (CLIENT)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local ENABLE = true
local STATES = {
	Enum.HumanoidStateType.Jumping,
	Enum.HumanoidStateType.Freefall,
	Enum.HumanoidStateType.GettingUp,
	Enum.HumanoidStateType.Seated,
	Enum.HumanoidStateType.RunningNoPhysics
}

task.spawn(function()
	while ENABLE do
		hum:ChangeState(STATES[math.random(#STATES)])
		task.wait(math.random(5,15)/100)
	end
end)

print("🤖 Character State Spam ON")
