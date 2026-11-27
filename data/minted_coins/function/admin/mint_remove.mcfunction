# $action = 300000 + id (confirmed): removes the mint from the registry; it goes away on the next tick, or when it is loaded.
# Coins it already struck belong to its bank and stay valid.
scoreboard players operation $target minted_coins.data = $action minted_coins.data
scoreboard players remove $target minted_coins.data 300000
execute store success score $ok minted_coins.data run function minted_coins:admin/select_mint
execute unless score $ok minted_coins.data matches 1 run return fail
function minted_coins:admin/mint_unregister with storage minted_coins:tmp entry
scoreboard players add $config_ver minted_coins.data 1
tellraw @s {translate:"chat.minted_coins.removed",fallback:"✔ Mint removed: %s",color:"green",with:[{nbt:"entry.name",storage:"minted_coins:tmp",interpret:true,color:"gold"}]}
execute store result score $target minted_coins.data run data get storage minted_coins:tmp entry.bank
function minted_coins:admin/bank_page
