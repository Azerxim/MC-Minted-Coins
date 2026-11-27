# $action = 1200000 + id (confirmed): removes the shop. Its container is unlocked if it is loaded (otherwise its key still
# opens it); its merchant goes away at its next check.
scoreboard players operation $target minted_coins.data = $action minted_coins.data
scoreboard players remove $target minted_coins.data 1200000
data remove storage minted_coins:tmp shop
data modify storage minted_coins:tmp args set value {}
execute store result storage minted_coins:tmp args.id int 1 run scoreboard players get $target minted_coins.data
function minted_coins:shop/load with storage minted_coins:tmp args
execute unless data storage minted_coins:tmp shop run return run tellraw @s {translate:"chat.minted_coins.shop.unknown",fallback:"Unknown shop.",color:"red"}
execute as @e[type=minecraft:villager,tag=minted_coins.shop] if score @s minted_coins.id = $target minted_coins.data run function minted_coins:shop/settle
data modify storage minted_coins:tmp at set value {fn:"shop/unlock"}
data modify storage minted_coins:tmp at.dim set from storage minted_coins:tmp shop.dim
data modify storage minted_coins:tmp at.x set from storage minted_coins:tmp shop.x
data modify storage minted_coins:tmp at.y set from storage minted_coins:tmp shop.y
data modify storage minted_coins:tmp at.z set from storage minted_coins:tmp shop.z
function minted_coins:shop/at with storage minted_coins:tmp at
function minted_coins:shop/unregister with storage minted_coins:tmp shop
tellraw @s {translate:"chat.minted_coins.shop.removed",fallback:"✔ Shop removed: %s",color:"green",with:[{nbt:"shop.name",storage:"minted_coins:tmp",interpret:true,color:"gold"}]}
execute store result score $target minted_coins.data run data get storage minted_coins:tmp shop.bank
function minted_coins:admin/bank_page
