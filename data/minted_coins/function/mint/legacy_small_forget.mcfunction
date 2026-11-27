# {metal, name}: removes a former small coin name from minted_coins:tmp bank.legacy_small
$data remove storage minted_coins:tmp bank.legacy_small[{metal:"$(metal)",name:$(name)}]
