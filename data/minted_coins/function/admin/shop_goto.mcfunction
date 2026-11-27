# $action = 1100000 + id: teleports the operator on top of the shop
scoreboard players operation $target minted_coins.data = $action minted_coins.data
scoreboard players remove $target minted_coins.data 1100000
data remove storage minted_coins:tmp shop
data modify storage minted_coins:tmp args set value {}
execute store result storage minted_coins:tmp args.id int 1 run scoreboard players get $target minted_coins.data
function minted_coins:shop/load with storage minted_coins:tmp args
execute unless data storage minted_coins:tmp shop run return run tellraw @s {translate:"chat.minted_coins.shop.unknown",fallback:"Unknown shop.",color:"red"}
function minted_coins:admin/shop_goto_at with storage minted_coins:tmp shop
