execute unless data storage minted_coins:tmp xq[0] run return 0
execute store result score $xid minted_coins.data run data get storage minted_coins:tmp xq[0]
data modify storage minted_coins:tmp args set value {}
data modify storage minted_coins:tmp args.id set from storage minted_coins:tmp xq[0]
execute if score $xid minted_coins.data matches 1.. unless score $xid minted_coins.data = $target minted_coins.data run function minted_coins:exchange/clean_add with storage minted_coins:tmp args
data remove storage minted_coins:tmp xq[0]
function minted_coins:exchange/clean_next
