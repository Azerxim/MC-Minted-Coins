# minted_coins:tmp partners (bank ids from the dialog, 0 for an unticked bank) keeps only the ids of other banks, once each;
# $target is the bank of the exchange office
data modify storage minted_coins:tmp xq set from storage minted_coins:tmp partners
data modify storage minted_coins:tmp partners set value []
function minted_coins:exchange/clean_next
