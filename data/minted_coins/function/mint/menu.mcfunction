# entry point of the admin menu: /function minted_coins:mint/menu
# /function requires operator rights (permission level 2), so only operators can run it; it also authorizes the player
# for /trigger minted_coins.mint.menu from then on (until /function minted_coins:revoke).
# An operator can authorize another player with /execute as <player> run function minted_coins:mint/menu
execute unless entity @s[type=minecraft:player] run return fail
scoreboard players set @s minted_coins.op 1
dialog show @s minted_coins:menu
