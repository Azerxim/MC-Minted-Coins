# loads the registry entry of mint $target into minted_coins:tmp entry; fails if there is none
data remove storage minted_coins:tmp entry
execute store result storage minted_coins:tmp args.id int 1 run scoreboard players get $target minted_coins.data
function minted_coins:admin/select_mint_id with storage minted_coins:tmp args
execute unless data storage minted_coins:tmp entry run tellraw @s {translate:"chat.minted_coins.unknown",fallback:"Unknown mint.",color:"red"}
execute unless data storage minted_coins:tmp entry run return fail
return 1
