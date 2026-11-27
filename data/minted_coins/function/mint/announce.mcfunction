# as the admin, after minted_coins:mint/create
execute store result score $value minted_coins.data run data get storage minted_coins:tmp mint.bank
scoreboard players add $value minted_coins.data 600000
execute store result storage minted_coins:tmp args.page int 1 run scoreboard players get $value minted_coins.data
function minted_coins:mint/announce_text with storage minted_coins:tmp args
