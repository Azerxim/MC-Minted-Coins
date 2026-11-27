# minted_coins:tmp families, for the exchange office minted_coins:tmp m: "exchange with <bank>, <bank>, fee N%"
data modify storage minted_coins:tmp xnames set value [{text:""}]
data modify storage minted_coins:tmp xq set from storage minted_coins:tmp m.partners
function minted_coins:admin/exchange_families_next
execute unless data storage minted_coins:tmp xnames[1] run data modify storage minted_coins:tmp xnames append value {translate:"chat.minted_coins.family.no_currency",fallback:"no other bank"}
data modify storage minted_coins:tmp families set value [{text:"",color:"yellow"},{translate:"chat.minted_coins.family.exchange",fallback:"exchange with %s, fee %s%%",with:[{text:""},{text:""}]}]
data modify storage minted_coins:tmp families[1].with[0] set from storage minted_coins:tmp xnames
data modify storage minted_coins:tmp families[1].with[1].text set string storage minted_coins:tmp m.fee
