# as a mint: adds the conversion trades between each coin of minted_coins:tmp chain and the next one
execute unless data storage minted_coins:tmp chain[1] run return 0
data modify storage minted_coins:tmp link set value {}
data modify storage minted_coins:tmp link.low set from storage minted_coins:tmp chain[0]
data modify storage minted_coins:tmp link.high set from storage minted_coins:tmp chain[1]
function minted_coins:mint/convert_link with storage minted_coins:tmp link
data remove storage minted_coins:tmp chain[0]
function minted_coins:mint/convert_next
