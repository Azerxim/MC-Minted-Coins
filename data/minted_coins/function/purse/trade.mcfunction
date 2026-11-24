# as a mint (its minted_coins.id and name set): adds the trade that sells its purse, a bundle for its coins only,
# at the top of its list
data modify storage minted_coins:tmp recipe set value {buy:{id:"minecraft:leather",count:1},buyB:{id:"minecraft:string",count:1},sell:{id:"minecraft:bundle",count:1,components:{"minecraft:item_name":{translate:"item.minted_coins.purse",fallback:"Purse"},"minecraft:custom_model_data":{strings:["minted_coins:purse"],flags:[0b]},"minecraft:custom_data":{minted_coins:{purse:{mint:0}}},"minecraft:lore":[{translate:"lore.minted_coins.purse_of",fallback:"Coins of %s",with:[""],color:"gray",italic:false}]}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0}
execute store result storage minted_coins:tmp recipe.sell.components."minecraft:custom_data".minted_coins.purse.mint int 1 run scoreboard players get @s minted_coins.id
data modify storage minted_coins:tmp recipe.sell.components."minecraft:lore"[0].with[0] set from entity @s CustomName
data modify entity @s Offers.Recipes insert 0 from storage minted_coins:tmp recipe
