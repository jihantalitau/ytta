-- RejoinAll_OneFile.server.lua
-- SATU FILE SAJA | MAP SENDIRI | PRIVATE SERVER

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PLACE_ID = game.PlaceId

-- ====== ADMIN (GANTI USERID KAMU) ======
local ADMINS = {
	[123456789] = true, -- GANTI DENGAN USERID KAMU
}

-- ====== REMOTE EVENT (AUTO CREATE) ======
local event = Instance.new("RemoteEvent")
event.Name = "RejoinAllEvent"
event.Parent = ReplicatedStorage

-- ====== FUNGSI REJOIN ======
local function rejoinAll()
	for _, player in ipairs(Players:GetPlayers()) do
		TeleportService:Teleport(PLACE_ID, player)
	end
end

-- ====== SERVER HANDLER ======
event.OnServerEvent:Connect(function(player)
	if not ADMINS[player.UserId] then return end
	rejoinAll()
end)

-- ====== GUI AUTO CREATE ======
local function createGui(player)
	local gui = Instance.new("ScreenGui")
	gui.Name = "RejoinAllGui"
	gui.ResetOnSpawn = false

	local btn = Instance.new("TextButton")
	btn.Size = UDim2.fromScale(0.25, 0.1)
	btn.Position = UDim2.fromScale(0.375, 0.45)
	btn.Text = "REJOIN ALL"
	btn.TextScaled = true
	btn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Parent = gui

	local localScript = Instance.new("LocalScript")
	localScript.Source = [[
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local event = ReplicatedStorage:WaitForChild("RejoinAllEvent")

		script.Parent.MouseButton1Click:Connect(function()
			event:FireServer()
		end)
	]]
	localScript.Parent = btn

	gui.Parent = player:WaitForChild("PlayerGui")
end

-- ====== PLAYER JOIN ======
Players.PlayerAdded:Connect(function(player)
	if ADMINS[player.UserId] then
		player.CharacterAdded:Wait()
		task.wait(1)
		createGui(player)
	end
end)
