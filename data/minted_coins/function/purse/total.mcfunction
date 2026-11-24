# {key}: <kind> becomes the total of this kind (reserve + bundle), and counts the kinds the purse holds
$execute store result score $have minted_coins.data run data get storage minted_coins:tmp purse.$(key)
$execute store result score $got minted_coins.data run data get storage minted_coins:tmp purse.shown.$(key)
scoreboard players operation $have minted_coins.data += $got minted_coins.data
$execute store result storage minted_coins:tmp purse.$(key) int 1 run scoreboard players get $have minted_coins.data
execute if score $have minted_coins.data matches 1.. run scoreboard players add $kinds minted_coins.data 1
