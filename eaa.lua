-- Periksa Leaderstats untuk variabel coin/RP
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- Nama variabel coin/RP. Ganti dengan nama yang benar dalam game kamu.
local coinName = "Coins"
local rpName = "RP"

-- Fungsi untuk menambah coin
local function addCoins(amount)
    local leaderstats = localPlayer:FindFirstChild("leaderstats")
    if leaderstats then
        local coins = leaderstats:FindFirstChild(coinName)
        if coins then
            coins.Value = coins.Value + amount
            print("Menambah " .. amount .. " " .. coinName .. " ke " .. localPlayer.Name)
        else
            print("Tidak dapat menemukan " .. coinName .. " dalam Leaderstats.")
        end
    else
        print("Tidak dapat menemukan Leaderstats.")
    end
end

-- Fungsi untuk menambah RP
local function addRP(amount)
    local leaderstats = localPlayer:FindFirstChild("leaderstats")
    if leaderstats then
        local rp = leaderstats:FindFirstChild(rpName)
        if rp then
            rp.Value = rp.Value + amount
            print("Menambah " .. amount .. " " .. rpName .. " ke " .. localPlayer.Name)
        else
            print("Tidak dapat menemukan " .. rpName .. " dalam Leaderstats.")
        end
    else
        print("Tidak dapat menemukan Leaderstats.")
    end
end

-- Jalankan fungsi ketika script diexecute
addCoins(1000000000) -- Menambah 100 coin
addRP(500000000)      -- Menambah 50 RP
