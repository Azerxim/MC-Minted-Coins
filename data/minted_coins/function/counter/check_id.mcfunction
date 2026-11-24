# {id}: as a counter whose mint has this id
$execute unless data storage minted_coins:registry mints[{id:$(id)}] run kill @s
