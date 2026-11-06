execute unless data storage minted_coins:tmp queue[0] run return 0
data modify storage minted_coins:tmp entry set from storage minted_coins:tmp queue[0]
# mints created before coin names / iron and diamond coins existed
execute unless data storage minted_coins:tmp entry.iron run data modify storage minted_coins:tmp entry.iron set value 0
execute unless data storage minted_coins:tmp entry.diamond run data modify storage minted_coins:tmp entry.diamond set value 0
execute unless data storage minted_coins:tmp entry.small run data modify storage minted_coins:tmp entry.small set value 0
execute unless data storage minted_coins:tmp entry.gold_name run data modify storage minted_coins:tmp entry.gold_name set value {translate:"item.minted_coins.gold_coin",fallback:"Gold Coin"}
execute unless data storage minted_coins:tmp entry.copper_name run data modify storage minted_coins:tmp entry.copper_name set value {translate:"item.minted_coins.copper_coin",fallback:"Copper Coin"}
data modify storage minted_coins:tmp rates_of set from storage minted_coins:tmp entry
function minted_coins:mint/rates with storage minted_coins:tmp rates_of
function minted_coins:admin/list_entry with storage minted_coins:tmp entry
data remove storage minted_coins:tmp queue[0]
function minted_coins:admin/list_next
