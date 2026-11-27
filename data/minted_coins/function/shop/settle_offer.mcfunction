# $delta trades of the offer minted_coins:tmp o were made: a sale takes the goods from the stock and puts the coins paid in it,
# a purchase takes the coins paid out and puts the goods received in it
scoreboard players set $moved minted_coins.data 1
execute store result score $q minted_coins.data run data get storage minted_coins:tmp o.qty
scoreboard players operation $q minted_coins.data *= $delta minted_coins.data
execute store result score $p minted_coins.data run data get storage minted_coins:tmp o.pcount
scoreboard players operation $p minted_coins.data *= $delta minted_coins.data
execute if data storage minted_coins:tmp o{mode:"sell"} run function minted_coins:shop/settle_sell
execute if data storage minted_coins:tmp o{mode:"buy"} run function minted_coins:shop/settle_buy
