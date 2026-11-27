# $action = 500000 + id: shows the edit dialog of the mint, filled with its current name and trades
scoreboard players operation $target minted_coins.data = $action minted_coins.data
scoreboard players remove $target minted_coins.data 500000
execute store success score $ok minted_coins.data run function minted_coins:admin/select_mint
execute unless score $ok minted_coins.data matches 1 run return fail
execute if data storage minted_coins:tmp entry{kind:"exchange"} run function minted_coins:admin/exchange_edit_ask
execute if data storage minted_coins:tmp entry{kind:"exchange"} run return 0
data modify storage minted_coins:tmp form set value {d:"$"}
data modify storage minted_coins:tmp form.id set from storage minted_coins:tmp entry.id
function minted_coins:admin/mint_edit_form with storage minted_coins:tmp form
execute store result score $value minted_coins.data run data get storage minted_coins:tmp entry.bank
scoreboard players add $value minted_coins.data 600000
execute store result storage minted_coins:tmp form.page int 1 run scoreboard players get $value minted_coins.data
function minted_coins:admin/mint_form with storage minted_coins:tmp form
data modify storage minted_coins:tmp show.dialog.title[2] set value {translate:"dialog.minted_coins.edit.title",fallback:"Edit %s",with:[],color:"gold"}
data modify storage minted_coins:tmp show.dialog.title[2].with append from storage minted_coins:tmp entry.name
# current name when it is plain text (a styled name leaves the field empty: empty keeps it), current trades
data modify storage minted_coins:tmp show.dialog.inputs[0].initial set from storage minted_coins:tmp entry.name.text
execute unless data storage minted_coins:tmp entry.name{} run data modify storage minted_coins:tmp show.dialog.inputs[0].initial set from storage minted_coins:tmp entry.name
execute if data storage minted_coins:tmp entry.trades{strike:0b} run data modify storage minted_coins:tmp show.dialog.inputs[1].initial set value false
execute if data storage minted_coins:tmp entry.trades{small:0b} run data modify storage minted_coins:tmp show.dialog.inputs[2].initial set value false
execute if data storage minted_coins:tmp entry.trades{convert:0b} run data modify storage minted_coins:tmp show.dialog.inputs[3].initial set value false
execute if data storage minted_coins:tmp entry.trades{buyback:0b} run data modify storage minted_coins:tmp show.dialog.inputs[4].initial set value false
execute if data storage minted_coins:tmp entry.trades{buyback_all:1b} run data modify storage minted_coins:tmp show.dialog.inputs[5].initial set value true
execute if data storage minted_coins:tmp entry.trades{purse:0b} run data modify storage minted_coins:tmp show.dialog.inputs[6].initial set value false
execute unless data storage minted_coins:tmp entry.trades{licence:1b} run data modify storage minted_coins:tmp show.dialog.inputs[7].initial set value false
function minted_coins:admin/show with storage minted_coins:tmp show
