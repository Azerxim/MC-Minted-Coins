# as an exchange office, with its registry entry in minted_coins:tmp mint {kind:"exchange", bank, name, give, back, partners}
# and its bank in minted_coins:tmp bank: its trades change the coins of each partner bank for coins of its bank, and back,
# metal by metal: for <give> coins, the metal of <back> coins (see minted_coins:exchange/pair)
tag @s add minted_coins.exchange
data modify entity @s CustomName set from storage minted_coins:tmp mint.name
data modify entity @s Offers set value {Recipes:[]}
# $kd coins given -> the metal of $kn coins; offices of earlier development versions had a fee in %: 100 -> 100 - fee
execute store result score $kd minted_coins.data run data get storage minted_coins:tmp mint.give
execute store result score $kn minted_coins.data run data get storage minted_coins:tmp mint.back
execute unless data storage minted_coins:tmp mint.give run function minted_coins:exchange/fee_rate
execute if score $kd minted_coins.data matches ..0 run scoreboard players set $kd minted_coins.data 1
execute if score $kn minted_coins.data matches ..0 run scoreboard players set $kn minted_coins.data 1
data modify storage minted_coins:tmp xq set value []
data modify storage minted_coins:tmp xq set from storage minted_coins:tmp mint.partners
function minted_coins:exchange/partner_next
