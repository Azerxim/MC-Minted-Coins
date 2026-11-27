# appends to minted_coins:tmp xnames the names of the banks of minted_coins:tmp xq that still exist, separated by ", "
execute unless data storage minted_coins:tmp xq[0] run return 0
data remove storage minted_coins:tmp other
data modify storage minted_coins:tmp args set value {}
data modify storage minted_coins:tmp args.id set from storage minted_coins:tmp xq[0]
function minted_coins:exchange/load_other with storage minted_coins:tmp args
execute if data storage minted_coins:tmp other if data storage minted_coins:tmp xnames[1] run data modify storage minted_coins:tmp xnames append value ", "
execute if data storage minted_coins:tmp other run data modify storage minted_coins:tmp xnames append from storage minted_coins:tmp other.name
data remove storage minted_coins:tmp xq[0]
function minted_coins:admin/exchange_families_next
