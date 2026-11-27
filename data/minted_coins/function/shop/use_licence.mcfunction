# as and at a player who just used up a shop licence (advancement minted_coins:shop_licence; its bank in minted_coins.licence):
# the chest or barrel they look at, within 5 blocks, becomes the stock of a new shop. Otherwise the licence is handed back.
advancement revoke @s only minted_coins:shop_licence
scoreboard players set $placed minted_coins.data 0
scoreboard players set $steps minted_coins.data 20
scoreboard players set $hit minted_coins.data 0
execute anchored eyes positioned ^ ^ ^ run function minted_coins:shop/ray
execute if score $hit minted_coins.data matches 0 run tellraw @s {translate:"chat.minted_coins.shop.no_container",fallback:"Look at a chest or barrel while using the licence.",color:"red"}
execute if score $placed minted_coins.data matches 0 run function minted_coins:shop/refund
