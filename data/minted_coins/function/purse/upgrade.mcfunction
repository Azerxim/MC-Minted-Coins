# as a mint whose first trade is not its purse: removes its purse trade, wherever it is (or the one of an earlier
# development version), adds it back at the top, then lets minted_coins:mint/guard count its own trades again
data remove entity @s Offers.Recipes[{sell:{id:"minecraft:carrot_on_a_stick"}}]
data remove entity @s Offers.Recipes[{sell:{id:"minecraft:bundle"}}]
function minted_coins:purse/trade
scoreboard players reset @s minted_coins.trades
