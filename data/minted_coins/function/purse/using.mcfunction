# as a player using a purse (right click, advancement minted_coins:purse_using): like a bundle, it would drop its coins one
# stack after another, and refill from its reserve each time. Instead, the coins it shows go back to its reserve at once,
# and it only shows coins again once the use is over (minted_coins:tick then syncs it)
advancement revoke @s only minted_coins:purse_using
execute if entity @s[gamemode=creative] run return 0
execute unless score @s minted_coins.purse_cd matches 1.. run function minted_coins:purse/stow
scoreboard players set @s minted_coins.purse_cd 5
