-- StarterGui/RespawnGui/RespawnButton/LocalScript

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local event = ReplicatedStorage:WaitForChild("RespawnAllEvent")

script.Parent.MouseButton1Click:Connect(function()
	event:FireServer()
end)
