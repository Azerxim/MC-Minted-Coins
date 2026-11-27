# {metal, item, model, from, to ("bank" or "other")}, as an exchange office: $x coins of bank <from> -> $y coins of bank <to>,
# reduced by their greatest common divisor; nothing when $y is 0 (a fee that leaves less than one coin)
scoreboard players operation $ga minted_coins.data = $x minted_coins.data
scoreboard players operation $gb minted_coins.data = $y minted_coins.data
function minted_coins:exchange/gcd
execute if score $ga minted_coins.data matches 1.. run scoreboard players operation $x minted_coins.data /= $ga minted_coins.data
execute if score $ga minted_coins.data matches 1.. run scoreboard players operation $y minted_coins.data /= $ga minted_coins.data
execute if score $y minted_coins.data matches ..0 run return 0
$data modify storage minted_coins:tmp recipe set value {buy:{id:"$(item)",count:1,components:{"minecraft:item_name":"","minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:$(model)"]}}},sell:{id:"$(item)",count:1,components:{"minecraft:item_name":"","minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:$(model)"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0}
$data modify storage minted_coins:tmp recipe.buy.components."minecraft:item_name" set from storage minted_coins:tmp $(from).$(metal)_name
$data modify storage minted_coins:tmp recipe.buy.components."minecraft:custom_data".minted_coins.mint set from storage minted_coins:tmp $(from).id
$data modify storage minted_coins:tmp recipe.sell.components."minecraft:item_name" set from storage minted_coins:tmp $(to).$(metal)_name
$data modify storage minted_coins:tmp recipe.sell.components."minecraft:custom_data".minted_coins.mint set from storage minted_coins:tmp $(to).id
$data modify storage minted_coins:tmp recipe.sell.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp $(to).name
execute store result storage minted_coins:tmp recipe.buy.count int 1 run scoreboard players get $x minted_coins.data
execute store result storage minted_coins:tmp recipe.sell.count int 1 run scoreboard players get $y minted_coins.data
data modify entity @s Offers.Recipes append from storage minted_coins:tmp recipe
