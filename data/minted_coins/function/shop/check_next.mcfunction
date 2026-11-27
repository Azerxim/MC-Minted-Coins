# at the stock container: trade $i (the first offer of minted_coins:tmp oq) gets as max uses its uses plus its stock,
# when that changed
execute unless data storage minted_coins:tmp oq[0] run return 0
data modify storage minted_coins:tmp o set from storage minted_coins:tmp oq[0]
data modify storage minted_coins:tmp args set value {}
execute store result storage minted_coins:tmp args.i int 1 run scoreboard players get $i minted_coins.data
function minted_coins:shop/uses with storage minted_coins:tmp args
function minted_coins:shop/stock
scoreboard players operation $stock minted_coins.data += $uses minted_coins.data
execute unless score $stock minted_coins.data = $max minted_coins.data run function minted_coins:shop/restock with storage minted_coins:tmp args
scoreboard players add $i minted_coins.data 1
data remove storage minted_coins:tmp oq[0]
function minted_coins:shop/check_next
