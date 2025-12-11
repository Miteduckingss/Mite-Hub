-- Place this in a LocalScript

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Whitelisted UserIds (add the UserIds you want to exclude)
local whitelistedUserIds = {
    [3638973619] = true, -- MavisSiAnakBaik
    [7223105370] = true, -- Miteducklings
    [3223904973] = true, -- ApplesXDuckx
    [1543447609] = true, -- ApplesXDucks
    [2414705274] = true  -- 21kboiii
}

-- Track time player joined
local startTime = tick()

-- Function to kick when a non-whitelisted friend joins
local function onPlayerAdded(otherPlayer)
    -- If the person who joined is a FRIEND and NOT whitelisted
    if player:IsFriendsWith(otherPlayer.UserId) and not whitelistedUserIds[otherPlayer.UserId] then
        
        -- Time spent in server
        local timeSpent = tick() - startTime
        local formattedTime = string.format("%.2f seconds", timeSpent)

        -- Add friend's username
        local friendName = otherPlayer.Name

        -- Kick message
        player:Kick("OH NO YOUR FRIEND " .. friendName .. " JOIN!! Also you stayed for " .. formattedTime .. ".")
    end
end

-- Detect new players
Players.PlayerAdded:Connect(onPlayerAdded)

-- Check existing players already in server
for _, otherPlayer in pairs(Players:GetPlayers()) do
    onPlayerAdded(otherPlayer)
end
