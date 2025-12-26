print("✅ SCRIPT DI-EXECUTE")

local Player = game.Players.LocalPlayer
local Gui = Player:WaitForChild("PlayerGui")

print("⏳ MENUNGGU GUI...")

for _,v in pairs(Gui:GetChildren()) do
    print("📂 GUI:", v.Name)
end
