# with storage minted_coins:tmp entry (a mint): replaces its registry entry
$data modify storage minted_coins:registry mints[{id:$(id)}] set from storage minted_coins:tmp entry
