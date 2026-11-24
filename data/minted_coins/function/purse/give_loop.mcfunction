# gives $amount coins described by minted_coins:tmp give, at most 6400 per /give
execute if score $amount minted_coins.data matches ..0 run return 0
scoreboard players operation $chunk minted_coins.data = $amount minted_coins.data
execute if score $chunk minted_coins.data matches 6401.. run scoreboard players set $chunk minted_coins.data 6400
execute store result storage minted_coins:tmp give.count int 1 run scoreboard players get $chunk minted_coins.data
execute if data storage minted_coins:tmp give{small:0} run function minted_coins:purse/give_coin with storage minted_coins:tmp give
execute if data storage minted_coins:tmp give{small:1} run function minted_coins:purse/give_small with storage minted_coins:tmp give
scoreboard players operation $amount minted_coins.data -= $chunk minted_coins.data
function minted_coins:purse/give_loop
