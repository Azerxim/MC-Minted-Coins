# fills in minted_coins:tmp entry the fields of mints created before coin names / iron and diamond coins existed
execute unless data storage minted_coins:tmp entry.iron run data modify storage minted_coins:tmp entry.iron set value 0
execute unless data storage minted_coins:tmp entry.diamond run data modify storage minted_coins:tmp entry.diamond set value 0
execute unless data storage minted_coins:tmp entry.small run data modify storage minted_coins:tmp entry.small set value 0
execute unless data storage minted_coins:tmp entry.gold_name run data modify storage minted_coins:tmp entry.gold_name set value {translate:"item.minted_coins.gold_coin",fallback:"Gold Coin"}
execute unless data storage minted_coins:tmp entry.copper_name run data modify storage minted_coins:tmp entry.copper_name set value {translate:"item.minted_coins.copper_coin",fallback:"Copper Coin"}
execute unless data storage minted_coins:tmp entry.iron_name run data modify storage minted_coins:tmp entry.iron_name set value {translate:"item.minted_coins.iron_coin",fallback:"Iron Coin"}
execute unless data storage minted_coins:tmp entry.diamond_name run data modify storage minted_coins:tmp entry.diamond_name set value {translate:"item.minted_coins.diamond_coin",fallback:"Diamond Coin"}
# trigger value of the Edit… button
execute store result score $value minted_coins.data run data get storage minted_coins:tmp entry.id
scoreboard players add $value minted_coins.data 500000
execute store result storage minted_coins:tmp entry.edit int 1 run scoreboard players get $value minted_coins.data
