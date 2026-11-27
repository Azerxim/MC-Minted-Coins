# {mint} (the id of the bank, as coins carry it): minted_coins:tmp purse.names from the registry entry of the bank, as text components (compounds)
data remove storage minted_coins:tmp entry
$data modify storage minted_coins:tmp entry set from storage minted_coins:registry banks[{id:$(mint)}]
execute if data storage minted_coins:tmp entry run function minted_coins:admin/defaults
execute if data storage minted_coins:tmp entry run data modify storage minted_coins:tmp purse.names set value {}
execute if data storage minted_coins:tmp entry run data modify storage minted_coins:tmp purse.names.mint set from storage minted_coins:tmp entry.name
execute if data storage minted_coins:tmp entry run data modify storage minted_coins:tmp purse.names.gold set from storage minted_coins:tmp entry.gold_name
execute if data storage minted_coins:tmp entry run data modify storage minted_coins:tmp purse.names.copper set from storage minted_coins:tmp entry.copper_name
execute if data storage minted_coins:tmp entry run data modify storage minted_coins:tmp purse.names.iron set from storage minted_coins:tmp entry.iron_name
execute if data storage minted_coins:tmp entry run data modify storage minted_coins:tmp purse.names.diamond set from storage minted_coins:tmp entry.diamond_name
execute if data storage minted_coins:tmp entry run data modify storage minted_coins:tmp purse.names.small set from storage minted_coins:tmp entry.small_name
$execute unless data storage minted_coins:tmp purse.names.mint run data modify storage minted_coins:tmp purse.names.mint set value {translate:"name.minted_coins.default",fallback:"Mint #%s",with:[$(mint)]}
execute unless data storage minted_coins:tmp purse.names.gold run data modify storage minted_coins:tmp purse.names.gold set value {translate:"item.minted_coins.gold_coin",fallback:"Gold Coin"}
execute unless data storage minted_coins:tmp purse.names.copper run data modify storage minted_coins:tmp purse.names.copper set value {translate:"item.minted_coins.copper_coin",fallback:"Copper Coin"}
execute unless data storage minted_coins:tmp purse.names.iron run data modify storage minted_coins:tmp purse.names.iron set value {translate:"item.minted_coins.iron_coin",fallback:"Iron Coin"}
execute unless data storage minted_coins:tmp purse.names.diamond run data modify storage minted_coins:tmp purse.names.diamond set value {translate:"item.minted_coins.diamond_coin",fallback:"Diamond Coin"}
execute unless data storage minted_coins:tmp purse.names.small run data modify storage minted_coins:tmp purse.names.small set value {translate:"item.minted_coins.small_coin",fallback:"Small %s"}
# a plain string name becomes {text:...}, so that macros insert it as a component
execute unless data storage minted_coins:tmp purse.names.mint{} run function minted_coins:purse/wrap {key:"mint"}
execute unless data storage minted_coins:tmp purse.names.gold{} run function minted_coins:purse/wrap {key:"gold"}
execute unless data storage minted_coins:tmp purse.names.copper{} run function minted_coins:purse/wrap {key:"copper"}
execute unless data storage minted_coins:tmp purse.names.iron{} run function minted_coins:purse/wrap {key:"iron"}
execute unless data storage minted_coins:tmp purse.names.diamond{} run function minted_coins:purse/wrap {key:"diamond"}
