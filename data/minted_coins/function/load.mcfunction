# the trigger was named minted_coins, then minted_coins.menu, before
scoreboard objectives remove minted_coins
scoreboard objectives remove minted_coins.menu
scoreboard objectives add minted_coins.mint.menu trigger
scoreboard objectives add minted_coins.data dummy
scoreboard objectives add minted_coins.id dummy
scoreboard objectives add minted_coins.trades dummy
# players authorized by /function minted_coins:mint/menu
scoreboard objectives add minted_coins.op dummy
# menu sessions of earlier development versions
scoreboard objectives remove minted_coins.session
scoreboard objectives remove minted_coins.left
scoreboard players reset * minted_coins.mint.menu
scoreboard players set $10 minted_coins.data 10
scoreboard players set $100 minted_coins.data 100
scoreboard players set $1000 minted_coins.data 1000
scoreboard players set $10000 minted_coins.data 10000
execute unless score $last_id minted_coins.data matches 0.. run scoreboard players set $last_id minted_coins.data 0
execute unless data storage minted_coins:registry mints run data modify storage minted_coins:registry mints set value []
