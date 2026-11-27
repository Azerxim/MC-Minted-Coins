# minted_coins:shop/use_licence: steps of 0.25 block along the player's look, up to 5 blocks
execute if block ~ ~ ~ #minted_coins:shop_container run scoreboard players set $hit minted_coins.data 1
execute if score $hit minted_coins.data matches 1 align xyz run function minted_coins:shop/place
execute if score $hit minted_coins.data matches 1 run return 0
execute unless block ~ ~ ~ #minecraft:air run return 0
scoreboard players remove $steps minted_coins.data 1
execute if score $steps minted_coins.data matches 1.. positioned ^ ^ ^0.25 run function minted_coins:shop/ray
