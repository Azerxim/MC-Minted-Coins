# /execute as <player> run function minted_coins:revoke (operators only, like any /function):
# the player can no longer use /trigger minted_coins.mint.menu, until an operator runs /function minted_coins:mint/menu for them again
execute unless entity @s[type=minecraft:player] run return fail
scoreboard players reset @s minted_coins.op
tellraw @s {translate:"chat.minted_coins.revoked",fallback:"Your access to the Minted Coins menu has been removed.",color:"gold"}
