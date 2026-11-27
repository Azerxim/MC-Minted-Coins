# {metal}: minted_coins:tmp small_names.<metal>, the small coin name of minted_coins:tmp bank with the name of this coin
$data modify storage minted_coins:tmp small_names.$(metal) set from storage minted_coins:tmp bank.small_name
$data modify storage minted_coins:tmp small_names.$(metal).with set value [""]
$data modify storage minted_coins:tmp small_names.$(metal).with[0] set from storage minted_coins:tmp bank.$(metal)_name
