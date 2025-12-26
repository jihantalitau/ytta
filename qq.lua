local function createLag()
    while true do
        local part = Instance.new("Part")
        part.Size = Vector3.new(1, 1, 1)
        part.Position = Vector3.new(math.random(-1000, 1000), 100, math.random(-1000, 1000))
        part.Anchored = true
        part.Parent = workspace
        wait(0.01) -- Interval untuk make lag
    end
end

createLag()
