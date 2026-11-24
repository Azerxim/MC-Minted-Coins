# /trigger minted_coins.mint.menu is open to every player; the dispatcher only serves the players authorized by /function minted_coins:mint/menu
scoreboard players enable @a minted_coins.mint.menu
execute as @a[scores={minted_coins.mint.menu=1..}] at @s run function minted_coins:admin/dispatch
# purses: coins put in one like in a bundle join its contents; the withdraw buttons of its dialog are open to every player
# (right click with a purse: advancement minted_coins:purse_use)
execute as @a at @s if function minted_coins:purse/has_content run function minted_coins:purse/scan
scoreboard players remove @a[scores={minted_coins.purse_cd=1..}] minted_coins.purse_cd 1
scoreboard players enable @a minted_coins.purse
execute as @a[scores={minted_coins.purse=1..}] at @s run function minted_coins:purse/dispatch
# mints keep only their own trades, whatever other mods or data packs add to wandering traders
execute as @e[type=minecraft:wandering_trader,tag=minted_coins.mint] run function minted_coins:mint/guard
