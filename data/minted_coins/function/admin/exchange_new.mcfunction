# $action = 1000000 + id: shows the new exchange office dialog of the bank
scoreboard players operation $target minted_coins.data = $action minted_coins.data
scoreboard players remove $target minted_coins.data 1000000
execute store success score $ok minted_coins.data run function minted_coins:admin/select_bank
execute unless score $ok minted_coins.data matches 1 run return fail
data modify storage minted_coins:tmp form set value {d:"$",acc:"0",sel:[],give:10,back:9,name:""}
data modify storage minted_coins:tmp form.own set from storage minted_coins:tmp entry.id
data modify storage minted_coins:tmp form.title set value {translate:"dialog.minted_coins.exchange_form.new_title",fallback:"New exchange office of %s",with:[],color:"gold"}
data modify storage minted_coins:tmp form.title.with append from storage minted_coins:tmp entry.name
data modify storage minted_coins:tmp form.confirm set value {translate:"dialog.minted_coins.exchange_form.create",fallback:"Create the exchange office",color:"green"}
function minted_coins:admin/exchange_new_cmd with storage minted_coins:tmp form
function minted_coins:admin/exchange_form
