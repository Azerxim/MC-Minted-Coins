# {id}: minted_coins:tmp bank = the registry entry of this bank (none if it doesn't exist)
$data modify storage minted_coins:tmp bank set from storage minted_coins:registry banks[{id:$(id)}]
