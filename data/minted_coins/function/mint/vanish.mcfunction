# as a mint whose registry entry or bank was removed: goes away, with its counter
scoreboard players operation $target minted_coins.data = @s minted_coins.id
function minted_coins:counter/remove
execute at @s run function minted_coins:mint/destroy
