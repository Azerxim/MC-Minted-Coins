# only players tagged minted_coins.admin may use /trigger minted_coins
scoreboard players enable @a[tag=minted_coins.admin] minted_coins
scoreboard players reset @a[tag=!minted_coins.admin] minted_coins
execute as @a[tag=minted_coins.admin,scores={minted_coins=1..}] at @s run function minted_coins:admin/dispatch
