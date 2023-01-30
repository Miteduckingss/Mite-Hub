local Games = {
  [286090429] = "https://raw.githubusercontent.com/Miteduckingss/Mite-Hub/main/Games/Key/Arsenal.lua",
  [7239319209] = "https://raw.githubusercontent.com/Miteduckingss/Mite-Hub/main/Games/Key/Ohio.lua",
  [1537690962] = "https://raw.githubusercontent.com/Miteduckingss/Mite-Hub/main/Games/Key/BeeSwarmSimulator.lua"
}
if Games[game.PlaceId] then 
  loadstring(game:HttpGet(Games[game.PlaceId]))()
 else
 game.Players.LocalPlayer:Kick("Games Not Supported")
end
