# as a player: opens or extends their menu session, the only time /trigger minted_coins works for them
# (a trigger locks itself once used, so each action enables it again)
scoreboard players enable @s minted_coins
scoreboard players set @s minted_coins.session 6000
