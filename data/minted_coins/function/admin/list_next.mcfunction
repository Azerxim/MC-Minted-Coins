execute unless data storage minted_coins:tmp queue[0] run return 0
data modify storage minted_coins:tmp entry set from storage minted_coins:tmp queue[0]
function minted_coins:admin/defaults
data modify storage minted_coins:tmp rates_of set from storage minted_coins:tmp entry
function minted_coins:mint/rates with storage minted_coins:tmp rates_of
function minted_coins:admin/join_rates
execute store result score $value minted_coins.data run data get storage minted_coins:tmp entry.id
scoreboard players add $value minted_coins.data 600000
execute store result storage minted_coins:tmp entry.page int 1 run scoreboard players get $value minted_coins.data
function minted_coins:admin/list_entry with storage minted_coins:tmp entry
data remove storage minted_coins:tmp queue[0]
function minted_coins:admin/list_next
