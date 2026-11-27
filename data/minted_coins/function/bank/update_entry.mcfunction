# with storage minted_coins:tmp bank: replaces the registry entry of this bank
$data modify storage minted_coins:registry banks[{id:$(id)}] set from storage minted_coins:tmp bank
