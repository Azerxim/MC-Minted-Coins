# {metal}: appends the name of this coin of minted_coins:tmp rates_of to minted_coins:tmp chain_text
$data modify storage minted_coins:tmp chain_text append from storage minted_coins:tmp rates_of.$(metal)_name
