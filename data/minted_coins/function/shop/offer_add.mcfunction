# $act = 1 (sell) or 2 (buy): a new offer from the hands of the player: the goods in the main hand (their count: the quantity),
# the price in the off hand (coins of a bank; their count: the price)
scoreboard players set $changed minted_coins.data 0
function minted_coins:shop/hands
execute unless data storage minted_coins:tmp hands.main run return run tellraw @s {translate:"chat.minted_coins.shop.no_goods",fallback:"Hold the goods in your main hand.",color:"red"}
execute unless data storage minted_coins:tmp hands.off.components."minecraft:custom_data".minted_coins.mint run return run tellraw @s {translate:"chat.minted_coins.shop.no_price",fallback:"Hold the price, in coins, in your off hand.",color:"red"}
execute if data storage minted_coins:tmp hands.main.components."minecraft:custom_data".minted_coins.key run return run tellraw @s {translate:"chat.minted_coins.shop.key_goods",fallback:"A shop key can't be sold.",color:"red"}
execute if data storage minted_coins:tmp shop.offers[11] run return run tellraw @s {translate:"chat.minted_coins.shop.full",fallback:"A shop has 12 offers at most: remove one first.",color:"red"}
data modify storage minted_coins:tmp o set value {mode:"sell",done:0}
execute if score $act minted_coins.data matches 2 run data modify storage minted_coins:tmp o.mode set value "buy"
data modify storage minted_coins:tmp o.goods set from storage minted_coins:tmp hands.main
data modify storage minted_coins:tmp o.qty set from storage minted_coins:tmp hands.main.count
data remove storage minted_coins:tmp o.goods.count
data modify storage minted_coins:tmp o.price set from storage minted_coins:tmp hands.off
data modify storage minted_coins:tmp o.pcount set from storage minted_coins:tmp hands.off.count
data remove storage minted_coins:tmp o.price.count
data modify storage minted_coins:tmp shop.offers append from storage minted_coins:tmp o
scoreboard players set $changed minted_coins.data 1
tellraw @s {translate:"chat.minted_coins.shop.offer_added",fallback:"✔ Offer added.",color:"green"}
