# as a mint: other mods or data packs may add trades to wandering traders; a mint keeps only its own.
# Its own trades never run out (maxUses 2147483647), which tells them apart. The count is taken once per mint.
# its counter, just in front of it (0.7 block ahead, 0.5 up: 0.86 away; a counter further away is replaced)
execute at @s unless entity @e[type=minecraft:item_display,tag=minted_coins.counter,distance=..0.95] run function minted_coins:counter/place
# the purse comes first in the list (mints created before purses existed start selling it)
execute unless data entity @s Offers.Recipes[0].sell{id:"minecraft:bundle"} run function minted_coins:purse/upgrade
execute unless score @s minted_coins.trades matches 0.. store result score @s minted_coins.trades if data entity @s Offers.Recipes[{maxUses:2147483647}]
execute store result score $trades minted_coins.data if data entity @s Offers.Recipes[]
execute if score $trades minted_coins.data <= @s minted_coins.trades run return 0
data modify storage minted_coins:tmp offers set value []
data modify storage minted_coins:tmp offers append from entity @s Offers.Recipes[{maxUses:2147483647}]
data modify entity @s Offers.Recipes set from storage minted_coins:tmp offers
