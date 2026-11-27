# minted_coins:admin/bank_page: appends the button of the first mint of minted_coins:tmp queue to the page, then the next ones
execute unless data storage minted_coins:tmp queue[0] run return 0
data modify storage minted_coins:tmp m set from storage minted_coins:tmp queue[0]
# trigger values: teleport, remove, edit, and the page of the bank to come back to
execute store result score $value minted_coins.data run data get storage minted_coins:tmp m.id
scoreboard players add $value minted_coins.data 100000
execute store result storage minted_coins:tmp m.goto int 1 run scoreboard players get $value minted_coins.data
scoreboard players add $value minted_coins.data 200000
execute store result storage minted_coins:tmp m.confirm int 1 run scoreboard players get $value minted_coins.data
scoreboard players add $value minted_coins.data 200000
execute store result storage minted_coins:tmp m.edit int 1 run scoreboard players get $value minted_coins.data
data modify storage minted_coins:tmp m.page set from storage minted_coins:tmp page.page
function minted_coins:admin/families
function minted_coins:admin/bank_page_mint with storage minted_coins:tmp m
data remove storage minted_coins:tmp queue[0]
function minted_coins:admin/bank_page_next
