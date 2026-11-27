# as and at the admin: registers a new bank from the scores ($gold…, $small, $gold_rank…) and minted_coins:tmp new_name,
# new_coin_names, new_small_name set by minted_coins:admin/bank_create
scoreboard players add $last_bank minted_coins.data 1

# name: the name typed in the dialog, otherwise the renamed item in the admin's main hand, otherwise "Bank #<id>"
data modify storage minted_coins:tmp bank set value {name:{translate:"name.minted_coins.default_bank",fallback:"Bank #%s",with:[0]}}
execute store result storage minted_coins:tmp bank.name.with[0] int 1 run scoreboard players get $last_bank minted_coins.data
summon minecraft:item_display ~ ~ ~ {Tags:["minted_coins.reader"]}
item replace entity @e[type=minecraft:item_display,tag=minted_coins.reader,limit=1] contents from entity @s weapon.mainhand
execute if items entity @e[type=minecraft:item_display,tag=minted_coins.reader,limit=1] contents *[minecraft:custom_name] run data modify storage minted_coins:tmp bank.name set from entity @e[type=minecraft:item_display,tag=minted_coins.reader,limit=1] item.components."minecraft:custom_name"
kill @e[type=minecraft:item_display,tag=minted_coins.reader]
execute unless data storage minted_coins:tmp {new_name:""} run data modify storage minted_coins:tmp bank.name set value {text:""}
execute unless data storage minted_coins:tmp {new_name:""} run data modify storage minted_coins:tmp bank.name.text set from storage minted_coins:tmp new_name

# coin names: the names typed in the dialog, otherwise a renamed gold / copper / iron nugget or prismarine crystals in the admin's inventory,
# otherwise "Gold Coin" / "Copper Coin" / "Iron Coin" / "Diamond Coin"
data modify storage minted_coins:tmp bank.gold_name set value {translate:"item.minted_coins.gold_coin",fallback:"Gold Coin"}
data modify storage minted_coins:tmp bank.copper_name set value {translate:"item.minted_coins.copper_coin",fallback:"Copper Coin"}
data modify storage minted_coins:tmp bank.iron_name set value {translate:"item.minted_coins.iron_coin",fallback:"Iron Coin"}
data modify storage minted_coins:tmp bank.diamond_name set value {translate:"item.minted_coins.diamond_coin",fallback:"Diamond Coin"}
data modify storage minted_coins:tmp bank.gold_name set from entity @s Inventory[{id:"minecraft:gold_nugget"}].components."minecraft:custom_name"
data modify storage minted_coins:tmp bank.copper_name set from entity @s Inventory[{id:"minecraft:copper_nugget"}].components."minecraft:custom_name"
data modify storage minted_coins:tmp bank.iron_name set from entity @s Inventory[{id:"minecraft:iron_nugget"}].components."minecraft:custom_name"
data modify storage minted_coins:tmp bank.diamond_name set from entity @s Inventory[{id:"minecraft:prismarine_crystals"}].components."minecraft:custom_name"
execute unless data storage minted_coins:tmp new_coin_names{gold:""} run data modify storage minted_coins:tmp bank.gold_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{gold:""} run data modify storage minted_coins:tmp bank.gold_name.text set from storage minted_coins:tmp new_coin_names.gold
execute unless data storage minted_coins:tmp new_coin_names{copper:""} run data modify storage minted_coins:tmp bank.copper_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{copper:""} run data modify storage minted_coins:tmp bank.copper_name.text set from storage minted_coins:tmp new_coin_names.copper
execute unless data storage minted_coins:tmp new_coin_names{iron:""} run data modify storage minted_coins:tmp bank.iron_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{iron:""} run data modify storage minted_coins:tmp bank.iron_name.text set from storage minted_coins:tmp new_coin_names.iron
execute unless data storage minted_coins:tmp new_coin_names{diamond:""} run data modify storage minted_coins:tmp bank.diamond_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{diamond:""} run data modify storage minted_coins:tmp bank.diamond_name.text set from storage minted_coins:tmp new_coin_names.diamond

# small coin name: the pattern typed in the dialog (%s = the coin name, as a translation fallback under a key that no
# resource pack defines, so that Minecraft fills it in), otherwise "Small %s", translated by the resource pack
data modify storage minted_coins:tmp bank.small_name set value {translate:"item.minted_coins.small_coin",fallback:"Small %s"}
execute unless data storage minted_coins:tmp {new_small_name:""} run data modify storage minted_coins:tmp bank.small_name set value {translate:"item.minted_coins.small_coin.custom",fallback:""}
execute unless data storage minted_coins:tmp {new_small_name:""} run data modify storage minted_coins:tmp bank.small_name.fallback set from storage minted_coins:tmp new_small_name

# rates, small change and conversion order
execute store result storage minted_coins:tmp bank.id int 1 run scoreboard players get $last_bank minted_coins.data
execute store result storage minted_coins:tmp bank.gold int 1 run scoreboard players get $gold minted_coins.data
execute store result storage minted_coins:tmp bank.copper int 1 run scoreboard players get $copper minted_coins.data
execute store result storage minted_coins:tmp bank.iron int 1 run scoreboard players get $iron minted_coins.data
execute store result storage minted_coins:tmp bank.diamond int 1 run scoreboard players get $diamond minted_coins.data
execute store result storage minted_coins:tmp bank.small int 1 run scoreboard players get $small minted_coins.data
execute store result storage minted_coins:tmp bank.gold_rank int 1 run scoreboard players get $gold_rank minted_coins.data
execute store result storage minted_coins:tmp bank.copper_rank int 1 run scoreboard players get $copper_rank minted_coins.data
execute store result storage minted_coins:tmp bank.iron_rank int 1 run scoreboard players get $iron_rank minted_coins.data
execute store result storage minted_coins:tmp bank.diamond_rank int 1 run scoreboard players get $diamond_rank minted_coins.data
execute store result storage minted_coins:tmp bank.licence int 1 run scoreboard players get $licence minted_coins.data
data modify storage minted_coins:tmp bank.licence_metal set from storage minted_coins:tmp new_licence_metal
data modify storage minted_coins:registry banks append from storage minted_coins:tmp bank
# mints that convert the coins of every bank take this one too
scoreboard players add $config_ver minted_coins.data 1
tellraw @s {translate:"chat.minted_coins.bank_created",fallback:"✔ Bank created: %s",color:"green",with:[{nbt:"bank.name",storage:"minted_coins:tmp",interpret:true,color:"gold"}]}
scoreboard players operation $target minted_coins.data = $last_bank minted_coins.data
function minted_coins:admin/bank_page
