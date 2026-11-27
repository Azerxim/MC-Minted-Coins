# as a shop villager (or its sign): minted_coins:tmp shop = its registry entry
data remove storage minted_coins:tmp shop
data modify storage minted_coins:tmp args set value {}
execute store result storage minted_coins:tmp args.id int 1 run scoreboard players get @s minted_coins.id
function minted_coins:shop/load with storage minted_coins:tmp args
