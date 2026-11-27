# at the stock container, as the villager: settles the first offer of minted_coins:tmp oq (trade $i), then the next ones
execute unless data storage minted_coins:tmp oq[0] run return 0
data modify storage minted_coins:tmp o set from storage minted_coins:tmp oq[0]
data modify storage minted_coins:tmp args set value {}
execute store result storage minted_coins:tmp args.i int 1 run scoreboard players get $i minted_coins.data
function minted_coins:shop/uses with storage minted_coins:tmp args
execute store result score $done minted_coins.data run data get storage minted_coins:tmp o.done
scoreboard players operation $delta minted_coins.data = $uses minted_coins.data
scoreboard players operation $delta minted_coins.data -= $done minted_coins.data
execute if score $delta minted_coins.data matches 1.. run function minted_coins:shop/settle_offer
execute store result storage minted_coins:tmp o.done int 1 run scoreboard players get $uses minted_coins.data
data modify storage minted_coins:tmp shop.offers append from storage minted_coins:tmp o
scoreboard players add $i minted_coins.data 1
data remove storage minted_coins:tmp oq[0]
function minted_coins:shop/settle_next
