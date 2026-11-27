# as a mint that offers buyback (scores and storages of minted_coins:mint/trades): as many coins of its bank as the bank
# strikes per ingot (or per diamond) -> 1 ingot (or diamond), without loss; with buyback_all, the coins of every other bank too
data modify storage minted_coins:tmp melt_src set from storage minted_coins:tmp bank
function minted_coins:mint/melt_bank
execute if data storage minted_coins:tmp mint.trades{buyback_all:1b} run function minted_coins:mint/melt_all
