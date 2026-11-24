# minted_coins:mint/rates: appends to minted_coins:tmp chain_text the names of the coins of minted_coins:tmp chain, separated by " → "
execute unless data storage minted_coins:tmp chain[0] run return 0
execute if data storage minted_coins:tmp chain_text[1] run data modify storage minted_coins:tmp chain_text append value {text:" → "}
data modify storage minted_coins:tmp link set value {}
data modify storage minted_coins:tmp link.metal set from storage minted_coins:tmp chain[0]
function minted_coins:mint/rates_name with storage minted_coins:tmp link
data remove storage minted_coins:tmp chain[0]
function minted_coins:mint/rates_chain
