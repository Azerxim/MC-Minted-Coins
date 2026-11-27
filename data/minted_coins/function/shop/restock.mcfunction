# {i}, as a shop villager: trade i can be used $stock times in all (its uses so far plus what the stock allows)
$execute store result entity @s Offers.Recipes[$(i)].maxUses int 1 run scoreboard players get $stock minted_coins.data
