# $action = 5GC, sent by the minted_coins:create dialog
scoreboard players operation $gold minted_coins.data = $action minted_coins.data
scoreboard players remove $gold minted_coins.data 500
scoreboard players operation $copper minted_coins.data = $gold minted_coins.data
scoreboard players operation $gold minted_coins.data /= $10 minted_coins.data
scoreboard players operation $copper minted_coins.data %= $10 minted_coins.data
execute unless score $gold minted_coins.data matches 1..9 run return run tellraw @s {text:"Coins per ingot must be between 1 and 9.",color:"red"}
execute unless score $copper minted_coins.data matches 1..9 run return run tellraw @s {text:"Coins per ingot must be between 1 and 9.",color:"red"}
function minted_coins:mint/create
