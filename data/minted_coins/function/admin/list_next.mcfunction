execute unless data storage minted_coins:tmp queue[0] run return 0
data modify storage minted_coins:tmp entry set from storage minted_coins:tmp queue[0]
function minted_coins:admin/list_entry with storage minted_coins:tmp entry
data remove storage minted_coins:tmp queue[0]
function minted_coins:admin/list_next
