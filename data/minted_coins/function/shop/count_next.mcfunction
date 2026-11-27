execute unless data storage minted_coins:tmp cq[0] run return 0
data modify storage minted_coins:tmp ce set from storage minted_coins:tmp cq[0]
data remove storage minted_coins:tmp ce.Slot
data remove storage minted_coins:tmp ce.count
execute store success score $diff minted_coins.data run data modify storage minted_coins:tmp ce set from storage minted_coins:tmp tpl
execute if score $diff minted_coins.data matches 0 store result score $n minted_coins.data run data get storage minted_coins:tmp cq[0].count
execute if score $diff minted_coins.data matches 0 run scoreboard players operation $cnt minted_coins.data += $n minted_coins.data
data remove storage minted_coins:tmp cq[0]
function minted_coins:shop/count_next
