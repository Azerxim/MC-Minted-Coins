# entry point of the admin menu: /function minted_coins:menu
# /function requires operator rights (permission level 2), so only operators can open the menu;
# an operator can also open it for another player with /execute as <player> run function minted_coins:menu
execute unless entity @s[type=minecraft:player] run return fail
function minted_coins:session/refresh
dialog show @s minted_coins:menu
