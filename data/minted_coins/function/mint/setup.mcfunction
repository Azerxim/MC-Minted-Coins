# as the new mint; the admin is tagged minted_coins.self
data merge entity @s {Tags:["minted_coins.mint"],NoAI:1b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,DespawnDelay:0,CustomNameVisible:1b}
execute facing entity @e[tag=minted_coins.self,limit=1] feet run tp @s ~ ~ ~ ~ 0
scoreboard players operation @s minted_coins.id = $last_id minted_coins.data

# name: the name typed in the dialog, otherwise the renamed item in the admin's main hand, otherwise "Mint #<id>"
data modify storage minted_coins:tmp mint set value {name:{translate:"name.minted_coins.default",fallback:"Mint #%s",with:[0]}}
execute store result storage minted_coins:tmp mint.name.with[0] int 1 run scoreboard players get $last_id minted_coins.data
tag @s add minted_coins.new
execute as @e[tag=minted_coins.self,limit=1] if items entity @s weapon.mainhand *[minecraft:custom_name] run item replace entity @e[tag=minted_coins.new,limit=1] weapon.mainhand from entity @s weapon.mainhand
tag @s remove minted_coins.new
execute if items entity @s weapon.mainhand * run data modify storage minted_coins:tmp mint.name set from entity @s equipment.mainhand.components."minecraft:custom_name"
item replace entity @s weapon.mainhand with minecraft:air
execute unless data storage minted_coins:tmp {new_name:""} run data modify storage minted_coins:tmp mint.name set value {text:""}
execute unless data storage minted_coins:tmp {new_name:""} run data modify storage minted_coins:tmp mint.name.text set from storage minted_coins:tmp new_name

# coin names: the names typed in the dialog, otherwise a renamed gold / copper / iron nugget or prismarine crystals in the admin's inventory,
# otherwise "Gold Coin" / "Copper Coin" / "Iron Coin" / "Diamond Coin"
data modify storage minted_coins:tmp mint.gold_name set value {translate:"item.minted_coins.gold_coin",fallback:"Gold Coin"}
data modify storage minted_coins:tmp mint.copper_name set value {translate:"item.minted_coins.copper_coin",fallback:"Copper Coin"}
data modify storage minted_coins:tmp mint.iron_name set value {translate:"item.minted_coins.iron_coin",fallback:"Iron Coin"}
data modify storage minted_coins:tmp mint.diamond_name set value {translate:"item.minted_coins.diamond_coin",fallback:"Diamond Coin"}
execute as @e[tag=minted_coins.self,limit=1] run data modify storage minted_coins:tmp mint.gold_name set from entity @s Inventory[{id:"minecraft:gold_nugget"}].components."minecraft:custom_name"
execute as @e[tag=minted_coins.self,limit=1] run data modify storage minted_coins:tmp mint.copper_name set from entity @s Inventory[{id:"minecraft:copper_nugget"}].components."minecraft:custom_name"
execute as @e[tag=minted_coins.self,limit=1] run data modify storage minted_coins:tmp mint.iron_name set from entity @s Inventory[{id:"minecraft:iron_nugget"}].components."minecraft:custom_name"
execute as @e[tag=minted_coins.self,limit=1] run data modify storage minted_coins:tmp mint.diamond_name set from entity @s Inventory[{id:"minecraft:prismarine_crystals"}].components."minecraft:custom_name"
execute unless data storage minted_coins:tmp new_coin_names{gold:""} run data modify storage minted_coins:tmp mint.gold_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{gold:""} run data modify storage minted_coins:tmp mint.gold_name.text set from storage minted_coins:tmp new_coin_names.gold
execute unless data storage minted_coins:tmp new_coin_names{copper:""} run data modify storage minted_coins:tmp mint.copper_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{copper:""} run data modify storage minted_coins:tmp mint.copper_name.text set from storage minted_coins:tmp new_coin_names.copper
execute unless data storage minted_coins:tmp new_coin_names{iron:""} run data modify storage minted_coins:tmp mint.iron_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{iron:""} run data modify storage minted_coins:tmp mint.iron_name.text set from storage minted_coins:tmp new_coin_names.iron
execute unless data storage minted_coins:tmp new_coin_names{diamond:""} run data modify storage minted_coins:tmp mint.diamond_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{diamond:""} run data modify storage minted_coins:tmp mint.diamond_name.text set from storage minted_coins:tmp new_coin_names.diamond

# trades and name of the mint
function minted_coins:mint/trades

# registry entry
execute store result storage minted_coins:tmp mint.id int 1 run scoreboard players get $last_id minted_coins.data
execute store result storage minted_coins:tmp mint.gold int 1 run scoreboard players get $gold minted_coins.data
execute store result storage minted_coins:tmp mint.copper int 1 run scoreboard players get $copper minted_coins.data
execute store result storage minted_coins:tmp mint.iron int 1 run scoreboard players get $iron minted_coins.data
execute store result storage minted_coins:tmp mint.diamond int 1 run scoreboard players get $diamond minted_coins.data
execute store result storage minted_coins:tmp mint.small int 1 run scoreboard players get $small minted_coins.data
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
scoreboard players add $value minted_coins.data 200000
execute store result storage minted_coins:tmp mint.confirm int 1 run scoreboard players get $value minted_coins.data
scoreboard players add $value minted_coins.data 100000
execute store result storage minted_coins:tmp mint.forget int 1 run scoreboard players get $value minted_coins.data
data modify storage minted_coins:registry mints append from storage minted_coins:tmp mint
