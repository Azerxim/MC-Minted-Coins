# as a mint that converts the coins of every bank: the coins of each other bank -> ingots, at its rates
data modify storage minted_coins:tmp melt_queue set value []
data modify storage minted_coins:tmp melt_queue set from storage minted_coins:registry banks
function minted_coins:mint/melt_next
