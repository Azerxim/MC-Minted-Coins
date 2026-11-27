# as a shop villager, with its registry entry in minted_coins:tmp shop: its name and trades from its offers and its stock.
# Each offer can be used as many times as the stock allows (goods for a sale, coins for a purchase); the counts of trades
# already settled restart at 0, and the entry is saved.
execute store result score @s minted_coins.shop_ver run data get storage minted_coins:tmp shop.ver
data modify entity @s CustomName set from storage minted_coins:tmp shop.name
data modify storage minted_coins:tmp recipes set value []
data modify storage minted_coins:tmp oq set value []
data modify storage minted_coins:tmp oq set from storage minted_coins:tmp shop.offers
data modify storage minted_coins:tmp shop.offers set value []
data modify storage minted_coins:tmp at set value {fn:"shop/build_next"}
data modify storage minted_coins:tmp at.dim set from storage minted_coins:tmp shop.dim
data modify storage minted_coins:tmp at.x set from storage minted_coins:tmp shop.x
data modify storage minted_coins:tmp at.y set from storage minted_coins:tmp shop.y
data modify storage minted_coins:tmp at.z set from storage minted_coins:tmp shop.z
function minted_coins:shop/at with storage minted_coins:tmp at
data modify entity @s Offers set value {Recipes:[]}
data modify entity @s Offers.Recipes set from storage minted_coins:tmp recipes
function minted_coins:shop/save with storage minted_coins:tmp shop
