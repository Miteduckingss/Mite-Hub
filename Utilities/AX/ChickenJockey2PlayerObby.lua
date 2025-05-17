-- Co-ordinates for the location to check for "MavisSiAnakBaik"
local targetX1 = -32.80
local targetY1 = 110.00
local targetZ1 = -185.75
local targetX2 = -22.80
local targetY2 = 110.00
local targetZ2 = -154.25
local targetX3 = -12.80
local targetY3 = 110.00
local targetZ3 = -185.75
local targetX4 = -2.80
local targetY4 = 110.00
local targetZ4 = -154.25

-- Co-ordinates for the first teleport location
local teleportX1 = -22.78
local teleportY1 = 110.00
local teleportZ1 = -185.75

-- Co-ordinates for the second teleport location
local teleportX2 = -32.82
local teleportY2 = 110.00
local teleportZ2 = -154.25

-- Co-ordinates for the third teleport location
local teleportX3 = -2.78
local teleportY3 = 110.00
local teleportZ3 = -185.75

-- Co-ordinates for the fourth teleport location
local teleportX4 = -12.82
local teleportY4 = 110.00
local teleportZ4 = -154.25

-- Co-ordinates for the four subsequent teleport locations
local teleportLocations = {
    {X = 453.45, Y = 201.22, Z = 474.14},
    {X = 812.97, Y = 274.79, Z = -369.55},
    {X = 1768.05, Y = 503.94, Z = 33.64},
    {X = 2517.44, Y = 578.12, Z = 325.57}
}

-- The username of the player to detect
local targetUsername = "MavisSiAnakBaik"

-- Function to check the distance between two 3D points
local function getDistance(pos1, pos2)
    return (pos1 - pos2).Magnitude
end

-- Function to teleport the local player to a specific location
local function teleportPlayer(x, y, z)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local newPosition = Vector3.new(x, y, z)
        player.Character.HumanoidRootPart.CFrame = CFrame.new(newPosition)
        print("Teleported player to: " .. x .. ", " .. y .. ", " .. z)
    else
        print("Couldn't teleport player.  Make sure the player's character has loaded.")
    end
end

-- Function to find a player by name
local function findPlayerByName(playerName)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Name == playerName then
            return player
        end
    end
    return nil
end

-- Main loop to continuously check for the player's position
while true do
    local targetPlayer = findPlayerByName(targetUsername) -- Find the player.
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local playerPosition = targetPlayer.Character.HumanoidRootPart.Position
        local distance1 = getDistance(playerPosition, Vector3.new(targetX1, targetY1, targetZ1))
        local distance2 = getDistance(playerPosition, Vector3.new(targetX2, targetY2, targetZ2))
        local distance3 = getDistance(playerPosition, Vector3.new(targetX3, targetY3, targetZ3))
        local distance4 = getDistance(playerPosition, Vector3.new(targetX4, targetY4, targetZ4))

        -- Check if the player is within a reasonable range (e.g., 5 studs) of either location
        if distance1 < 5 then
            print(targetUsername .. " is at the first target location! Teleporting...")
            teleportPlayer(teleportX1, teleportY1, teleportZ1) -- Teleport to the first location
            wait(6)

            -- Teleport to the four subsequent locations with delays
            for i, location in ipairs(teleportLocations) do
                teleportPlayer(location.X, location.Y, location.Z)
                wait(2)
            end
            -- No break here, so it will loop.
        elseif distance2 < 5 then
            print(targetUsername .. " is at the second target location! Teleporting...")
            teleportPlayer(teleportX2, teleportY2, teleportZ2) -- Teleport to the second location
            wait(6)

            -- Teleport to the four subsequent locations with delays
            for i, location in ipairs(teleportLocations) do
                teleportPlayer(location.X, location.Y, location.Z)
                wait(2)
            end
        elseif distance3 < 5 then
            print(targetUsername .. " is at the third target location! Teleporting...")
            teleportPlayer(teleportX3, teleportY3, teleportZ3) -- Teleport to the third location
            wait(6)

            -- Teleport to the four subsequent locations with delays
            for i, location in ipairs(teleportLocations) do
                teleportPlayer(location.X, location.Y, location.Z)
                wait(2)
            end
        elseif distance4 < 5 then
            print(targetUsername .. " is at the fourth target location! Teleporting...")
            teleportPlayer(teleportX4, teleportY4, teleportZ4) -- Teleport to the fourth location
            wait(6)

            -- Teleport to the four subsequent locations with delays
            for i, location in ipairs(teleportLocations) do
                teleportPlayer(location.X, location.Y, location.Z)
                wait(2)
            end
        else
            print(targetUsername .. " is not at any target location. Distance1: " .. distance1 .. ", Distance2: " .. distance2 .. ", Distance3: " .. distance3 .. ", Distance4: " .. distance4)
        end
    else
        print(targetUsername .. " not found or character not loaded yet.")
    end
    wait(1)
end
