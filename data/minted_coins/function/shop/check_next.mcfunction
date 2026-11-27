# at the stock container: compares the stock of the first offer of minted_coins:tmp oq with what trade $i still allows
execute unless data storage minted_coins:tmp oq[0] run return 0
data modify storage minted_coins:tmp o set from storage minted_coins:tmp oq[0]
data modify storage minted_coins:tmp args set value {}
execute store result storage minted_coins:tmp args.i int 1 run scoreboard players get $i minted_coins.data
function minted_coins:shop/uses with storage minted_coins:tmp args
scoreboard players operation $max minted_coins.data -= $uses minted_coins.data
function minted_coins:shop/stock
execute if score $stock minted_coins.data < $max minted_coins.data run scoreboard players set $deficit minted_coins.data 1
execute if score $stock minted_coins.data > $max minted_coins.data run scoreboard players set $surplus minted_coins.data 1
scoreboard players add $i minted_coins.data 1
data remove storage minted_coins:tmp oq[0]
function minted_coins:shop/check_next
