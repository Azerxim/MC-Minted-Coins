# with storage minted_coins:tmp rates_of (a mint): minted_coins:tmp rates = "<coin name> ×N" for each coin the mint strikes
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
