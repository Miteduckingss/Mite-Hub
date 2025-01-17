-- Load the AutoKick module
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Miteduckingss/Mite-Hub/refs/heads/main/Utilities/AX/AutoKick.lua", true))()
end)

if not success then
    warn("Failed to load AutoKick module: " .. tostring(err))
end

-- Define the game-specific scripts
local Games = {
    [1537690962] = "https://raw.githubusercontent.com/Chris8889/atlasbss/main/script.lua",
    [16732694052] = "custom_loader" -- Special case for custom loader
}

-- Check if the current game's PlaceId matches one in the table
local placeId = game.PlaceId

if Games[placeId] then
    if placeId == 16732694052 then
        -- Special case for game.PlaceId 16732694052
        script_key = "slEVRfpmUsesyIQJAtxHAayspAVZIWCS"
        local success, err = pcall(function()
            (loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/Native-lab/Native/main/loader.lua", true))()
        end)
        if not success then
            warn("Failed to load custom loader: " .. tostring(err))
        end
    else
        -- Default behavior for other games
        local success, err = pcall(function()
            loadstring(game:HttpGet(Games[placeId], true))()
        end)
        if not success then
            warn("Failed to load game script for PlaceId " .. tostring(placeId) .. ": " .. tostring(err))
        end
    end
else
    print("Oh no! No script found for this game.")
end
