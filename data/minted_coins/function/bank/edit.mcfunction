# with the bank being edited in minted_coins:tmp entry: applies the new names (bank, coins, small coins), rates, small change
# and conversion order, and updates its registry entry. Its mints rebuild their trades on the next tick, or when they are loaded.
data modify storage minted_coins:tmp bank set from storage minted_coins:tmp entry
# names of its small coins before the edit, and whether it had small change
function minted_coins:mint/small_names
data modify storage minted_coins:tmp small_old set from storage minted_coins:tmp small_names
data modify storage minted_coins:tmp small_old.small set from storage minted_coins:tmp bank.small
# renamed coins: the old name is kept in bank.legacy, for a trade that exchanges the coins struck under it for new ones
execute unless data storage minted_coins:tmp new_coin_names{gold:""} run function minted_coins:mint/legacy_add {metal:"gold",item:"minecraft:gold_nugget",model:"gold_coin",color:16438858}
execute unless data storage minted_coins:tmp new_coin_names{copper:""} run function minted_coins:mint/legacy_add {metal:"copper",item:"minecraft:copper_nugget",model:"copper_coin",color:15170646}
execute unless data storage minted_coins:tmp new_coin_names{iron:""} run function minted_coins:mint/legacy_add {metal:"iron",item:"minecraft:iron_nugget",model:"iron_coin",color:14278631}
execute unless data storage minted_coins:tmp new_coin_names{diamond:""} run function minted_coins:mint/legacy_add {metal:"diamond",item:"minecraft:prismarine_crystals",model:"diamond_coin",color:4910553}
execute unless data storage minted_coins:tmp {new_name:""} run data modify storage minted_coins:tmp bank.name set value {text:""}
execute unless data storage minted_coins:tmp {new_name:""} run data modify storage minted_coins:tmp bank.name.text set from storage minted_coins:tmp new_name
execute unless data storage minted_coins:tmp new_coin_names{gold:""} run data modify storage minted_coins:tmp bank.gold_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{gold:""} run data modify storage minted_coins:tmp bank.gold_name.text set from storage minted_coins:tmp new_coin_names.gold
execute unless data storage minted_coins:tmp new_coin_names{copper:""} run data modify storage minted_coins:tmp bank.copper_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{copper:""} run data modify storage minted_coins:tmp bank.copper_name.text set from storage minted_coins:tmp new_coin_names.copper
execute unless data storage minted_coins:tmp new_coin_names{iron:""} run data modify storage minted_coins:tmp bank.iron_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{iron:""} run data modify storage minted_coins:tmp bank.iron_name.text set from storage minted_coins:tmp new_coin_names.iron
execute unless data storage minted_coins:tmp new_coin_names{diamond:""} run data modify storage minted_coins:tmp bank.diamond_name set value {text:""}
execute unless data storage minted_coins:tmp new_coin_names{diamond:""} run data modify storage minted_coins:tmp bank.diamond_name.text set from storage minted_coins:tmp new_coin_names.diamond
execute unless data storage minted_coins:tmp {new_small_name:""} run data modify storage minted_coins:tmp bank.small_name set value {translate:"item.minted_coins.small_coin.custom",fallback:""}
execute unless data storage minted_coins:tmp {new_small_name:""} run data modify storage minted_coins:tmp bank.small_name.fallback set from storage minted_coins:tmp new_small_name
# renamed small coins (new coin name or small coin name): the old names are kept in bank.legacy_small
function minted_coins:mint/small_names
function minted_coins:mint/legacy_small_add {metal:"gold",model:"gold_coin",color:16438858}
function minted_coins:mint/legacy_small_add {metal:"copper",model:"copper_coin",color:15170646}
function minted_coins:mint/legacy_small_add {metal:"iron",model:"iron_coin",color:14278631}
function minted_coins:mint/legacy_small_add {metal:"diamond",model:"diamond_coin",color:4910553}
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
function minted_coins:bank/update_entry with storage minted_coins:tmp bank
scoreboard players add $config_ver minted_coins.data 1
