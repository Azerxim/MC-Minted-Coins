# with the exchange office in minted_coins:tmp entry (minted_coins:admin/mint_edit_ask): shows its edit dialog,
# filled with its current name, fee and partner banks
data modify storage minted_coins:tmp form set value {d:"$",acc:"0",name:""}
data modify storage minted_coins:tmp form.own set from storage minted_coins:tmp entry.bank
data modify storage minted_coins:tmp form.sel set from storage minted_coins:tmp entry.partners
data modify storage minted_coins:tmp form.fee set from storage minted_coins:tmp entry.fee
data modify storage minted_coins:tmp form.name set from storage minted_coins:tmp entry.name.text
execute unless data storage minted_coins:tmp entry.name{} run data modify storage minted_coins:tmp form.name set from storage minted_coins:tmp entry.name
data modify storage minted_coins:tmp form.title set value {translate:"dialog.minted_coins.edit.title",fallback:"Edit %s",with:[],color:"gold"}
data modify storage minted_coins:tmp form.title.with append from storage minted_coins:tmp entry.name
data modify storage minted_coins:tmp form.confirm set value {translate:"dialog.minted_coins.mint_form.confirm",fallback:"Save",color:"green"}
function minted_coins:admin/exchange_edit_cmd with storage minted_coins:tmp entry
function minted_coins:admin/exchange_form
