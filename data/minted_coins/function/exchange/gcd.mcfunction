# $ga = the greatest common divisor of $ga and $gb (Euclid)
execute if score $gb minted_coins.data matches 0 run return 0
scoreboard players operation $gt minted_coins.data = $ga minted_coins.data
scoreboard players operation $gt minted_coins.data %= $gb minted_coins.data
scoreboard players operation $ga minted_coins.data = $gb minted_coins.data
scoreboard players operation $gb minted_coins.data = $gt minted_coins.data
function minted_coins:exchange/gcd
