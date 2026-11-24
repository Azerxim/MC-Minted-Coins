# as a counter: removed when its mint left the registry (forgotten while the counter was not loaded)
execute store result storage minted_coins:tmp counter.id int 1 run scoreboard players get @s minted_coins.id
function minted_coins:counter/check_id with storage minted_coins:tmp counter
