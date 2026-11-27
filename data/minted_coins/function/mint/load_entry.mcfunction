# {id}: minted_coins:tmp mint = the registry entry of this mint (none if it doesn't exist)
$data modify storage minted_coins:tmp mint set from storage minted_coins:registry mints[{id:$(id)}]
