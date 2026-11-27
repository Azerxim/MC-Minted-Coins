# /function minted_coins:admin/exchange_edit {id:N,name:"…",fee:F,partners:[0,…]}, sent by the edit dialog of an exchange office
# (operators only, like any /function): its name ("" keeps it), fee and partner banks. It rebuilds its trades on the next tick.
execute unless entity @s[type=minecraft:player] run return fail
scoreboard players set @s minted_coins.op 1
$scoreboard players set $target minted_coins.data $(id)
execute store success score $ok minted_coins.data run function minted_coins:admin/select_mint
execute unless score $ok minted_coins.data matches 1 run return fail
execute store result score $target minted_coins.data run data get storage minted_coins:tmp entry.bank
$data modify storage minted_coins:tmp partners set value $(partners)
function minted_coins:exchange/clean
data modify storage minted_coins:tmp entry.partners set from storage minted_coins:tmp partners
$data modify storage minted_coins:tmp entry.fee set value $(fee)
$data modify storage minted_coins:tmp new_name set value "$(name)"
execute unless data storage minted_coins:tmp {new_name:""} run data modify storage minted_coins:tmp entry.name set value {text:""}
execute unless data storage minted_coins:tmp {new_name:""} run data modify storage minted_coins:tmp entry.name.text set from storage minted_coins:tmp new_name
function minted_coins:admin/mint_update with storage minted_coins:tmp entry
scoreboard players add $config_ver minted_coins.data 1
tellraw @s {translate:"chat.minted_coins.exchange_edited",fallback:"✔ Exchange office updated: %s",color:"green",with:[{nbt:"entry.name",storage:"minted_coins:tmp",interpret:true,color:"gold"}]}
function minted_coins:admin/bank_page
