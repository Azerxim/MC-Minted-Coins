# {metal, name}: removes the former name of a coin from minted_coins:tmp bank.legacy
$data remove storage minted_coins:tmp bank.legacy[{metal:"$(metal)",name:$(name)}]
