tellraw @s {text:"\n Minted Coins · mints",color:"gold",bold:true}
execute unless data storage minted_coins:registry mints[0] run return run tellraw @s {text:" No mint yet: /trigger minted_coins to create one.",color:"gray"}
data modify storage minted_coins:tmp queue set from storage minted_coins:registry mints
function minted_coins:admin/list_next
