# {key}: the stack minted_coins:tmp pentry joins the coins of this kind
scoreboard players set $sorted minted_coins.data 1
$execute store result score $have minted_coins.data run data get storage minted_coins:tmp purse.$(key)
execute store result score $got minted_coins.data run data get storage minted_coins:tmp pentry.count
scoreboard players operation $have minted_coins.data += $got minted_coins.data
scoreboard players operation $deposited minted_coins.data += $got minted_coins.data
$execute store result storage minted_coins:tmp purse.$(key) int 1 run scoreboard players get $have minted_coins.data
