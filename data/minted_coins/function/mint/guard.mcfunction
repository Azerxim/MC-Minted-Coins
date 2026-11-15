# as a mint: other mods or data packs may add trades to wandering traders; a mint keeps only its own.
# Its own trades never run out (maxUses 2147483647), which tells them apart. The count is taken once per mint.
execute unless score @s minted_coins.trades matches 0.. store result score @s minted_coins.trades if data entity @s Offers.Recipes[{maxUses:2147483647}]
execute store result score $trades minted_coins.data if data entity @s Offers.Recipes[]
execute if score $trades minted_coins.data <= @s minted_coins.trades run return 0
data modify storage minted_coins:tmp offers set value []
data modify storage minted_coins:tmp offers append from entity @s Offers.Recipes[{maxUses:2147483647}]
data modify entity @s Offers.Recipes set from storage minted_coins:tmp offers
