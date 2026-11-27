# as the player, after a change of minted_coins:tmp shop (offers or name): settles the trades made so far, saves the shop
# as a new version and rebuilds its villager (or it rebuilds itself when it is next loaded)
scoreboard players operation $sel minted_coins.data = @s minted_coins.shop_sel
data modify storage minted_coins:tmp pending set from storage minted_coins:tmp shop
execute as @e[type=minecraft:villager,tag=minted_coins.shop] if score @s minted_coins.id = $sel minted_coins.data run function minted_coins:shop/settle
# the settlement may have updated the done counts of the offers that stay: start again from the saved entry
function minted_coins:shop/select
data modify storage minted_coins:tmp shop.offers set from storage minted_coins:tmp pending.offers
data modify storage minted_coins:tmp shop.name set from storage minted_coins:tmp pending.name
execute store result score $ver minted_coins.data run data get storage minted_coins:tmp shop.ver
scoreboard players add $ver minted_coins.data 1
execute store result storage minted_coins:tmp shop.ver int 1 run scoreboard players get $ver minted_coins.data
function minted_coins:shop/save with storage minted_coins:tmp shop
execute as @e[type=minecraft:villager,tag=minted_coins.shop] if score @s minted_coins.id = $sel minted_coins.data run function minted_coins:shop/rebuild
