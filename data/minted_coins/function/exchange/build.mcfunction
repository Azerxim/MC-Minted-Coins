# as an exchange office, with its registry entry in minted_coins:tmp mint {kind:"exchange", bank, name, fee, partners}
# and its bank in minted_coins:tmp bank: its trades change the coins of each partner bank for coins of its bank, and back,
# metal by metal, at metal parity minus its fee (see minted_coins:exchange/pair)
tag @s add minted_coins.exchange
data modify entity @s CustomName set from storage minted_coins:tmp mint.name
data modify entity @s Offers set value {Recipes:[]}
execute store result score $fee minted_coins.data run data get storage minted_coins:tmp mint.fee
data modify storage minted_coins:tmp xq set value []
data modify storage minted_coins:tmp xq set from storage minted_coins:tmp mint.partners
function minted_coins:exchange/partner_next
