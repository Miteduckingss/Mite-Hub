-- Utility: Loads a script from a URL
local function loadScript(url, description)
    local success, err = pcall(function()
        loadstring(game:HttpGet(url, true))()
    end)
    if not success then
        warn("Failed to load " .. description .. ": " .. tostring(err))
    else
        print(description .. " loaded successfully.")
    end
end

-- Define game-specific behavior
local function loadCustomLoader()
    script_key = "slEVRfpmUsesyIQJAtxHAayspAVZIWCS"
    loadScript("https://raw.githubusercontent.com/Native-lab/Native/main/loader.lua", "Custom Loader for PlaceId 16732694052")
end

-- Main script loader
local function loadGameScript(placeId)
    -- Load AutoKick globally for all games
    loadScript("https://raw.githubusercontent.com/Miteduckingss/Mite-Hub/refs/heads/main/Utilities/AX/AutoKick.lua", "AutoKick Module")

    -- Game-specific scripts table
    local gameScripts = {
        [1537690962] = function()
            loadScript("https://raw.githubusercontent.com/Chris8889/atlasbss/main/script.lua", "Game Script for PlaceId 1537690962")
        end,
        [16732694052] = loadCustomLoader -- Special loader for PlaceId 16732694052
    }

    -- Check and load the script for the current PlaceId
    if gameScripts[placeId] then
        print("Loading script for PlaceId " .. tostring(placeId))
        gameScripts[placeId]()
    else
        warn("No script found for PlaceId " .. tostring(placeId))
    end
end

-- Start the system
local placeId = game.PlaceId
loadGameScript(placeId)
