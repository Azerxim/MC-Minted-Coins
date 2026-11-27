# $x coins of a bank striking $rf coins per ingot -> $y coins of a bank striking $rt per ingot, giving back $kn / $kd of the metal:
# the smallest trade (1 to 64 coins each way) that gives back exactly that, otherwise within 2 % of the metal given;
# never in the player's favour. Without one, the largest trade that fits in 64 coins.
scoreboard players set $x minted_coins.data 0
scoreboard players set $tol minted_coins.data 0
scoreboard players set $try minted_coins.data 0
function minted_coins:exchange/fit_next
execute if score $x minted_coins.data matches 1.. run return 1
scoreboard players set $tol minted_coins.data 2
scoreboard players set $try minted_coins.data 0
function minted_coins:exchange/fit_next
execute if score $x minted_coins.data matches 1.. run return 1
# fallback: as many ingots as 64 coins allow on both sides
scoreboard players operation $max minted_coins.data = $rf minted_coins.data
scoreboard players operation $max minted_coins.data > $rt minted_coins.data
scoreboard players set $k minted_coins.data 64
scoreboard players operation $k minted_coins.data /= $max minted_coins.data
scoreboard players operation $x minted_coins.data = $rf minted_coins.data
scoreboard players operation $x minted_coins.data *= $k minted_coins.data
scoreboard players operation $y minted_coins.data = $rt minted_coins.data
scoreboard players operation $y minted_coins.data *= $k minted_coins.data
scoreboard players operation $y minted_coins.data *= $kn minted_coins.data
scoreboard players operation $y minted_coins.data /= $kd minted_coins.data
execute if score $y minted_coins.data matches 65.. run scoreboard players set $y minted_coins.data 64
