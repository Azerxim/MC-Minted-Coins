# with the exchange office in minted_coins:tmp entry (minted_coins:admin/mint_edit_ask): shows its edit dialog,
# filled with its current name, rate and partner banks
data modify storage minted_coins:tmp form set value {d:"$",acc:"0",name:""}
data modify storage minted_coins:tmp form.own set from storage minted_coins:tmp entry.bank
data modify storage minted_coins:tmp form.sel set from storage minted_coins:tmp entry.partners
data modify storage minted_coins:tmp form.give set from storage minted_coins:tmp entry.give
data modify storage minted_coins:tmp form.back set from storage minted_coins:tmp entry.back
# offices of earlier development versions had a fee in %: 10 coins given, 10 - fee/10 given back
execute unless data storage minted_coins:tmp entry.give run function minted_coins:exchange/fee_form
data modify storage minted_coins:tmp form.name set from storage minted_coins:tmp entry.name.text
execute unless data storage minted_coins:tmp entry.name{} run data modify storage minted_coins:tmp form.name set from storage minted_coins:tmp entry.name
data modify storage minted_coins:tmp form.title set value {translate:"dialog.minted_coins.edit.title",fallback:"Edit %s",with:[],color:"gold"}
data modify storage minted_coins:tmp form.title.with append from storage minted_coins:tmp entry.name
data modify storage minted_coins:tmp form.confirm set value {translate:"dialog.minted_coins.mint_form.confirm",fallback:"Save",color:"green"}
function minted_coins:admin/exchange_edit_cmd with storage minted_coins:tmp entry
function minted_coins:admin/exchange_form
