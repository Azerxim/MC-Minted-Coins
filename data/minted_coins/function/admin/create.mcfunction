# $action = 5GCID, sent by the minted_coins:create dialog: G gold / C copper / I iron / D diamond coins per ingot or diamond (0 = not struck)
scoreboard players operation $gold minted_coins.data = $action minted_coins.data
scoreboard players remove $gold minted_coins.data 50000
execute if score $gold minted_coins.data matches 0 run return run tellraw @s {text:"Choose at least one coin to strike.",color:"red"}
scoreboard players operation $copper minted_coins.data = $gold minted_coins.data
scoreboard players operation $iron minted_coins.data = $gold minted_coins.data
scoreboard players operation $diamond minted_coins.data = $gold minted_coins.data
scoreboard players operation $gold minted_coins.data /= $1000 minted_coins.data
scoreboard players operation $copper minted_coins.data /= $100 minted_coins.data
scoreboard players operation $copper minted_coins.data %= $10 minted_coins.data
scoreboard players operation $iron minted_coins.data /= $10 minted_coins.data
scoreboard players operation $iron minted_coins.data %= $10 minted_coins.data
scoreboard players operation $diamond minted_coins.data %= $10 minted_coins.data
function minted_coins:mint/create
