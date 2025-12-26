-- AUTO FISHING (SAMPLE)
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Player = game.Players.LocalPlayer
local Gui = Player.PlayerGui

local FishingGui = Gui:WaitForChild("FishingGui", 10)
if not FishingGui then
    warn("FishingGui tidak ditemukan")
    return
end

local FishIcon = FishingGui:WaitForChild("FishIcon")
local Bar = FishingGui:WaitForChild("PowerBar")
local Fill = Bar:WaitForChild("Fill")

local holding = false

local function cast()
    UIS:SendMouseButtonEvent(0,0,0,true,game,0)
    task.wait(0.15)
    UIS:SendMouseButtonEvent(0,0,0,false,game,0)
end

local function clickFish()
    if FishIcon.Visible then
        UIS:SendMouseButtonEvent(0,0,0,true,game,0)
        UIS:SendMouseButtonEvent(0,0,0,false,game,0)
    end
end

RunService.RenderStepped:Connect(function()
    local p = Fill.Size.X.Scale
    if p >= 0.4 and p <= 0.7 then
        if not holding then
            holding = true
            UIS:SendMouseButtonEvent(0,0,0,true,game,0)
        end
    else
        if holding then
            holding = false
            UIS:SendMouseButtonEvent(0,0,0,false,game,0)
        end
    end
end)

task.spawn(function()
    while true do
        cast()
        task.wait(1)
        clickFish()
        task.wait(0.25)
    end
end)
