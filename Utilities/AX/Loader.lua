loadstring(game:HttpGet(("https://raw.githubusercontent.com/Miteduckingss/Mite-Hub/refs/heads/main/Utilities/AX/AutoKick.lua"), true))()
local Games = {
  [1537690962] = "https://raw.githubusercontent.com/Miteduckingss/Mite-Hub/refs/heads/main/Utilities/AX/Games/Lebah",
  [16732694052] = "https://raw.githubusercontent.com/Miteduckingss/Mite-Hub/refs/heads/main/Utilities/AX/Games/Ikan"
}
if Games[game.PlaceId] then 
  loadstring(game:HttpGet(Games[game.PlaceId]))()
 else
 print("oh no")
end
