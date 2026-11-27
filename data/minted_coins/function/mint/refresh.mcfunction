# as a mint built from an older configuration than $config_ver (its bank or itself changed, or the data pack was loaded):
# rebuilds its name and trades from its registry entry and the one of its bank. Without them (removed), it goes away.
scoreboard players operation @s minted_coins.ver = $config_ver minted_coins.data
data remove storage minted_coins:tmp mint
data remove storage minted_coins:tmp bank
execute store result storage minted_coins:tmp args.id int 1 run scoreboard players get @s minted_coins.id
function minted_coins:mint/load_entry with storage minted_coins:tmp args
execute if data storage minted_coins:tmp mint run data modify storage minted_coins:tmp args.id set from storage minted_coins:tmp mint.bank
execute if data storage minted_coins:tmp mint run function minted_coins:bank/load_entry with storage minted_coins:tmp args
execute unless data storage minted_coins:tmp bank run function minted_coins:mint/vanish
execute if data storage minted_coins:tmp bank run function minted_coins:mint/build
