# as a player who clicked an interaction entity (advancement minted_coins:shop_click): if it is the click box of a shop,
# that shop becomes their selected one (minted_coins.shop_sel) and its menu opens
advancement revoke @s only minted_coins:shop_click
scoreboard players set $clicked minted_coins.data 0
data modify storage minted_coins:tmp clicker set from entity @s UUID
tag @s add minted_coins.clicker
execute as @e[type=minecraft:interaction,tag=minted_coins.shop_click,distance=..8] if data entity @s interaction run function minted_coins:shop/clicked
tag @s remove minted_coins.clicker
execute if score $clicked minted_coins.data matches 1 run function minted_coins:shop/menu
