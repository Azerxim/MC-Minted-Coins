# as a shop villager whose shop is gone from the registry: it goes away with its sign and click box
scoreboard players operation $target minted_coins.data = @s minted_coins.id
execute as @e[tag=minted_coins.shop_part] if score @s minted_coins.id = $target minted_coins.data run kill @s
execute at @s run particle minecraft:poof ~ ~1 ~ 0.3 0.5 0.3 0.02 20
execute at @s run tp @s ~ -1000 ~
kill @s
