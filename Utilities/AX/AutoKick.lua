-- Place this in a LocalScript

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Whitelisted UserIds (add the UserIds you want to exclude)
local whitelistedUserIds = {
    [3638973619] = true, -- MavisSiAnakBaik
    [7223105370] = true, -- Miteducklings
    [3223904973] = true, -- ApplesXDuckx
    [2414705274] = true  -- 21kboiii
}

-- Track time the player joined
local startTime = tick()

-- Function to kick when a non-whitelisted friend joins
local function onPlayerAdded(otherPlayer)
    if player:IsFriendsWith(otherPlayer.UserId) and not whitelistedUserIds[otherPlayer.UserId] then
        
        -- Time spent
        local timeSpent = tick() - startTime
        local formattedTime = string.format("%.2f seconds", timeSpent)

        -- Username (@DisplayName)
        local friendName = otherPlayer.Name
        local friendDisplay = otherPlayer.DisplayName
        local finalName = friendName .. "(@" .. friendDisplay .. ")"

        -- Kick
        player:Kick("OH NO YOUR FRIEND " .. finalName .. " JOIN!! Also you stayed for " .. formattedTime .. ".")
    end
end

-- Listen for players joining
Players.PlayerAdded:Connect(onPlayerAdded)

-- Check already existing players
for _, otherPlayer in pairs(Players:GetPlayers()) do
    onPlayerAdded(otherPlayer)
end
