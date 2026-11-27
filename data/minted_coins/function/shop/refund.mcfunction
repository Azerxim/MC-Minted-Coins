# as a player whose licence was used up for nothing: hands it back (if its bank still exists)
data remove storage minted_coins:tmp bank
data modify storage minted_coins:tmp args set value {}
execute store result storage minted_coins:tmp args.id int 1 run scoreboard players get @s minted_coins.licence
function minted_coins:bank/load_entry with storage minted_coins:tmp args
execute unless data storage minted_coins:tmp bank run return 0
function minted_coins:shop/licence_item
function minted_coins:shop/give with storage minted_coins:tmp licence
