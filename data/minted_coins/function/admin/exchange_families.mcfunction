# minted_coins:tmp families, for the exchange office minted_coins:tmp m: "exchange with <bank>, <bank>, 10 coins given → 9 back"
data modify storage minted_coins:tmp xnames set value [{text:""}]
data modify storage minted_coins:tmp xq set from storage minted_coins:tmp m.partners
function minted_coins:admin/exchange_families_next
execute unless data storage minted_coins:tmp xnames[1] run data modify storage minted_coins:tmp xnames append value {translate:"chat.minted_coins.family.no_currency",fallback:"no other bank"}
data modify storage minted_coins:tmp families set value [{text:"",color:"yellow"},{translate:"chat.minted_coins.family.exchange",fallback:"exchange with %s, %s coins given → %s back",with:[{text:""},{text:""},{text:""}]}]
data modify storage minted_coins:tmp families[1].with[0] set from storage minted_coins:tmp xnames
data modify storage minted_coins:tmp families[1].with[1].text set string storage minted_coins:tmp m.give
data modify storage minted_coins:tmp families[1].with[2].text set string storage minted_coins:tmp m.back
# offices of earlier development versions had a fee in %: 100 coins given → 100 - fee back
execute unless data storage minted_coins:tmp m.give run function minted_coins:admin/exchange_families_fee
