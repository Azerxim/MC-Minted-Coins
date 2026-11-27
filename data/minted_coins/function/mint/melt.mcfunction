# {metal, item, model, ingot}, as a mint, with a bank entry in minted_coins:tmp melt_src: when that bank strikes this coin,
# N of its coins -> 1 ingot (or diamond), N being the coins it strikes per ingot: the metal comes back whole
$execute store result score $melt minted_coins.data run data get storage minted_coins:tmp melt_src.$(metal)
execute if score $melt minted_coins.data matches ..0 run return 0
$data modify storage minted_coins:tmp recipe set value {buy:{id:"$(item)",count:1,components:{"minecraft:item_name":"","minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:$(model)"]}}},sell:{id:"$(ingot)",count:1},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0}
$data modify storage minted_coins:tmp recipe.buy.components."minecraft:item_name" set from storage minted_coins:tmp melt_src.$(metal)_name
data modify storage minted_coins:tmp recipe.buy.components."minecraft:custom_data".minted_coins.mint set from storage minted_coins:tmp melt_src.id
execute store result storage minted_coins:tmp recipe.buy.count int 1 run scoreboard players get $melt minted_coins.data
data modify entity @s Offers.Recipes append from storage minted_coins:tmp recipe
