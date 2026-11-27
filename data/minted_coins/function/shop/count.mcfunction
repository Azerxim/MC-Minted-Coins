# at the stock container: $cnt = the number of items exactly like minted_coins:tmp tpl {id, components}
# (none when the block is no longer a locked container: its shop is closed)
scoreboard players set $cnt minted_coins.data 0
execute unless data block ~ ~ ~ lock run return 0
data modify storage minted_coins:tmp cq set value []
data modify storage minted_coins:tmp cq set from block ~ ~ ~ Items
function minted_coins:shop/count_next
