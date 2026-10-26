scoreboard objectives add minted_coins trigger
scoreboard objectives add minted_coins.data dummy
scoreboard objectives add minted_coins.id dummy
scoreboard players set $10 minted_coins.data 10
execute unless score $last_id minted_coins.data matches 0.. run scoreboard players set $last_id minted_coins.data 0
execute unless data storage minted_coins:registry mints run data modify storage minted_coins:registry mints set value []
