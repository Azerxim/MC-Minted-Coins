# {metal, item, model}, as an exchange office, its bank in minted_coins:tmp bank, a partner bank in minted_coins:tmp other:
# when both strike this coin, one ingot is worth $ra coins of the bank and $rb coins of the partner. Each way, the trade gives
# back (100 - $fee) % of the metal given, rounded down (see minted_coins:exchange/fit)
$execute store result score $ra minted_coins.data run data get storage minted_coins:tmp bank.$(metal)
$execute store result score $rb minted_coins.data run data get storage minted_coins:tmp other.$(metal)
execute if score $ra minted_coins.data matches ..0 run return 0
execute if score $rb minted_coins.data matches ..0 run return 0
scoreboard players set $keep minted_coins.data 100
scoreboard players operation $keep minted_coins.data -= $fee minted_coins.data
# partner coins -> coins of the bank
scoreboard players operation $rf minted_coins.data = $rb minted_coins.data
scoreboard players operation $rt minted_coins.data = $ra minted_coins.data
function minted_coins:exchange/fit
$function minted_coins:exchange/trade {metal:"$(metal)",item:"$(item)",model:"$(model)",from:"other",to:"bank"}
# coins of the bank -> partner coins
scoreboard players operation $rf minted_coins.data = $ra minted_coins.data
scoreboard players operation $rt minted_coins.data = $rb minted_coins.data
function minted_coins:exchange/fit
$function minted_coins:exchange/trade {metal:"$(metal)",item:"$(item)",model:"$(model)",from:"bank",to:"other"}
