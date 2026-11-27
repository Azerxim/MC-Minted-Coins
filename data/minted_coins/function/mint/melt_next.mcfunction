# minted_coins:mint/melt_all: the first bank of minted_coins:tmp melt_queue (unless it is the bank of the mint), then the next ones
execute unless data storage minted_coins:tmp melt_queue[0] run return 0
data modify storage minted_coins:tmp melt_src set from storage minted_coins:tmp melt_queue[0]
execute store result score $melt_id minted_coins.data run data get storage minted_coins:tmp melt_src.id
execute unless score $melt_id minted_coins.data = @s minted_coins.bank run function minted_coins:mint/melt_bank
data remove storage minted_coins:tmp melt_queue[0]
function minted_coins:mint/melt_next
