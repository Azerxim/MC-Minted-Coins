# as the mint being edited: applies the new names, rates and small change, then replaces the mint with a new one
# (same place, rotation and id: coins it already struck stay its own) and updates its registry entry
scoreboard players set $found minted_coins.data 1
data modify storage minted_coins:tmp mint set from storage minted_coins:tmp entry
data remove storage minted_coins:tmp mint.edit
# renamed coins: the old name is kept in mint.legacy, for a trade that exchanges the coins struck under it for new ones
execute unless data storage minted_coins:tmp new_coin_names{gold:""} run function minted_coins:mint/legacy_add {metal:"gold",item:"minecraft:gold_nugget",model:"gold_coin",color:16438858}
execute unless data storage minted_coins:tmp new_coin_names{copper:""} run function minted_coins:mint/legacy_add {metal:"copper",item:"minecraft:copper_nugget",model:"copper_coin",color:15170646}
execute unless data storage minted_coins:tmp new_coin_names{iron:""} run function minted_coins:mint/legacy_add {metal:"iron",item:"minecraft:iron_nugget",model:"iron_coin",color:14278631}
execute unless data storage minted_coins:tmp new_coin_names{diamond:""} run function minted_coins:mint/legacy_add {metal:"diamond",item:"minecraft:prismarine_crystals",model:"diamond_coin",color:4910553}
execute unless data storage minted_coins:tmp {new_name:""} run data modify storage minted_coins:tmp mint.name set value {text:""}
execute unless data storage minted_coins:tmp {new_name:""} run data modify storage minted_coins:tmp mint.name.text set from storage minted_coins:tmp new_name
execute unless data storage minted_coins:tmp new_coin_names{gold:""} run data modify storage minted_coins:tmp mint.gold_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{gold:""} run data modify storage minted_coins:tmp mint.gold_name.text set from storage minted_coins:tmp new_coin_names.gold
execute unless data storage minted_coins:tmp new_coin_names{copper:""} run data modify storage minted_coins:tmp mint.copper_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{copper:""} run data modify storage minted_coins:tmp mint.copper_name.text set from storage minted_coins:tmp new_coin_names.copper
execute unless data storage minted_coins:tmp new_coin_names{iron:""} run data modify storage minted_coins:tmp mint.iron_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{iron:""} run data modify storage minted_coins:tmp mint.iron_name.text set from storage minted_coins:tmp new_coin_names.iron
execute unless data storage minted_coins:tmp new_coin_names{diamond:""} run data modify storage minted_coins:tmp mint.diamond_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{diamond:""} run data modify storage minted_coins:tmp mint.diamond_name.text set from storage minted_coins:tmp new_coin_names.diamond
execute store result storage minted_coins:tmp mint.gold int 1 run scoreboard players get $gold minted_coins.data
execute store result storage minted_coins:tmp mint.copper int 1 run scoreboard players get $copper minted_coins.data
execute store result storage minted_coins:tmp mint.iron int 1 run scoreboard players get $iron minted_coins.data
execute store result storage minted_coins:tmp mint.diamond int 1 run scoreboard players get $diamond minted_coins.data
execute store result storage minted_coins:tmp mint.small int 1 run scoreboard players get $small minted_coins.data
execute at @s rotated as @s summon minecraft:wandering_trader run function minted_coins:mint/rebuild
function minted_coins:admin/update_entry with storage minted_coins:tmp mint
scoreboard players reset @s minted_coins.id
particle minecraft:poof ~ ~1 ~ 0.3 0.5 0.3 0.02 20
tp @s ~ -1000 ~
kill @s
