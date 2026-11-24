# with storage minted_coins:tmp mint: replaces the registry entry of this mint
$data modify storage minted_coins:registry mints[{id:$(id)}] set from storage minted_coins:tmp mint
