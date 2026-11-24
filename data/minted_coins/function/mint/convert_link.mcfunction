# {low, high}, as a mint: 64 coins of the lower metal -> 1 coin of the higher one, and back
# (coins from minted_coins:tmp coins: sell = as struck by this mint, buy = the same without the lore)
data modify storage minted_coins:tmp trade set value {buy:{id:"minecraft:stone",count:1},sell:{id:"minecraft:stone",count:1},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0}
$data modify storage minted_coins:tmp trade.buy set from storage minted_coins:tmp coins.buy.$(low)
$data modify storage minted_coins:tmp trade.sell set from storage minted_coins:tmp coins.sell.$(high)
data modify storage minted_coins:tmp trade.buy.count set value 64
data modify storage minted_coins:tmp trade.sell.count set value 1
data modify entity @s Offers.Recipes append from storage minted_coins:tmp trade
$data modify storage minted_coins:tmp trade.buy set from storage minted_coins:tmp coins.buy.$(high)
$data modify storage minted_coins:tmp trade.sell set from storage minted_coins:tmp coins.sell.$(low)
data modify storage minted_coins:tmp trade.buy.count set value 1
data modify storage minted_coins:tmp trade.sell.count set value 64
data modify entity @s Offers.Recipes append from storage minted_coins:tmp trade
