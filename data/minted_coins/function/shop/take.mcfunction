# at the stock container: removes $need items exactly like minted_coins:tmp tpl, from the first slots that hold some
execute unless data block ~ ~ ~ lock run return 0
data modify storage minted_coins:tmp cq set value []
data modify storage minted_coins:tmp cq set from block ~ ~ ~ Items
function minted_coins:shop/take_next
