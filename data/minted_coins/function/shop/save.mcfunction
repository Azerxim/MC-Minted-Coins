# with storage minted_coins:tmp shop: replaces its registry entry
$data modify storage minted_coins:registry shops[{id:$(id)}] set from storage minted_coins:tmp shop
