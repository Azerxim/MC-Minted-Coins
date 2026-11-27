# as and at the admin, with the new mint in minted_coins:tmp mint {bank, name, trades} and its bank in minted_coins:tmp bank:
# summons the mint 2 blocks in front of them
tag @s add minted_coins.self
scoreboard players add $last_id minted_coins.data 1
execute rotated ~ 0 positioned ^ ^ ^2 align xz positioned ~0.5 ~ ~0.5 summon minecraft:wandering_trader run function minted_coins:mint/setup
tag @s remove minted_coins.self
function minted_coins:mint/announce
