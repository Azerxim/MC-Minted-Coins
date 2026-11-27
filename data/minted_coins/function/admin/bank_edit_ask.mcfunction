# $action = 700000 + id: shows the edit dialog of the bank, filled with its current names, rates, small change and conversion order
scoreboard players operation $target minted_coins.data = $action minted_coins.data
scoreboard players remove $target minted_coins.data 700000
execute store success score $ok minted_coins.data run function minted_coins:admin/select_bank
execute unless score $ok minted_coins.data matches 1 run return fail
function minted_coins:admin/defaults
# conversion order of mints created before it existed: the dialog suggests copper < iron < gold < diamond
execute unless data storage minted_coins:tmp entry.copper_rank run data modify storage minted_coins:tmp entry.copper_rank set value 1
execute unless data storage minted_coins:tmp entry.iron_rank run data modify storage minted_coins:tmp entry.iron_rank set value 2
execute unless data storage minted_coins:tmp entry.gold_rank run data modify storage minted_coins:tmp entry.gold_rank set value 3
execute unless data storage minted_coins:tmp entry.diamond_rank run data modify storage minted_coins:tmp entry.diamond_rank set value 4
# the dialog template writes $(d)(gold)…: with d = "$", it becomes the $(gold)… of the dialog inputs
data modify storage minted_coins:tmp entry.d set value "$"
scoreboard players operation $value minted_coins.data = $target minted_coins.data
scoreboard players add $value minted_coins.data 600000
execute store result storage minted_coins:tmp entry.page int 1 run scoreboard players get $value minted_coins.data
function minted_coins:admin/bank_edit_dialog with storage minted_coins:tmp entry
# current names in the text fields, when they are plain text (a styled or default name leaves the field empty: empty keeps it),
# and the small coin name when it was typed
data modify storage minted_coins:tmp show.dialog.inputs[0].initial set from storage minted_coins:tmp entry.name.text
execute unless data storage minted_coins:tmp entry.name{} run data modify storage minted_coins:tmp show.dialog.inputs[0].initial set from storage minted_coins:tmp entry.name
data modify storage minted_coins:tmp show.dialog.inputs[1].initial set from storage minted_coins:tmp entry.gold_name.text
execute unless data storage minted_coins:tmp entry.gold_name{} run data modify storage minted_coins:tmp show.dialog.inputs[1].initial set from storage minted_coins:tmp entry.gold_name
data modify storage minted_coins:tmp show.dialog.inputs[4].initial set from storage minted_coins:tmp entry.copper_name.text
execute unless data storage minted_coins:tmp entry.copper_name{} run data modify storage minted_coins:tmp show.dialog.inputs[4].initial set from storage minted_coins:tmp entry.copper_name
data modify storage minted_coins:tmp show.dialog.inputs[7].initial set from storage minted_coins:tmp entry.iron_name.text
execute unless data storage minted_coins:tmp entry.iron_name{} run data modify storage minted_coins:tmp show.dialog.inputs[7].initial set from storage minted_coins:tmp entry.iron_name
data modify storage minted_coins:tmp show.dialog.inputs[10].initial set from storage minted_coins:tmp entry.diamond_name.text
execute unless data storage minted_coins:tmp entry.diamond_name{} run data modify storage minted_coins:tmp show.dialog.inputs[10].initial set from storage minted_coins:tmp entry.diamond_name
execute if data storage minted_coins:tmp entry{small:1} run data modify storage minted_coins:tmp show.dialog.inputs[13].initial set value true
execute store result storage minted_coins:tmp show.dialog.inputs[15].initial float 1 run data get storage minted_coins:tmp entry.licence
data modify storage minted_coins:tmp show.dialog.inputs[16].options[0].initial set value false
function minted_coins:admin/bank_edit_metal with storage minted_coins:tmp entry
execute if data storage minted_coins:tmp entry.small_name{translate:"item.minted_coins.small_coin.custom"} run data modify storage minted_coins:tmp show.dialog.inputs[14].initial set from storage minted_coins:tmp entry.small_name.fallback
data modify storage minted_coins:tmp show.dialog.title[2].with append from storage minted_coins:tmp entry.name
function minted_coins:admin/show with storage minted_coins:tmp show
