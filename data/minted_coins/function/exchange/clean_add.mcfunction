# {id}: appends this bank id to minted_coins:tmp partners, unless it is already there
$execute unless data storage minted_coins:tmp {partners:[$(id)]} run data modify storage minted_coins:tmp partners append value $(id)
