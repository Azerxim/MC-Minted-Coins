# shows the page of bank $target: its rates, one button per mint (each opening the page of the mint),
# then New mint here…, New exchange office here…, Edit bank… and Remove bank…
execute store success score $ok minted_coins.data run function minted_coins:admin/select_bank
execute unless score $ok minted_coins.data matches 1 run return fail
function minted_coins:admin/defaults
data modify storage minted_coins:tmp rates_of set from storage minted_coins:tmp entry
function minted_coins:mint/rates with storage minted_coins:tmp rates_of
function minted_coins:admin/join_rates
# trigger values of the page and its buttons
data modify storage minted_coins:tmp page set value {}
data modify storage minted_coins:tmp page.id set from storage minted_coins:tmp entry.id
execute store result score $value minted_coins.data run data get storage minted_coins:tmp entry.id
scoreboard players add $value minted_coins.data 600000
execute store result storage minted_coins:tmp page.page int 1 run scoreboard players get $value minted_coins.data
scoreboard players add $value minted_coins.data 100000
execute store result storage minted_coins:tmp page.edit int 1 run scoreboard players get $value minted_coins.data
scoreboard players add $value minted_coins.data 100000
execute store result storage minted_coins:tmp page.remove int 1 run scoreboard players get $value minted_coins.data
scoreboard players add $value minted_coins.data 100000
execute store result storage minted_coins:tmp page.new int 1 run scoreboard players get $value minted_coins.data
scoreboard players add $value minted_coins.data 100000
execute store result storage minted_coins:tmp page.exchange int 1 run scoreboard players get $value minted_coins.data
function minted_coins:admin/bank_page_dialog with storage minted_coins:tmp page
data modify storage minted_coins:tmp list.title[2].with append from storage minted_coins:tmp entry.name
data modify storage minted_coins:tmp list.body[0].contents.with append from storage minted_coins:tmp joined
data modify storage minted_coins:tmp bank_actions[3].action.dialog.body.contents.with append from storage minted_coins:tmp entry.name
# the mints of the bank, before the bank buttons
function minted_coins:admin/bank_page_next
function minted_coins:admin/bank_page_shops with storage minted_coins:tmp page
data modify storage minted_coins:tmp list.actions append from storage minted_coins:tmp bank_actions[]
data modify storage minted_coins:tmp show.dialog set from storage minted_coins:tmp list
function minted_coins:admin/show with storage minted_coins:tmp show
