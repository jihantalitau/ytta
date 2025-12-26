local sg = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
sg.Name = "DEBUG_GUI"

local t = Instance.new("TextLabel", sg)
t.Size = UDim2.new(0,300,0,80)
t.Position = UDim2.new(0.5,-150,0.1,0)
t.Text = "SCRIPT AKTIF"
t.TextScaled = true
t.BackgroundColor3 = Color3.fromRGB(0,0,0)
t.TextColor3 = Color3.fromRGB(0,255,0)
