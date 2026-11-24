# as the new mint replacing an edited one, at its place and rotation: same id ($target), trades from minted_coins:tmp mint
data merge entity @s {Tags:["minted_coins.mint"],NoAI:1b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,DespawnDelay:0,CustomNameVisible:1b}
tp @s ~ ~ ~ ~ ~
scoreboard players operation @s minted_coins.id = $target minted_coins.data
function minted_coins:mint/trades
