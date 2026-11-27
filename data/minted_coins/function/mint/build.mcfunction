# as a mint, with its registry entry in minted_coins:tmp mint and the one of its bank in minted_coins:tmp bank:
# rebuilds its name and trades, then lets minted_coins:mint/guard count its own trades again
execute store result score @s minted_coins.bank run data get storage minted_coins:tmp mint.bank
execute store result score $gold minted_coins.data run data get storage minted_coins:tmp bank.gold
execute store result score $copper minted_coins.data run data get storage minted_coins:tmp bank.copper
execute store result score $iron minted_coins.data run data get storage minted_coins:tmp bank.iron
execute store result score $diamond minted_coins.data run data get storage minted_coins:tmp bank.diamond
execute store result score $small minted_coins.data run data get storage minted_coins:tmp bank.small
execute store result score $gold_rank minted_coins.data run data get storage minted_coins:tmp bank.gold_rank
execute store result score $copper_rank minted_coins.data run data get storage minted_coins:tmp bank.copper_rank
execute store result score $iron_rank minted_coins.data run data get storage minted_coins:tmp bank.iron_rank
execute store result score $diamond_rank minted_coins.data run data get storage minted_coins:tmp bank.diamond_rank
# a mint strikes and changes the coins of its bank; an exchange office changes them for those of other banks
execute unless data storage minted_coins:tmp mint{kind:"exchange"} run function minted_coins:mint/trades
execute if data storage minted_coins:tmp mint{kind:"exchange"} run function minted_coins:exchange/build
scoreboard players reset @s minted_coins.trades
