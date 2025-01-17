-- Load the AutoKick module
loadstring(game:HttpGet("https://raw.githubusercontent.com/Miteduckingss/Mite-Hub/refs/heads/main/Utilities/AX/AutoKick.lua", true))()

-- Define the game-specific scripts
local Games = {
    [1537690962] = "https://raw.githubusercontent.com/Chris8889/atlasbss/main/script.lua"
}

-- Check if the current game's PlaceId matches one in the table
if Games[game.PlaceId] then
    if game.PlaceId == 16732694052 then
        -- Special case for game.PlaceId 16732694052 with custom loader
        script_key = "slEVRfpmUsesyIQJAtxHAayspAVZIWCS"
        (loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/Native-lab/Native/main/loader.lua"))()
    else
        -- Default behavior for other games
        loadstring(game:HttpGet(Games[game.PlaceId], true))()
    end
else
    print("Oh no! No script found for this game.")
end
