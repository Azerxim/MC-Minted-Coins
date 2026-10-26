# as the new mint; the admin is tagged minted_coins.self
data merge entity @s {Tags:["minted_coins.mint"],NoAI:1b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,DespawnDelay:0,CustomNameVisible:1b,Offers:{Recipes:[{buy:{id:"minecraft:gold_ingot",count:1},sell:{id:"minecraft:gold_nugget",count:8,components:{"minecraft:item_name":{translate:"item.minted_coins.gold_coin",fallback:"Gold Coin"},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:gold_coin"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0},{buy:{id:"minecraft:copper_ingot",count:1},sell:{id:"minecraft:copper_nugget",count:8,components:{"minecraft:item_name":{translate:"item.minted_coins.copper_coin",fallback:"Copper Coin"},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[""],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:copper_coin"]}}},maxUses:2147483647,rewardExp:0b,xp:0,priceMultiplier:0.0f,demand:0,specialPrice:0}]}}
execute facing entity @e[tag=minted_coins.self,limit=1] feet run tp @s ~ ~ ~ ~ 0
scoreboard players operation @s minted_coins.id = $last_id minted_coins.data

# name: the renamed item in the admin's main hand, otherwise "Mint #<id>"
data modify storage minted_coins:tmp mint set value {name:{translate:"name.minted_coins.default",fallback:"Mint #%s",with:[0]}}
execute store result storage minted_coins:tmp mint.name.with[0] int 1 run scoreboard players get $last_id minted_coins.data
tag @s add minted_coins.new
execute as @e[tag=minted_coins.self,limit=1] if items entity @s weapon.mainhand *[minecraft:custom_name] run item replace entity @e[tag=minted_coins.new,limit=1] weapon.mainhand from entity @s weapon.mainhand
tag @s remove minted_coins.new
execute if items entity @s weapon.mainhand * run data modify storage minted_coins:tmp mint.name set from entity @s equipment.mainhand.components."minecraft:custom_name"
item replace entity @s weapon.mainhand with minecraft:air
data modify entity @s CustomName set from storage minted_coins:tmp mint.name

# trades
data modify entity @s Offers.Recipes[].sell.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp mint.name
execute store result entity @s Offers.Recipes[0].sell.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get $last_id minted_coins.data
execute store result entity @s Offers.Recipes[1].sell.components."minecraft:custom_data".minted_coins.mint int 1 run scoreboard players get $last_id minted_coins.data
execute store result entity @s Offers.Recipes[0].sell.count int 1 run scoreboard players get $gold minted_coins.data
execute store result entity @s Offers.Recipes[1].sell.count int 1 run scoreboard players get $copper minted_coins.data

# registry entry
execute store result storage minted_coins:tmp mint.id int 1 run scoreboard players get $last_id minted_coins.data
execute store result storage minted_coins:tmp mint.gold int 1 run scoreboard players get $gold minted_coins.data
execute store result storage minted_coins:tmp mint.copper int 1 run scoreboard players get $copper minted_coins.data
data modify storage minted_coins:tmp mint.dim set value "minecraft:overworld"
data modify storage minted_coins:tmp mint.dim set from entity @e[tag=minted_coins.self,limit=1] Dimension
data modify storage minted_coins:tmp mint.x set from entity @s Pos[0]
data modify storage minted_coins:tmp mint.y set from entity @s Pos[1]
data modify storage minted_coins:tmp mint.z set from entity @s Pos[2]
execute store result storage minted_coins:tmp mint.bx int 1 run data get entity @s Pos[0]
execute store result storage minted_coins:tmp mint.by int 1 run data get entity @s Pos[1]
execute store result storage minted_coins:tmp mint.bz int 1 run data get entity @s Pos[2]
scoreboard players operation $value minted_coins.data = $last_id minted_coins.data
scoreboard players add $value minted_coins.data 100000
execute store result storage minted_coins:tmp mint.goto int 1 run scoreboard players get $value minted_coins.data
scoreboard players add $value minted_coins.data 100000
execute store result storage minted_coins:tmp mint.remove int 1 run scoreboard players get $value minted_coins.data
scoreboard players add $value minted_coins.data 100000
execute store result storage minted_coins:tmp mint.confirm int 1 run scoreboard players get $value minted_coins.data
scoreboard players add $value minted_coins.data 100000
execute store result storage minted_coins:tmp mint.forget int 1 run scoreboard players get $value minted_coins.data
data modify storage minted_coins:registry mints append from storage minted_coins:tmp mint
