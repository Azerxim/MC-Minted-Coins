# the first stack of minted_coins:tmp cq matches: takes min(its count, $need) from it
execute store result score $k minted_coins.data run data get storage minted_coins:tmp cq[0].count
scoreboard players operation $k minted_coins.data < $need minted_coins.data
scoreboard players operation $need minted_coins.data -= $k minted_coins.data
data modify storage minted_coins:tmp args set value {}
execute store result storage minted_coins:tmp args.slot int 1 run data get storage minted_coins:tmp cq[0].Slot
execute store result storage minted_coins:tmp args.k int 1 run scoreboard players get $k minted_coins.data
function minted_coins:shop/take_modify with storage minted_coins:tmp args
