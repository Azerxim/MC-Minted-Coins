# from the scores $gold / $copper / $iron / $diamond (coins per ingot, 0 = not struck) and $gold_rank… (conversion rank, 0 = none):
# minted_coins:tmp chain = the struck coins that have a rank, from the lowest rank to the highest (e.g. ["copper","iron","gold"])
data modify storage minted_coins:tmp chain set value []
scoreboard players operation $rank_gold minted_coins.data = $gold_rank minted_coins.data
scoreboard players operation $rank_copper minted_coins.data = $copper_rank minted_coins.data
scoreboard players operation $rank_iron minted_coins.data = $iron_rank minted_coins.data
scoreboard players operation $rank_diamond minted_coins.data = $diamond_rank minted_coins.data
execute if score $gold minted_coins.data matches 0 run scoreboard players set $rank_gold minted_coins.data 0
execute if score $copper minted_coins.data matches 0 run scoreboard players set $rank_copper minted_coins.data 0
execute if score $iron minted_coins.data matches 0 run scoreboard players set $rank_iron minted_coins.data 0
execute if score $diamond minted_coins.data matches 0 run scoreboard players set $rank_diamond minted_coins.data 0
scoreboard players set $rank minted_coins.data 0
function minted_coins:mint/chain_next
