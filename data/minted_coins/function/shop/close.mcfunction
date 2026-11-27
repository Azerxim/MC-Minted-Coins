# as the key holder: the shop closes. Its pending trades are settled, the container is unlocked with everything in it,
# the merchant leaves with its sign, and the licence is handed back. The key is kept: it opens nothing any more.
scoreboard players operation $sel minted_coins.data = @s minted_coins.shop_sel
execute as @e[type=minecraft:villager,tag=minted_coins.shop] if score @s minted_coins.id = $sel minted_coins.data run function minted_coins:shop/settle
function minted_coins:shop/select
data modify storage minted_coins:tmp at set value {fn:"shop/unlock"}
data modify storage minted_coins:tmp at.dim set from storage minted_coins:tmp shop.dim
data modify storage minted_coins:tmp at.x set from storage minted_coins:tmp shop.x
data modify storage minted_coins:tmp at.y set from storage minted_coins:tmp shop.y
data modify storage minted_coins:tmp at.z set from storage minted_coins:tmp shop.z
function minted_coins:shop/at with storage minted_coins:tmp at
function minted_coins:shop/unregister with storage minted_coins:tmp shop
execute as @e[type=minecraft:villager,tag=minted_coins.shop] if score @s minted_coins.id = $sel minted_coins.data run function minted_coins:shop/vanish
execute store result score @s minted_coins.licence run data get storage minted_coins:tmp shop.bank
function minted_coins:shop/refund
tellraw @s {translate:"chat.minted_coins.shop.closed",fallback:"✔ Shop closed: %s. The container is unlocked and your licence is back.",color:"green",with:[{nbt:"shop.name",storage:"minted_coins:tmp",interpret:true,color:"gold"}]}
