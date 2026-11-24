execute unless data storage minted_coins:tmp join_queue[0] run return 0
execute if data storage minted_coins:tmp joined[1] run data modify storage minted_coins:tmp joined append value {text:" · ",color:"gray"}
data modify storage minted_coins:tmp joined append from storage minted_coins:tmp join_queue[0]
data remove storage minted_coins:tmp join_queue[0]
function minted_coins:admin/join_next
