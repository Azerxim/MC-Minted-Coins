# $x coins of a bank striking $rf coins per ingot -> $y coins of a bank striking $rt per ingot, giving back $keep % of the metal:
# the smallest trade (1 to 64 coins each way) whose rounding costs nothing more than the fee, otherwise at most 2 more points;
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
scoreboard players operation $y minted_coins.data *= $keep minted_coins.data
scoreboard players operation $y minted_coins.data /= $100 minted_coins.data
