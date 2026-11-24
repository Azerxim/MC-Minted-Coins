# {metal, name}: removes the former name of a coin from minted_coins:tmp mint.legacy
$data remove storage minted_coins:tmp mint.legacy[{metal:"$(metal)",name:$(name)}]
