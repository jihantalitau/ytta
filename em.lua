local Gui = game.Players.LocalPlayer.PlayerGui
for _,v in pairs(Gui:GetDescendants()) do
    if v:IsA("TextButton") or v:IsA("ImageButton") then
        print("BUTTON:", v:GetFullName())
    end
end
