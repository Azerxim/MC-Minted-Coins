# as a mint that offers conversion (scores and storages of minted_coins:mint/trades): its conversion trades
# - recoinage: coins struck under former names (bank.legacy, bank.legacy_small) -> current coins, one for one
data modify storage minted_coins:tmp legacy_queue set value []
data modify storage minted_coins:tmp legacy_queue set from storage minted_coins:tmp bank.legacy
function minted_coins:mint/legacy_next
data modify storage minted_coins:tmp legacy_queue set value []
data modify storage minted_coins:tmp legacy_queue set from storage minted_coins:tmp bank.legacy_small
function minted_coins:mint/legacy_small_next
# - 64 coins of a rank <-> 1 coin of the next rank among the struck coins ($gold_rank…)
function minted_coins:mint/chain
function minted_coins:mint/convert_next
