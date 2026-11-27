# at the stock container: the trade of the first offer of minted_coins:tmp oq, then the next ones
execute unless data storage minted_coins:tmp oq[0] run return 0
data modify storage minted_coins:tmp o set from storage minted_coins:tmp oq[0]
data modify storage minted_coins:tmp o.done set value 0
function minted_coins:shop/stock
data modify storage minted_coins:tmp recipe set value {buy:{id:"minecraft:stone",count:1},sell:{id:"minecraft:stone",count:1},maxUses:0,uses:0,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0}
execute store result storage minted_coins:tmp recipe.maxUses int 1 run scoreboard players get $stock minted_coins.data
# the coins as asked for: without the "Struck by" line, which a bank renamed since then would have changed
data modify storage minted_coins:tmp cost set from storage minted_coins:tmp o.price
data remove storage minted_coins:tmp cost.components."minecraft:lore"
execute if data storage minted_coins:tmp o{mode:"sell"} run function minted_coins:shop/recipe_sell
execute if data storage minted_coins:tmp o{mode:"buy"} run function minted_coins:shop/recipe_buy
data modify storage minted_coins:tmp recipes append from storage minted_coins:tmp recipe
data modify storage minted_coins:tmp shop.offers append from storage minted_coins:tmp o
data remove storage minted_coins:tmp oq[0]
function minted_coins:shop/build_next
