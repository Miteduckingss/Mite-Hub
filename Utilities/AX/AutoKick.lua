-- Place this in a LocalScript

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Whitelisted UserIds (add the UserIds you want to exclude)
local whitelistedUserIds = {
    [3638973619] = true, -- MavisSiAnakBaik
    [7223105370] = true, -- Miteducklings
    [3223904973] = true, -- ApplesXDuckx
    [1543447609] = true, -- ApplesXDucks
    [2414705274] = true -- 21kboiii
}

-- Track the time the player joined the game
local startTime = tick()

-- Function to kick the player if a non-whitelisted friend joins
local function onPlayerAdded(otherPlayer)
    -- Check if the other player is a friend and not whitelisted
    if player:IsFriendsWith(otherPlayer.UserId) and not whitelistedUserIds[otherPlayer.UserId] then
        
        -- Calculate the time stayed in the server
        local timeSpent = tick() - startTime
        local formattedTime = string.format("%.2f seconds", timeSpent)

        local friendName = otherPlayer.Name -- 🎉 Added: grab the friend's username

        -- Kick the player with a message showing time stayed + friend name
        player:Kick(
            "OH NO YOUR FRIEND "" .. friendName .. "" JOIN!! Also you stayed for " 
            .. formattedTime .. "."
        )
    end
end

-- Listen for new players joining the game
Players.PlayerAdded:Connect(onPlayerAdded)

-- Initial check in case friends are already in the game
for _, otherPlayer in pairs(Players:GetPlayers()) do
    onPlayerAdded(otherPlayer)
end
