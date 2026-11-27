# minted_coins:admin/exchange_families, for an office with a fee in % (earlier development versions): 100 coins given → 100 - fee back
execute store result score $fee minted_coins.data run data get storage minted_coins:tmp m.fee
scoreboard players set $back minted_coins.data 100
scoreboard players operation $back minted_coins.data -= $fee minted_coins.data
execute store result storage minted_coins:tmp fee_back int 1 run scoreboard players get $back minted_coins.data
data modify storage minted_coins:tmp families[1].with[1].text set value "100"
data modify storage minted_coins:tmp families[1].with[2].text set string storage minted_coins:tmp fee_back
