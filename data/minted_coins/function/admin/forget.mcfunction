scoreboard players operation $target minted_coins.data = $action minted_coins.data
scoreboard players remove $target minted_coins.data 400000
execute store success score $ok minted_coins.data run function minted_coins:admin/select
execute unless score $ok minted_coins.data matches 1 run return fail
function minted_coins:admin/unregister with storage minted_coins:tmp entry
function minted_coins:counter/remove
tellraw @s {translate:"chat.minted_coins.forgotten",fallback:"✔ Mint forgotten: %s",color:"green",with:[{nbt:"entry.name",storage:"minted_coins:tmp",interpret:true,color:"gold"}]}
function minted_coins:admin/list
