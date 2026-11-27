# as a mint: adds the recoinage trades of the small coins in minted_coins:tmp legacy_queue (entries of mint.legacy_small)
execute unless data storage minted_coins:tmp legacy_queue[0] run return 0
data modify storage minted_coins:tmp legacy_cur set from storage minted_coins:tmp legacy_queue[0]
execute store result storage minted_coins:tmp legacy_cur.mint int 1 run scoreboard players get @s minted_coins.bank
function minted_coins:mint/legacy_small_trade with storage minted_coins:tmp legacy_cur
data remove storage minted_coins:tmp legacy_queue[0]
function minted_coins:mint/legacy_small_next
