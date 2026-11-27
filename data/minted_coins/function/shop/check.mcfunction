# as a shop villager, every second: gone from the registry, it goes away; its offers changed, it is rebuilt. Otherwise its
# trades are settled and compared with its stock: less stock than its trades allow (the owner took some out, or the container
# was broken), it is rebuilt at once; more stock (the owner added some), once nobody traded with it for 5 seconds.
# Rebuilding replaces the villager: a trading screen open on it closes, so that it can't keep using outdated trades.
scoreboard players remove @s[scores={minted_coins.shop_cd=1..}] minted_coins.shop_cd 1
function minted_coins:shop/load_self
execute unless data storage minted_coins:tmp shop run function minted_coins:shop/vanish
execute unless data storage minted_coins:tmp shop run return 0
execute store result score $ver minted_coins.data run data get storage minted_coins:tmp shop.ver
# (the old villager keeps its outdated version: the check stops there)
execute unless score @s minted_coins.shop_ver = $ver minted_coins.data run function minted_coins:shop/rebuild
execute unless score @s minted_coins.shop_ver = $ver minted_coins.data run return 0
function minted_coins:shop/settle
scoreboard players set $deficit minted_coins.data 0
scoreboard players set $surplus minted_coins.data 0
scoreboard players set $i minted_coins.data 0
data modify storage minted_coins:tmp oq set value []
data modify storage minted_coins:tmp oq set from storage minted_coins:tmp shop.offers
data modify storage minted_coins:tmp at set value {fn:"shop/check_next"}
data modify storage minted_coins:tmp at.dim set from storage minted_coins:tmp shop.dim
data modify storage minted_coins:tmp at.x set from storage minted_coins:tmp shop.x
data modify storage minted_coins:tmp at.y set from storage minted_coins:tmp shop.y
data modify storage minted_coins:tmp at.z set from storage minted_coins:tmp shop.z
function minted_coins:shop/at with storage minted_coins:tmp at
execute if score $deficit minted_coins.data matches 0 if score $surplus minted_coins.data matches 1 if score @s minted_coins.shop_cd matches 1.. run return 0
execute if score $deficit minted_coins.data matches 0 if score $surplus minted_coins.data matches 0 run return 0
function minted_coins:shop/rebuild
