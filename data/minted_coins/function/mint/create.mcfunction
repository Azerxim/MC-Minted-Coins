# as and at the admin: summon a mint 2 blocks in front of them
tag @s add minted_coins.self
scoreboard players add $last_id minted_coins.data 1
execute positioned ^ ^ ^2 align xyz positioned ~0.5 ~ ~0.5 summon minecraft:wandering_trader run function minted_coins:mint/setup
tag @s remove minted_coins.self
function minted_coins:mint/announce with storage minted_coins:tmp mint
