# as a shop villager, after a trade (or before a check or a rebuild): for each offer, the trades made since the last settlement
# (its uses minus its done count) move the goods and coins in the stock container. Only for the trades built from the current
# offers (shop.ver): after a change of the offers, the villager is rebuilt instead.
function minted_coins:shop/load_self
execute unless data storage minted_coins:tmp shop run return 0
execute store result score $ver minted_coins.data run data get storage minted_coins:tmp shop.ver
execute unless score @s minted_coins.shop_ver = $ver minted_coins.data run return 0
scoreboard players set $i minted_coins.data 0
scoreboard players set $moved minted_coins.data 0
data modify storage minted_coins:tmp oq set value []
data modify storage minted_coins:tmp oq set from storage minted_coins:tmp shop.offers
data modify storage minted_coins:tmp shop.offers set value []
data modify storage minted_coins:tmp at set value {fn:"shop/settle_next"}
data modify storage minted_coins:tmp at.dim set from storage minted_coins:tmp shop.dim
data modify storage minted_coins:tmp at.x set from storage minted_coins:tmp shop.x
data modify storage minted_coins:tmp at.y set from storage minted_coins:tmp shop.y
data modify storage minted_coins:tmp at.z set from storage minted_coins:tmp shop.z
function minted_coins:shop/at with storage minted_coins:tmp at
function minted_coins:shop/save with storage minted_coins:tmp shop
