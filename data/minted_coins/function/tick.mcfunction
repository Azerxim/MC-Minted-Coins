# /trigger minted_coins only works during a menu session, opened by an operator with /function minted_coins:menu
execute as @a[scores={minted_coins=1..,minted_coins.session=1..}] at @s run function minted_coins:admin/dispatch
scoreboard players remove @a[scores={minted_coins.session=1..}] minted_coins.session 1
execute as @a[scores={minted_coins.session=..0}] run function minted_coins:session/close
execute as @a[scores={minted_coins.left=1..}] run function minted_coins:session/close
# mints keep only their own trades, whatever other mods or data packs add to wandering traders
execute as @e[type=minecraft:wandering_trader,tag=minted_coins.mint] run function minted_coins:mint/guard
