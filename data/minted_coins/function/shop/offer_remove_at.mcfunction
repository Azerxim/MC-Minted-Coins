# {i}: removes offer i (from 0) of minted_coins:tmp shop
$execute store success score $changed minted_coins.data run data remove storage minted_coins:tmp shop.offers[$(i)]
