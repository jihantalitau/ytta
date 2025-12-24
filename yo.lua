-- AUDIO CHAOS ENGINE (CLIENT / EXECUTOR)
-- Mobile friendly, local-only

local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")

local ENABLE = true        -- set false untuk stop
local INTERVAL = 0.10      -- makin kecil makin rusuh
local SOUND_IDS = {        -- boleh ganti / tambah
	"rbxassetid://9683969863", -- glitch
	"rbxassetid://9683969863",  -- buzz
	"rbxassetid://9683969863"  -- click
}

-- efek audio lokal
local reverb = Instance.new("ReverbSoundEffect")
reverb.DecayTime = 1.5
reverb.Density = 0.8
reverb.WetLevel = 0.6
reverb.Parent = SoundService

local function playChaos()
	if not ENABLE then return end
	local s = Instance.new("Sound")
	s.SoundId = SOUND_IDS[math.random(#SOUND_IDS)]
	s.Volume = math.random(4,10)/10
	s.PlaybackSpeed = math.random(60,180)/100 -- pitch acak
	s.Parent = SoundService
	s:Play()
	game.Debris:AddItem(s, 2)
end

task.spawn(function()
	while ENABLE do
		playChaos()
		task.wait(INTERVAL)
	end
end)

print("🔊 Audio Chaos Engine ON")
