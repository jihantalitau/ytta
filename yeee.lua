-- TP BUTTON MOBILE

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local gui = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
gui.Name = "TPGui"
gui.ResetOnSpawn = false

local btn = Instance.new("TextButton", gui)
btn.Size = UDim2.fromScale(0.25, 0.1)
btn.Position = UDim2.fromScale(0.37, 0.8)
btn.Text = "TP PLAYER"
btn.TextScaled = true
btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
btn.TextColor3 = Color3.new(1,1,1)

btn.MouseButton1Click:Connect(function()
	local myChar = lp.Character or lp.CharacterAdded:Wait()
	local myHRP = myChar:WaitForChild("HumanoidRootPart")

	local nearest, dist = nil, math.huge
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= lp and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local d = (plr.Character.HumanoidRootPart.Position - myHRP.Position).Magnitude
			if d < dist then
				dist = d
				nearest = plr
			end
		end
	end

	if nearest then
		myHRP.CFrame = nearest.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-3)
	end
end)

print("📱 TP Button Loaded")
