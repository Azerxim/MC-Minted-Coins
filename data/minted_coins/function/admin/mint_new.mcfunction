# $action = 900000 + id: shows the new mint dialog of the bank
scoreboard players operation $target minted_coins.data = $action minted_coins.data
scoreboard players remove $target minted_coins.data 900000
execute store success score $ok minted_coins.data run function minted_coins:admin/select_bank
execute unless score $ok minted_coins.data matches 1 run return fail
data modify storage minted_coins:tmp form set value {d:"$"}
data modify storage minted_coins:tmp form.id set from storage minted_coins:tmp entry.id
function minted_coins:admin/mint_new_form with storage minted_coins:tmp form
scoreboard players operation $value minted_coins.data = $target minted_coins.data
scoreboard players add $value minted_coins.data 600000
execute store result storage minted_coins:tmp form.page int 1 run scoreboard players get $value minted_coins.data
function minted_coins:admin/mint_form with storage minted_coins:tmp form
data modify storage minted_coins:tmp show.dialog.title[2] set value {translate:"dialog.minted_coins.mint_form.new_title",fallback:"New mint of %s",with:[],color:"gold"}
data modify storage minted_coins:tmp show.dialog.title[2].with append from storage minted_coins:tmp entry.name
data modify storage minted_coins:tmp show.dialog.actions[0].label set value {translate:"dialog.minted_coins.mint_form.create",fallback:"Create the mint",color:"green"}
function minted_coins:admin/show with storage minted_coins:tmp show
