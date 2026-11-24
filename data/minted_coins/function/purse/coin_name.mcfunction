# {metal, small}: minted_coins:tmp coin.name, the name of this kind of coin
data modify storage minted_coins:tmp coin set value {name:{text:""}}
$execute if score $small_$(small) minted_coins.data matches 0 run data modify storage minted_coins:tmp coin.name set from storage minted_coins:tmp purse.names.$(metal)
$execute if score $small_$(small) minted_coins.data matches 1 run data modify storage minted_coins:tmp coin.name set value {translate:"item.minted_coins.small_coin",fallback:"Small %s",with:[{text:""}]}
$execute if score $small_$(small) minted_coins.data matches 1 run data modify storage minted_coins:tmp coin.name.with[0] set from storage minted_coins:tmp purse.names.$(metal)
