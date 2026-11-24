# {key}: the bundle shows at most $cap coins of this kind, the rest goes back to the reserve
$execute store result score $have minted_coins.data run data get storage minted_coins:tmp purse.$(key)
scoreboard players operation $show minted_coins.data = $have minted_coins.data
scoreboard players operation $show minted_coins.data < $cap minted_coins.data
scoreboard players operation $have minted_coins.data -= $show minted_coins.data
$execute store result storage minted_coins:tmp purse.$(key) int 1 run scoreboard players get $have minted_coins.data
$execute store result storage minted_coins:tmp purse.shown.$(key) int 1 run scoreboard players get $show minted_coins.data
