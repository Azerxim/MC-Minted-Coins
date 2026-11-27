execute unless data storage minted_coins:tmp squeue[0] run return 0
data modify storage minted_coins:tmp m set from storage minted_coins:tmp squeue[0]
execute store result score $value minted_coins.data run data get storage minted_coins:tmp m.id
scoreboard players add $value minted_coins.data 1100000
execute store result storage minted_coins:tmp m.goto int 1 run scoreboard players get $value minted_coins.data
scoreboard players add $value minted_coins.data 100000
execute store result storage minted_coins:tmp m.confirm int 1 run scoreboard players get $value minted_coins.data
data modify storage minted_coins:tmp m.page set from storage minted_coins:tmp page.page
execute store result storage minted_coins:tmp m.offers_count int 1 if data storage minted_coins:tmp m.offers[]
function minted_coins:admin/bank_page_shop with storage minted_coins:tmp m
data remove storage minted_coins:tmp squeue[0]
function minted_coins:admin/bank_page_shop_next
