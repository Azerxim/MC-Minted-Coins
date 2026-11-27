# fills in minted_coins:tmp entry (a bank) the fields of mints of earlier versions, created before coin names / iron and diamond coins existed
execute unless data storage minted_coins:tmp entry.iron run data modify storage minted_coins:tmp entry.iron set value 0
execute unless data storage minted_coins:tmp entry.diamond run data modify storage minted_coins:tmp entry.diamond set value 0
execute unless data storage minted_coins:tmp entry.small run data modify storage minted_coins:tmp entry.small set value 0
execute unless data storage minted_coins:tmp entry.gold_name run data modify storage minted_coins:tmp entry.gold_name set value {translate:"item.minted_coins.gold_coin",fallback:"Gold Coin"}
execute unless data storage minted_coins:tmp entry.copper_name run data modify storage minted_coins:tmp entry.copper_name set value {translate:"item.minted_coins.copper_coin",fallback:"Copper Coin"}
execute unless data storage minted_coins:tmp entry.iron_name run data modify storage minted_coins:tmp entry.iron_name set value {translate:"item.minted_coins.iron_coin",fallback:"Iron Coin"}
execute unless data storage minted_coins:tmp entry.diamond_name run data modify storage minted_coins:tmp entry.diamond_name set value {translate:"item.minted_coins.diamond_coin",fallback:"Diamond Coin"}
execute unless data storage minted_coins:tmp entry.licence run data modify storage minted_coins:tmp entry.licence set value 0
execute unless data storage minted_coins:tmp entry.licence_metal run data modify storage minted_coins:tmp entry.licence_metal set value "gold"
execute unless data storage minted_coins:tmp entry.small_name run data modify storage minted_coins:tmp entry.small_name set value {translate:"item.minted_coins.small_coin",fallback:"Small %s"}
