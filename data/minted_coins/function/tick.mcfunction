# /trigger minted_coins.mint.menu is open to every player; the dispatcher only serves the players authorized by /function minted_coins:mint/menu
scoreboard players enable @a minted_coins.mint.menu
execute as @a[scores={minted_coins.mint.menu=1..}] at @s run function minted_coins:admin/dispatch
# mints keep only their own trades, whatever other mods or data packs add to wandering traders
execute as @e[type=minecraft:wandering_trader,tag=minted_coins.mint] run function minted_coins:mint/guard
