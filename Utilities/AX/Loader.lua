-- Utility: Loads a script from a URL (safe wrapper)
local function loadScript(url, description)
    local success, err = pcall(function()
        loadstring(game:HttpGet(url, true))()
    end)
    if not success then
        warn("❌ Failed to load " .. description .. " (" .. tostring(url) .. "): " .. tostring(err))
    else
        print("✅ " .. description .. " loaded successfully.")
    end
end

-- Special-case loader that runs your exact loadstring (unchanged)
local function loadChris12089()
    local success, err = pcall(function()
        -- <--- This line kept exactly as you wanted
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Chris12089/atlasbss/main/script.lua"))()
    end)
    if not success then
        warn("❌ Failed to load Chris12089 script: " .. tostring(err))
    else
        print("✅ Chris12089 script loaded successfully.")
    end
end

-- Loader for PlaceId 16732694052
local function loadCustomLoader()
    script_key = "slEVRfpmUsesyIQJAtxHAayspAVZIWCS"
    loadScript("https://raw.githubusercontent.com/Native-lab/Native/main/loader.lua", "Custom Loader for PlaceId 16732694052")
end

-- Dual loader for PlaceId 13822562292
local function loadDualScripts()
    loadScript("https://raw.githubusercontent.com/cryprol/MidnightChasers/main/Library", "MidnightChasers Library")
    loadScript("https://raw.githubusercontent.com/cryprol/AntiAFK/main/AntiAFK", "AntiAFK Script")
end

-- Forsaken loader for PlaceId 18687417158
local function loadForsaken()
    if getgenv then
        getgenv().BloxtrapRPC = "true"
        getgenv().DebugNotifications = "false"
        getgenv().TrackMePlease = "true"
    end
    loadScript("https://raw.githubusercontent.com/ivannetta/ShitScripts/main/forsaken.lua", "Forsaken Script")
    pcall(setclipboard, "https://linkunlocker.com/fartsaken-key-luarmor-linkvertise-SNGKc")
    print("📋 Clipboard link set for Forsaken script (attempted).")
end

-- Chicken Jockey for PlaceId 71412777087552
local function loadChickenJockey()
    loadScript("https://raw.githubusercontent.com/Miteduckingss/Mite-Hub/main/Utilities/AX/ChickenJockey2PlayerObby.lua", "Chicken Jockey 2 Player Obby")
end

-- BeNpcOrDie + AntiAFK for PlaceId 11276071411
local function loadBeNpcOrDie()
    local ok, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/BeNpcOrDie"))('More scripts: t.me/arceusxscripts')
    end)
    if not ok then
        warn("❌ Failed to load BeNpcOrDie: " .. tostring(err))
    else
        print("✅ BeNpcOrDie loaded successfully.")
    end
    loadScript("https://raw.githubusercontent.com/cryprol/AntiAFK/main/AntiAFK", "AntiAFK Script")
end

-- Main game-specific loader
local function loadGameScripts(placeId)
    local gameScripts = {
        [1537690962]       = loadChris12089, -- <-- uses your exact loadstring call
        [16732694052]      = loadCustomLoader,
        [13822562292]      = loadDualScripts,
        [18687417158]      = loadForsaken,
        [71412777087552]   = loadChickenJockey,
        [11276071411]      = loadBeNpcOrDie
    }

    if gameScripts[placeId] then
        print("🎮 Detected PlaceId: " .. tostring(placeId))
        gameScripts[placeId]()
    else
        warn("⚠️ No script found for PlaceId " .. tostring(placeId))
    end
end

-- Main loader: AutoKick first, then game script
local function mainLoader()
    print("🔁 Loading AutoKick module...")
    loadScript("https://raw.githubusercontent.com/Miteduckingss/Mite-Hub/main/Utilities/AX/AutoKick.lua", "AutoKick Module")

    loadGameScripts(game.PlaceId)
end

-- Run now
mainLoader()
