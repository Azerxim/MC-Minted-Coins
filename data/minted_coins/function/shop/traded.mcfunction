# as a player who just traded with a villager (advancement minted_coins:shop_trade): the shops around settle their trades
advancement revoke @s only minted_coins:shop_trade
execute as @e[type=minecraft:villager,tag=minted_coins.shop,distance=..12] run function minted_coins:shop/settle
