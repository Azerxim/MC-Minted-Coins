# as a mint (its minted_coins.bank set): (re)builds its name and trades from minted_coins:tmp mint (its name, the families
# of trades it accepts) and minted_coins:tmp bank (name, coin names, small coin name, former names)
# and the scores $gold / $copper / $iron / $diamond (coins per ingot or diamond, 0 = not struck), $small (1 = small change)
# and $gold_rank / $copper_rank / $iron_rank / $diamond_rank (conversion order, 0 = not converted)
data modify entity @s CustomName set from storage minted_coins:tmp mint.name
data modify entity @s Offers set value {Recipes:[{buy:{id:"minecraft:gold_ingot",count:1},sell:{id:"minecraft:gold_nugget",count:8,components:{"minecraft:item_name":{translate:"item.minted_coins.gold_coin",fallback:"Gold Coin"},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:gold_coin"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0},{buy:{id:"minecraft:gold_nugget",count:1,components:{"minecraft:item_name":{translate:"item.minted_coins.gold_coin",fallback:"Gold Coin"},"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:gold_coin"]}}},sell:{id:"minecraft:firework_star",count:9,components:{"minecraft:item_name":{translate:"item.minted_coins.small_coin",fallback:"Small %s",with:[{translate:"item.minted_coins.gold_coin",fallback:"Gold Coin"}]},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:small_gold_coin"]},"minecraft:firework_explosion":{shape:"small_ball",colors:[I;16438858]},"minecraft:tooltip_display":{hidden_components:["minecraft:firework_explosion"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0},{buy:{id:"minecraft:firework_star",count:9,components:{"minecraft:item_name":{translate:"item.minted_coins.small_coin",fallback:"Small %s",with:[{translate:"item.minted_coins.gold_coin",fallback:"Gold Coin"}]},"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:small_gold_coin"]}}},sell:{id:"minecraft:gold_nugget",count:1,components:{"minecraft:item_name":{translate:"item.minted_coins.gold_coin",fallback:"Gold Coin"},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:gold_coin"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0},{buy:{id:"minecraft:copper_ingot",count:1},sell:{id:"minecraft:copper_nugget",count:8,components:{"minecraft:item_name":{translate:"item.minted_coins.copper_coin",fallback:"Copper Coin"},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:copper_coin"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0},{buy:{id:"minecraft:copper_nugget",count:1,components:{"minecraft:item_name":{translate:"item.minted_coins.copper_coin",fallback:"Copper Coin"},"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:copper_coin"]}}},sell:{id:"minecraft:firework_star",count:9,components:{"minecraft:item_name":{translate:"item.minted_coins.small_coin",fallback:"Small %s",with:[{translate:"item.minted_coins.copper_coin",fallback:"Copper Coin"}]},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:small_copper_coin"]},"minecraft:firework_explosion":{shape:"small_ball",colors:[I;15170646]},"minecraft:tooltip_display":{hidden_components:["minecraft:firework_explosion"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0},{buy:{id:"minecraft:firework_star",count:9,components:{"minecraft:item_name":{translate:"item.minted_coins.small_coin",fallback:"Small %s",with:[{translate:"item.minted_coins.copper_coin",fallback:"Copper Coin"}]},"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:small_copper_coin"]}}},sell:{id:"minecraft:copper_nugget",count:1,components:{"minecraft:item_name":{translate:"item.minted_coins.copper_coin",fallback:"Copper Coin"},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:copper_coin"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0},{buy:{id:"minecraft:iron_ingot",count:1},sell:{id:"minecraft:iron_nugget",count:8,components:{"minecraft:item_name":{translate:"item.minted_coins.iron_coin",fallback:"Iron Coin"},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:iron_coin"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0},{buy:{id:"minecraft:iron_nugget",count:1,components:{"minecraft:item_name":{translate:"item.minted_coins.iron_coin",fallback:"Iron Coin"},"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:iron_coin"]}}},sell:{id:"minecraft:firework_star",count:9,components:{"minecraft:item_name":{translate:"item.minted_coins.small_coin",fallback:"Small %s",with:[{translate:"item.minted_coins.iron_coin",fallback:"Iron Coin"}]},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:small_iron_coin"]},"minecraft:firework_explosion":{shape:"small_ball",colors:[I;14278631]},"minecraft:tooltip_display":{hidden_components:["minecraft:firework_explosion"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0},{buy:{id:"minecraft:firework_star",count:9,components:{"minecraft:item_name":{translate:"item.minted_coins.small_coin",fallback:"Small %s",with:[{translate:"item.minted_coins.iron_coin",fallback:"Iron Coin"}]},"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:small_iron_coin"]}}},sell:{id:"minecraft:iron_nugget",count:1,components:{"minecraft:item_name":{translate:"item.minted_coins.iron_coin",fallback:"Iron Coin"},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:iron_coin"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0},{buy:{id:"minecraft:diamond",count:1},sell:{id:"minecraft:prismarine_crystals",count:8,components:{"minecraft:item_name":{translate:"item.minted_coins.diamond_coin",fallback:"Diamond Coin"},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:diamond_coin"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0},{buy:{id:"minecraft:prismarine_crystals",count:1,components:{"minecraft:item_name":{translate:"item.minted_coins.diamond_coin",fallback:"Diamond Coin"},"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:diamond_coin"]}}},sell:{id:"minecraft:firework_star",count:9,components:{"minecraft:item_name":{translate:"item.minted_coins.small_coin",fallback:"Small %s",with:[{translate:"item.minted_coins.diamond_coin",fallback:"Diamond Coin"}]},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:small_diamond_coin"]},"minecraft:firework_explosion":{shape:"small_ball",colors:[I;4910553]},"minecraft:tooltip_display":{hidden_components:["minecraft:firework_explosion"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0},{buy:{id:"minecraft:firework_star",count:9,components:{"minecraft:item_name":{translate:"item.minted_coins.small_coin",fallback:"Small %s",with:[{translate:"item.minted_coins.diamond_coin",fallback:"Diamond Coin"}]},"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:small_diamond_coin"]}}},sell:{id:"minecraft:prismarine_crystals",count:1,components:{"minecraft:item_name":{translate:"item.minted_coins.diamond_coin",fallback:"Diamond Coin"},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:diamond_coin"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0},{buy:{id:"minecraft:prismarine_crystals",count:9,components:{"minecraft:item_name":{translate:"item.minted_coins.diamond_coin",fallback:"Diamond Coin"},"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:diamond_coin"]}}},sell:{id:"minecraft:diamond",count:1},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0}]}
# small change: 1 coin is worth as many small coins as the mint strikes coins per ingot (or per diamond)
execute unless score $gold minted_coins.data matches 0 store result entity @s Offers.Recipes[1].sell.count int 1 run scoreboard players get $gold minted_coins.data
execute unless score $gold minted_coins.data matches 0 store result entity @s Offers.Recipes[2].buy.count int 1 run scoreboard players get $gold minted_coins.data
execute unless score $copper minted_coins.data matches 0 store result entity @s Offers.Recipes[4].sell.count int 1 run scoreboard players get $copper minted_coins.data
execute unless score $copper minted_coins.data matches 0 store result entity @s Offers.Recipes[5].buy.count int 1 run scoreboard players get $copper minted_coins.data
execute unless score $iron minted_coins.data matches 0 store result entity @s Offers.Recipes[7].sell.count int 1 run scoreboard players get $iron minted_coins.data
execute unless score $iron minted_coins.data matches 0 store result entity @s Offers.Recipes[8].buy.count int 1 run scoreboard players get $iron minted_coins.data
execute unless score $diamond minted_coins.data matches 0 store result entity @s Offers.Recipes[10].sell.count int 1 run scoreboard players get $diamond minted_coins.data
execute unless score $diamond minted_coins.data matches 0 store result entity @s Offers.Recipes[11].buy.count int 1 run scoreboard players get $diamond minted_coins.data
# names of the small coins: the small coin name of the mint, with each coin name
function minted_coins:mint/small_names
# coins taken back show the coin names of the mint; the trade only takes coins that carry these names
data modify entity @s Offers.Recipes[1].buy.components."minecraft:item_name" set from storage minted_coins:tmp bank.gold_name
data modify entity @s Offers.Recipes[2].buy.components."minecraft:item_name" set from storage minted_coins:tmp small_names.gold
data modify entity @s Offers.Recipes[4].buy.components."minecraft:item_name" set from storage minted_coins:tmp bank.copper_name
data modify entity @s Offers.Recipes[5].buy.components."minecraft:item_name" set from storage minted_coins:tmp small_names.copper
data modify entity @s Offers.Recipes[7].buy.components."minecraft:item_name" set from storage minted_coins:tmp bank.iron_name
data modify entity @s Offers.Recipes[8].buy.components."minecraft:item_name" set from storage minted_coins:tmp small_names.iron
data modify entity @s Offers.Recipes[10].buy.components."minecraft:item_name" set from storage minted_coins:tmp bank.diamond_name
data modify entity @s Offers.Recipes[11].buy.components."minecraft:item_name" set from storage minted_coins:tmp small_names.diamond
data modify entity @s Offers.Recipes[12].buy.components."minecraft:item_name" set from storage minted_coins:tmp bank.diamond_name
# trades, per metal (gold 0-2, copper 3-5, iron 6-8, diamond 9-11): strike (ingot or diamond -> coins),
# change (1 coin -> 9 small coins) and gather (9 small coins -> 1 coin); 12: buyback (9 diamond coins -> 1 diamond)
data modify entity @s Offers.Recipes[0].sell.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp bank.name
data modify entity @s Offers.Recipes[0].sell.components."minecraft:item_name" set from storage minted_coins:tmp bank.gold_name
data modify entity @s Offers.Recipes[1].sell.components."minecraft:item_name" set from storage minted_coins:tmp small_names.gold
data modify entity @s Offers.Recipes[1].sell.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp bank.name
data modify entity @s Offers.Recipes[2].sell.components."minecraft:item_name" set from storage minted_coins:tmp bank.gold_name
data modify entity @s Offers.Recipes[2].sell.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp bank.name
data modify entity @s Offers.Recipes[3].sell.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp bank.name
data modify entity @s Offers.Recipes[3].sell.components."minecraft:item_name" set from storage minted_coins:tmp bank.copper_name
data modify entity @s Offers.Recipes[4].sell.components."minecraft:item_name" set from storage minted_coins:tmp small_names.copper
data modify entity @s Offers.Recipes[4].sell.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp bank.name
data modify entity @s Offers.Recipes[5].sell.components."minecraft:item_name" set from storage minted_coins:tmp bank.copper_name
data modify entity @s Offers.Recipes[5].sell.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp bank.name
data modify entity @s Offers.Recipes[6].sell.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp bank.name
data modify entity @s Offers.Recipes[6].sell.components."minecraft:item_name" set from storage minted_coins:tmp bank.iron_name
data modify entity @s Offers.Recipes[7].sell.components."minecraft:item_name" set from storage minted_coins:tmp small_names.iron
data modify entity @s Offers.Recipes[7].sell.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp bank.name
data modify entity @s Offers.Recipes[8].sell.components."minecraft:item_name" set from storage minted_coins:tmp bank.iron_name
data modify entity @s Offers.Recipes[8].sell.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp bank.name
data modify entity @s Offers.Recipes[9].sell.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp bank.name
data modify entity @s Offers.Recipes[9].sell.components."minecraft:item_name" set from storage minted_coins:tmp bank.diamond_name
data modify entity @s Offers.Recipes[10].sell.components."minecraft:item_name" set from storage minted_coins:tmp small_names.diamond
data modify entity @s Offers.Recipes[10].sell.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp bank.name
data modify entity @s Offers.Recipes[11].sell.components."minecraft:item_name" set from storage minted_coins:tmp bank.diamond_name
data modify entity @s Offers.Recipes[11].sell.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp bank.name
execute store result entity @s Offers.Recipes[0].sell.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[1].sell.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[2].sell.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[3].sell.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[4].sell.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[5].sell.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[6].sell.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[7].sell.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[8].sell.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[9].sell.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[10].sell.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[11].sell.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[1].buy.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[2].buy.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[4].buy.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[5].buy.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[7].buy.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[8].buy.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[10].buy.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[11].buy.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute store result entity @s Offers.Recipes[12].buy.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get @s minted_coins.bank
execute unless score $gold minted_coins.data matches 0 store result entity @s Offers.Recipes[0].sell.count int 1 run scoreboard players get $gold minted_coins.data
execute unless score $copper minted_coins.data matches 0 store result entity @s Offers.Recipes[3].sell.count int 1 run scoreboard players get $copper minted_coins.data
execute unless score $iron minted_coins.data matches 0 store result entity @s Offers.Recipes[6].sell.count int 1 run scoreboard players get $iron minted_coins.data
execute unless score $diamond minted_coins.data matches 0 store result entity @s Offers.Recipes[9].sell.count int 1 run scoreboard players get $diamond minted_coins.data
# coins of the bank, for the conversion trades (before the trades of coins not struck are removed)
data modify storage minted_coins:tmp coins set value {sell:{},buy:{}}
data modify storage minted_coins:tmp coins.sell.gold set from entity @s Offers.Recipes[0].sell
data modify storage minted_coins:tmp coins.sell.copper set from entity @s Offers.Recipes[3].sell
data modify storage minted_coins:tmp coins.sell.iron set from entity @s Offers.Recipes[6].sell
data modify storage minted_coins:tmp coins.sell.diamond set from entity @s Offers.Recipes[9].sell
data modify storage minted_coins:tmp coins.buy set from storage minted_coins:tmp coins.sell
data remove storage minted_coins:tmp coins.buy.gold.components."minecraft:lore"
data remove storage minted_coins:tmp coins.buy.copper.components."minecraft:lore"
data remove storage minted_coins:tmp coins.buy.iron.components."minecraft:lore"
data remove storage minted_coins:tmp coins.buy.diamond.components."minecraft:lore"
# trades the mint keeps: $keep_<trade> = 1 when the bank strikes the coin (rate above 0, small change for the small coins)
# and the mint accepts that family of trades (minted_coins:tmp mint.trades: strike, small, convert, buyback, purse, licence)
execute store result score $f_strike minted_coins.data run data get storage minted_coins:tmp mint.trades.strike
execute store result score $f_small minted_coins.data run data get storage minted_coins:tmp mint.trades.small
execute store result score $f_convert minted_coins.data run data get storage minted_coins:tmp mint.trades.convert
execute store result score $f_buyback minted_coins.data run data get storage minted_coins:tmp mint.trades.buyback
execute store result score $f_purse minted_coins.data run data get storage minted_coins:tmp mint.trades.purse
execute store result score $f_licence minted_coins.data run data get storage minted_coins:tmp mint.trades.licence
scoreboard players set $keep_gold minted_coins.data 0
execute unless score $gold minted_coins.data matches 0 if score $f_strike minted_coins.data matches 1 run scoreboard players set $keep_gold minted_coins.data 1
scoreboard players set $keep_small_gold minted_coins.data 0
execute unless score $gold minted_coins.data matches 0 if score $small minted_coins.data matches 1 if score $f_small minted_coins.data matches 1 run scoreboard players set $keep_small_gold minted_coins.data 1
scoreboard players set $keep_copper minted_coins.data 0
execute unless score $copper minted_coins.data matches 0 if score $f_strike minted_coins.data matches 1 run scoreboard players set $keep_copper minted_coins.data 1
scoreboard players set $keep_small_copper minted_coins.data 0
execute unless score $copper minted_coins.data matches 0 if score $small minted_coins.data matches 1 if score $f_small minted_coins.data matches 1 run scoreboard players set $keep_small_copper minted_coins.data 1
scoreboard players set $keep_iron minted_coins.data 0
execute unless score $iron minted_coins.data matches 0 if score $f_strike minted_coins.data matches 1 run scoreboard players set $keep_iron minted_coins.data 1
scoreboard players set $keep_small_iron minted_coins.data 0
execute unless score $iron minted_coins.data matches 0 if score $small minted_coins.data matches 1 if score $f_small minted_coins.data matches 1 run scoreboard players set $keep_small_iron minted_coins.data 1
scoreboard players set $keep_diamond minted_coins.data 0
execute unless score $diamond minted_coins.data matches 0 if score $f_strike minted_coins.data matches 1 run scoreboard players set $keep_diamond minted_coins.data 1
scoreboard players set $keep_small_diamond minted_coins.data 0
execute unless score $diamond minted_coins.data matches 0 if score $small minted_coins.data matches 1 if score $f_small minted_coins.data matches 1 run scoreboard players set $keep_small_diamond minted_coins.data 1
scoreboard players set $keep_buyback minted_coins.data 0
execute unless score $diamond minted_coins.data matches 0 if score $f_buyback minted_coins.data matches 1 run scoreboard players set $keep_buyback minted_coins.data 1
# per metal (gold 0-2, copper 3-5, iron 6-8, diamond 9-11): strike, change, gather; 12: buyback. Last first, so the indexes stay valid
execute if score $keep_buyback minted_coins.data matches 0 run data remove entity @s Offers.Recipes[12]
execute if score $keep_small_diamond minted_coins.data matches 0 run data remove entity @s Offers.Recipes[11]
execute if score $keep_small_diamond minted_coins.data matches 0 run data remove entity @s Offers.Recipes[10]
execute if score $keep_diamond minted_coins.data matches 0 run data remove entity @s Offers.Recipes[9]
execute if score $keep_small_iron minted_coins.data matches 0 run data remove entity @s Offers.Recipes[8]
execute if score $keep_small_iron minted_coins.data matches 0 run data remove entity @s Offers.Recipes[7]
execute if score $keep_iron minted_coins.data matches 0 run data remove entity @s Offers.Recipes[6]
execute if score $keep_small_copper minted_coins.data matches 0 run data remove entity @s Offers.Recipes[5]
execute if score $keep_small_copper minted_coins.data matches 0 run data remove entity @s Offers.Recipes[4]
execute if score $keep_copper minted_coins.data matches 0 run data remove entity @s Offers.Recipes[3]
execute if score $keep_small_gold minted_coins.data matches 0 run data remove entity @s Offers.Recipes[2]
execute if score $keep_small_gold minted_coins.data matches 0 run data remove entity @s Offers.Recipes[1]
execute if score $keep_gold minted_coins.data matches 0 run data remove entity @s Offers.Recipes[0]
# conversion: 64 coins of a rank are worth 1 coin of the next rank among the struck coins ($gold_rank…), and back
execute if score $f_convert minted_coins.data matches 1 run function minted_coins:mint/chain
execute if score $f_convert minted_coins.data matches 1 run function minted_coins:mint/convert_next
# former coin names (bank.legacy): the coins struck under them are exchanged one for one for current coins
data modify storage minted_coins:tmp legacy_queue set value []
data modify storage minted_coins:tmp legacy_queue set from storage minted_coins:tmp bank.legacy
function minted_coins:mint/legacy_next
# former small coin names (bank.legacy_small): the small coins struck under them are exchanged one for one for current ones
data modify storage minted_coins:tmp legacy_queue set value []
data modify storage minted_coins:tmp legacy_queue set from storage minted_coins:tmp bank.legacy_small
function minted_coins:mint/legacy_small_next
# the purse of the bank: 1 leather + 1 string
execute if score $f_purse minted_coins.data matches 1 run function minted_coins:purse/trade
# the shop licence of the bank: N coins -> 1 licence (see minted_coins:shop/licence_trade)
execute if score $f_licence minted_coins.data matches 1 run function minted_coins:shop/licence_trade
