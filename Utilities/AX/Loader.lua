loadstring(game:HttpGet(("https://raw.githubusercontent.com/Miteduckingss/Mite-Hub/refs/heads/main/Utilities/AX/AutoKick.lua"), true))()
local Games = {
  [286090429] = "https://raw.githubusercontent.com/Miteduckingss/Mite-Hub/main/Games/Key/Arsenal.lua",
  [1537690962] = "https://raw.githubusercontent.com/Miteduckingss/Mite-Hub/main/Games/Key/BeeSwarmSimulator.lua"
}
if Games[game.PlaceId] then 
  loadstring(game:HttpGet(Games[game.PlaceId]))()
 else
 print("oh no")
end
