# minted_coins:mint/chain: appends the coins of the next rank ($rank + 1), up to rank 4
scoreboard players add $rank minted_coins.data 1
execute if score $rank minted_coins.data matches 5.. run return 0
execute if score $rank_copper minted_coins.data = $rank minted_coins.data run data modify storage minted_coins:tmp chain append value "copper"
execute if score $rank_iron minted_coins.data = $rank minted_coins.data run data modify storage minted_coins:tmp chain append value "iron"
execute if score $rank_gold minted_coins.data = $rank minted_coins.data run data modify storage minted_coins:tmp chain append value "gold"
execute if score $rank_diamond minted_coins.data = $rank minted_coins.data run data modify storage minted_coins:tmp chain append value "diamond"
function minted_coins:mint/chain_next
