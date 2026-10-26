# as and at the mint being removed
scoreboard players set $found minted_coins.data 1
scoreboard players reset @s minted_coins.id
particle minecraft:poof ~ ~1 ~ 0.3 0.5 0.3 0.02 20
tp @s ~ -1000 ~
kill @s
