# as a player: minted_coins:tmp shop = their selected shop, $key = 1 when they carry its key; fails without a shop
data remove storage minted_coins:tmp shop
data modify storage minted_coins:tmp args set value {}
execute store result storage minted_coins:tmp args.id int 1 run scoreboard players get @s minted_coins.shop_sel
function minted_coins:shop/load with storage minted_coins:tmp args
execute unless data storage minted_coins:tmp shop run return fail
function minted_coins:shop/has_key with storage minted_coins:tmp args
return 1
