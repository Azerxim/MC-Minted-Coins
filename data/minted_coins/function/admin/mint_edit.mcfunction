# /function minted_coins:admin/mint_edit {id:N,name:"…",strike:S,small:S,convert:C,buyback:B,buyback_all:A,purse:P,licence:L}, sent by the edit dialog
# of a mint (operators only, like any /function): its name ("" keeps it) and the families of trades it accepts.
# The mint rebuilds its trades on the next tick, or when it is loaded.
execute unless entity @s[type=minecraft:player] run return fail
scoreboard players set @s minted_coins.op 1
$scoreboard players set $target minted_coins.data $(id)
execute store success score $ok minted_coins.data run function minted_coins:admin/select_mint
execute unless score $ok minted_coins.data matches 1 run return fail
$data modify storage minted_coins:tmp entry.trades set value {strike:$(strike)b,small:$(small)b,convert:$(convert)b,buyback:$(buyback)b,buyback_all:$(buyback_all)b,purse:$(purse)b,licence:$(licence)b}
$data modify storage minted_coins:tmp new_name set value "$(name)"
execute unless data storage minted_coins:tmp {new_name:""} run data modify storage minted_coins:tmp entry.name set value {text:""}
execute unless data storage minted_coins:tmp {new_name:""} run data modify storage minted_coins:tmp entry.name.text set from storage minted_coins:tmp new_name
function minted_coins:admin/mint_update with storage minted_coins:tmp entry
scoreboard players add $config_ver minted_coins.data 1
tellraw @s {translate:"chat.minted_coins.edited",fallback:"✔ Mint updated: %s",color:"green",with:[{nbt:"entry.name",storage:"minted_coins:tmp",interpret:true,color:"gold"}]}
execute store result score $target minted_coins.data run data get storage minted_coins:tmp entry.bank
function minted_coins:admin/bank_page
