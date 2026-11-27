# $action = 800000 + id (confirmed): removes the bank and its mints from the registry; the mints go away on the next tick,
# or when they are loaded. Coins already struck keep their names, but no mint changes or buys them back any more.
scoreboard players operation $target minted_coins.data = $action minted_coins.data
scoreboard players remove $target minted_coins.data 800000
execute store success score $ok minted_coins.data run function minted_coins:admin/select_bank
execute unless score $ok minted_coins.data matches 1 run return fail
function minted_coins:admin/bank_unregister with storage minted_coins:tmp entry
scoreboard players add $config_ver minted_coins.data 1
tellraw @s {translate:"chat.minted_coins.bank_removed",fallback:"✔ Bank removed: %s",color:"green",with:[{nbt:"entry.name",storage:"minted_coins:tmp",interpret:true,color:"gold"}]}
function minted_coins:admin/list
