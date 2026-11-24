# removes the counter of mint $target, if it is loaded
execute as @e[type=minecraft:item_display,tag=minted_coins.counter] if score @s minted_coins.id = $target minted_coins.data run kill @s
