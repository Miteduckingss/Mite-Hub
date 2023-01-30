local Games = {
  [189707] = "https://raw.githubusercontent.com/Miteduckings/Mite-Hub/main/Games/Keyless/NaturalDisasterSurvival.lua",
  [3696971654] = "https://raw.githubusercontent.com/Miteduckings/Mite-Hub/main/Games/Keyless/NaturalDisasterSurvival.lua"
}
if Games[game.PlaceId] then 
  loadstring(game:HttpGet(Games[game.PlaceId]))()
 else
 game.Players.LocalPlayer:Kick("Games Not Supported")
end
