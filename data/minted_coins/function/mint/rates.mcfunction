# with storage minted_coins:tmp rates_of (a mint): minted_coins:tmp rates = "<coin name> ×N" for each coin the mint strikes,
# then small change and conversion order (uses the scores $gold… and $gold_rank…)
$data modify storage minted_coins:tmp rates set value [{translate:"%s ×%s",with:[{text:""},{text:"$(gold)"}]},{translate:"%s ×%s",with:[{text:""},{text:"$(copper)"}]},{translate:"%s ×%s",with:[{text:""},{text:"$(iron)"}]},{translate:"%s ×%s",with:[{text:""},{text:"$(diamond)"}]}]
data modify storage minted_coins:tmp rates[0].with[0] set from storage minted_coins:tmp rates_of.gold_name
data modify storage minted_coins:tmp rates[1].with[0] set from storage minted_coins:tmp rates_of.copper_name
data modify storage minted_coins:tmp rates[2].with[0] set from storage minted_coins:tmp rates_of.iron_name
data modify storage minted_coins:tmp rates[3].with[0] set from storage minted_coins:tmp rates_of.diamond_name
# last first, so the indexes stay valid
execute if data storage minted_coins:tmp rates_of{diamond:0} run data remove storage minted_coins:tmp rates[3]
execute if data storage minted_coins:tmp rates_of{iron:0} run data remove storage minted_coins:tmp rates[2]
execute if data storage minted_coins:tmp rates_of{copper:0} run data remove storage minted_coins:tmp rates[1]
execute if data storage minted_coins:tmp rates_of{gold:0} run data remove storage minted_coins:tmp rates[0]
# small change, after the coins
execute if data storage minted_coins:tmp rates_of{small:1} run data modify storage minted_coins:tmp rates append value {translate:"chat.minted_coins.small_change",fallback:"small change"}
# conversion order, after the coins: "conversion: Copper Coin → Iron Coin → Gold Coin" (64 coins = 1 coin of the next one)
execute store result score $gold minted_coins.data run data get storage minted_coins:tmp rates_of.gold
execute store result score $copper minted_coins.data run data get storage minted_coins:tmp rates_of.copper
execute store result score $iron minted_coins.data run data get storage minted_coins:tmp rates_of.iron
execute store result score $diamond minted_coins.data run data get storage minted_coins:tmp rates_of.diamond
execute store result score $gold_rank minted_coins.data run data get storage minted_coins:tmp rates_of.gold_rank
execute store result score $copper_rank minted_coins.data run data get storage minted_coins:tmp rates_of.copper_rank
execute store result score $iron_rank minted_coins.data run data get storage minted_coins:tmp rates_of.iron_rank
execute store result score $diamond_rank minted_coins.data run data get storage minted_coins:tmp rates_of.diamond_rank
function minted_coins:mint/chain
execute unless data storage minted_coins:tmp chain[1] run return 0
data modify storage minted_coins:tmp chain_text set value [{text:""}]
function minted_coins:mint/rates_chain
data modify storage minted_coins:tmp rates append value {translate:"chat.minted_coins.conversion",fallback:"conversion: %s",with:[]}
data modify storage minted_coins:tmp rates[-1].with append from storage minted_coins:tmp chain_text
