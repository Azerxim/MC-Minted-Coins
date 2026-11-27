# the shop takes the name of the item in the player's main hand (renamed in an anvil)
scoreboard players set $changed minted_coins.data 0
function minted_coins:shop/hands
execute unless data storage minted_coins:tmp hands.main.components."minecraft:custom_name" run return run tellraw @s {translate:"chat.minted_coins.shop.no_name",fallback:"Hold an item renamed in an anvil, a name tag for instance.",color:"red"}
data modify storage minted_coins:tmp shop.name set from storage minted_coins:tmp hands.main.components."minecraft:custom_name"
scoreboard players set $changed minted_coins.data 1
