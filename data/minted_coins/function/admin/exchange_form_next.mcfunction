# minted_coins:admin/exchange_form: a checkbox for the first bank of minted_coins:tmp xqueue (unless it is the bank of the office)
execute unless data storage minted_coins:tmp xqueue[0] run return 0
data modify storage minted_coins:tmp xb set value {d:"$"}
data modify storage minted_coins:tmp xb.id set from storage minted_coins:tmp xqueue[0].id
data modify storage minted_coins:tmp xb.acc set from storage minted_coins:tmp form.acc
execute store result score $xid minted_coins.data run data get storage minted_coins:tmp xb.id
execute unless score $xid minted_coins.data = $own minted_coins.data run function minted_coins:admin/exchange_form_bank with storage minted_coins:tmp xb
data remove storage minted_coins:tmp xqueue[0]
function minted_coins:admin/exchange_form_next
