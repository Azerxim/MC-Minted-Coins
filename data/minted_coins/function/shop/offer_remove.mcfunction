# $act = 100 + n: removes offer n
scoreboard players set $changed minted_coins.data 0
scoreboard players operation $n minted_coins.data = $act minted_coins.data
scoreboard players remove $n minted_coins.data 101
data modify storage minted_coins:tmp args set value {}
execute store result storage minted_coins:tmp args.i int 1 run scoreboard players get $n minted_coins.data
function minted_coins:shop/offer_remove_at with storage minted_coins:tmp args
