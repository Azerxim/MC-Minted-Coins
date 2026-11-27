# as a mint: adds the recoinage trades of minted_coins:tmp legacy_queue
execute unless data storage minted_coins:tmp legacy_queue[0] run return 0
data modify storage minted_coins:tmp legacy_cur set from storage minted_coins:tmp legacy_queue[0]
execute store result storage minted_coins:tmp legacy_cur.mint int 1 run scoreboard players get @s minted_coins.bank
execute if data storage minted_coins:tmp legacy_cur{metal:"gold"} run data modify storage minted_coins:tmp legacy_cur.new_name set from storage minted_coins:tmp bank.gold_name
execute if data storage minted_coins:tmp legacy_cur{metal:"copper"} run data modify storage minted_coins:tmp legacy_cur.new_name set from storage minted_coins:tmp bank.copper_name
execute if data storage minted_coins:tmp legacy_cur{metal:"iron"} run data modify storage minted_coins:tmp legacy_cur.new_name set from storage minted_coins:tmp bank.iron_name
execute if data storage minted_coins:tmp legacy_cur{metal:"diamond"} run data modify storage minted_coins:tmp legacy_cur.new_name set from storage minted_coins:tmp bank.diamond_name
function minted_coins:mint/legacy_trade with storage minted_coins:tmp legacy_cur
execute if data storage minted_coins:tmp legacy_cur{small:1} run function minted_coins:mint/legacy_small with storage minted_coins:tmp legacy_cur
data remove storage minted_coins:tmp legacy_queue[0]
function minted_coins:mint/legacy_next
