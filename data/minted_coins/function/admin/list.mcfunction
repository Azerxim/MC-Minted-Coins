tellraw @s ["\n ",{translate:"chat.minted_coins.list.title",fallback:"Minted Coins · mints",color:"gold",bold:true}]
execute unless data storage minted_coins:registry mints[0] run return run tellraw @s [" ",{translate:"chat.minted_coins.list.empty",fallback:"No mint yet: /function minted_coins:menu to create one.",color:"gray"}]
data modify storage minted_coins:tmp queue set from storage minted_coins:registry mints
function minted_coins:admin/list_next
