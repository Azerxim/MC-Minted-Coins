scoreboard players operation $target minted_coins.data = $action minted_coins.data
scoreboard players remove $target minted_coins.data 300000
execute store success score $ok minted_coins.data run function minted_coins:admin/select
execute unless score $ok minted_coins.data matches 1 run return fail
scoreboard players set $found minted_coins.data 0
execute as @e[type=minecraft:wandering_trader,tag=minted_coins.mint] if score @s minted_coins.id = $target minted_coins.data at @s run function minted_coins:mint/destroy
execute if score $found minted_coins.data matches 0 run return run function minted_coins:admin/remove_unloaded with storage minted_coins:tmp entry
function minted_coins:admin/unregister with storage minted_coins:tmp entry
tellraw @s {translate:"chat.minted_coins.removed",fallback:"✔ Mint removed: %s",color:"green",with:[{nbt:"entry.name",storage:"minted_coins:tmp",interpret:true,color:"gold"}]}
function minted_coins:admin/list
