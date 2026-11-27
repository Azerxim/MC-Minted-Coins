# {metal}: appends the licence trade to the mint
function minted_coins:shop/licence_item
data modify storage minted_coins:tmp recipe set value {buy:{id:"minecraft:stone",count:1},sell:{id:"minecraft:paper",count:1},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0}
$data modify storage minted_coins:tmp recipe.buy set from storage minted_coins:tmp coins.buy.$(metal)
execute store result storage minted_coins:tmp recipe.buy.count int 1 run scoreboard players get $licence minted_coins.data
data modify storage minted_coins:tmp recipe.sell set from storage minted_coins:tmp licence
data modify entity @s Offers.Recipes append from storage minted_coins:tmp recipe
