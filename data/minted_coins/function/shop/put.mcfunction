# at the stock container: adds $amt items like minted_coins:tmp tpl. What doesn't fit (a full container) drops on top of it.
execute if score $amt minted_coins.data matches ..0 run return 0
function minted_coins:shop/count
scoreboard players operation $before minted_coins.data = $cnt minted_coins.data
data modify storage minted_coins:tmp args set value {components:{}}
data modify storage minted_coins:tmp args.id set from storage minted_coins:tmp tpl.id
data modify storage minted_coins:tmp args.components set from storage minted_coins:tmp tpl.components
execute store result storage minted_coins:tmp args.n int 1 run scoreboard players get $amt minted_coins.data
execute if data block ~ ~ ~ lock run function minted_coins:shop/put_loot with storage minted_coins:tmp args
function minted_coins:shop/count
scoreboard players operation $left minted_coins.data = $amt minted_coins.data
scoreboard players operation $left minted_coins.data -= $cnt minted_coins.data
scoreboard players operation $left minted_coins.data += $before minted_coins.data
execute if score $left minted_coins.data matches ..0 run return 0
execute store result storage minted_coins:tmp args.n int 1 run scoreboard players get $left minted_coins.data
function minted_coins:shop/drop_loot with storage minted_coins:tmp args
