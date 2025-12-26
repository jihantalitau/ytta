local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function respawnPlayer(player)
    local character = player.Character
    if character then
        character:Destroy()
    end
    player:LoadCharacter()
end

while true do
    for _, player in ipairs(Players:GetPlayers()) do
        respawnPlayer(player)
    end
    wait(1) -- Respawn interval setiap 5 detik, bikin sesuai kebutuhan
end
