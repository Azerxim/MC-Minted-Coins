# as the new villager of the shop minted_coins:tmp shop, at the place and rotation of the old one (tagged minted_coins.old)
function minted_coins:shop/villager
tp @s ~ ~ ~ ~ ~
scoreboard players operation @s minted_coins.id = @e[type=minecraft:villager,tag=minted_coins.old,limit=1] minted_coins.id
function minted_coins:shop/build
