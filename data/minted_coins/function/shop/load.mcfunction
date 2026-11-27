# {id}: minted_coins:tmp shop = the registry entry of this shop (none if it doesn't exist)
$data modify storage minted_coins:tmp shop set from storage minted_coins:registry shops[{id:$(id)}]
