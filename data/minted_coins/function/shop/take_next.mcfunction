execute if score $need minted_coins.data matches ..0 run return 0
execute unless data storage minted_coins:tmp cq[0] run return 0
data modify storage minted_coins:tmp ce set from storage minted_coins:tmp cq[0]
data remove storage minted_coins:tmp ce.Slot
data remove storage minted_coins:tmp ce.count
execute store success score $diff minted_coins.data run data modify storage minted_coins:tmp ce set from storage minted_coins:tmp tpl
execute if score $diff minted_coins.data matches 0 run function minted_coins:shop/take_slot
data remove storage minted_coins:tmp cq[0]
function minted_coins:shop/take_next
