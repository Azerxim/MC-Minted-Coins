# at the stock container, for the offer minted_coins:tmp o: $stock = how many times it can be used
# (a sale: goods in stock / qty; a purchase: coins in stock / pcount)
execute if data storage minted_coins:tmp o{mode:"sell"} run data modify storage minted_coins:tmp tpl set from storage minted_coins:tmp o.goods
execute if data storage minted_coins:tmp o{mode:"buy"} run data modify storage minted_coins:tmp tpl set from storage minted_coins:tmp o.price
function minted_coins:shop/count
execute if data storage minted_coins:tmp o{mode:"sell"} store result score $unit minted_coins.data run data get storage minted_coins:tmp o.qty
execute if data storage minted_coins:tmp o{mode:"buy"} store result score $unit minted_coins.data run data get storage minted_coins:tmp o.pcount
scoreboard players operation $stock minted_coins.data = $cnt minted_coins.data
execute if score $unit minted_coins.data matches 1.. run scoreboard players operation $stock minted_coins.data /= $unit minted_coins.data
