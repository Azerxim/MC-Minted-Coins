# as a mint, with a bank entry in minted_coins:tmp melt_src: its coins -> ingots or diamonds, at its rates
# (names missing in banks of earlier versions: the default coin names)
execute unless data storage minted_coins:tmp melt_src.gold_name run data modify storage minted_coins:tmp melt_src.gold_name set value {translate:"item.minted_coins.gold_coin",fallback:"Gold Coin"}
execute unless data storage minted_coins:tmp melt_src.copper_name run data modify storage minted_coins:tmp melt_src.copper_name set value {translate:"item.minted_coins.copper_coin",fallback:"Copper Coin"}
execute unless data storage minted_coins:tmp melt_src.iron_name run data modify storage minted_coins:tmp melt_src.iron_name set value {translate:"item.minted_coins.iron_coin",fallback:"Iron Coin"}
execute unless data storage minted_coins:tmp melt_src.diamond_name run data modify storage minted_coins:tmp melt_src.diamond_name set value {translate:"item.minted_coins.diamond_coin",fallback:"Diamond Coin"}
function minted_coins:mint/melt {metal:"gold",item:"minecraft:gold_nugget",model:"gold_coin",ingot:"minecraft:gold_ingot"}
function minted_coins:mint/melt {metal:"copper",item:"minecraft:copper_nugget",model:"copper_coin",ingot:"minecraft:copper_ingot"}
function minted_coins:mint/melt {metal:"iron",item:"minecraft:iron_nugget",model:"iron_coin",ingot:"minecraft:iron_ingot"}
function minted_coins:mint/melt {metal:"diamond",item:"minecraft:prismarine_crystals",model:"diamond_coin",ingot:"minecraft:diamond"}
