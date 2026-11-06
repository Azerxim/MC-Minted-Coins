# $action = 5GCIDS, sent by the minted_coins:create dialog: G gold / C copper / I iron / D diamond coins per ingot or diamond (0 = not struck), S small change (1 = yes)
scoreboard players operation $gold minted_coins.data = $action minted_coins.data
scoreboard players remove $gold minted_coins.data 500000
execute if score $gold minted_coins.data matches ..9 run return run tellraw @s {translate:"chat.minted_coins.no_coin",fallback:"Choose at least one coin to strike.",color:"red"}
scoreboard players operation $copper minted_coins.data = $gold minted_coins.data
scoreboard players operation $iron minted_coins.data = $gold minted_coins.data
scoreboard players operation $diamond minted_coins.data = $gold minted_coins.data
scoreboard players operation $small minted_coins.data = $gold minted_coins.data
scoreboard players operation $gold minted_coins.data /= $10000 minted_coins.data
scoreboard players operation $copper minted_coins.data /= $1000 minted_coins.data
scoreboard players operation $copper minted_coins.data %= $10 minted_coins.data
scoreboard players operation $iron minted_coins.data /= $100 minted_coins.data
scoreboard players operation $iron minted_coins.data %= $10 minted_coins.data
scoreboard players operation $diamond minted_coins.data /= $10 minted_coins.data
scoreboard players operation $diamond minted_coins.data %= $10 minted_coins.data
scoreboard players operation $small minted_coins.data %= $10 minted_coins.data
function minted_coins:mint/create
