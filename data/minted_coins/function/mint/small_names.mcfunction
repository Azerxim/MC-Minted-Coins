# minted_coins:tmp small_names.<metal>: the names of the small coins of minted_coins:tmp bank, its small coin name
# (a pattern where %s is the coin name, "Small %s" by default) filled in with each of its coin names
data modify storage minted_coins:tmp small_names set value {}
execute unless data storage minted_coins:tmp bank.small_name run data modify storage minted_coins:tmp bank.small_name set value {translate:"item.minted_coins.small_coin",fallback:"Small %s"}
function minted_coins:mint/small_name {metal:"gold"}
function minted_coins:mint/small_name {metal:"copper"}
function minted_coins:mint/small_name {metal:"iron"}
function minted_coins:mint/small_name {metal:"diamond"}
