# as the player, at the corner of the stock container (its position in minted_coins:tmp here, the bank of the licence in
# minted_coins:tmp bank): registers the shop, locks the container with its key, places the merchant, its sign and click box
scoreboard players set $placed minted_coins.data 1
scoreboard players add $last_shop minted_coins.data 1
data modify storage minted_coins:tmp shop set value {name:{translate:"name.minted_coins.default_shop",fallback:"Shop #%s",with:[0]},offers:[],ver:1}
execute store result storage minted_coins:tmp shop.name.with[0] int 1 run scoreboard players get $last_shop minted_coins.data
execute store result storage minted_coins:tmp shop.id int 1 run scoreboard players get $last_shop minted_coins.data
data modify storage minted_coins:tmp shop.bank set from storage minted_coins:tmp bank.id
data modify storage minted_coins:tmp shop.dim set from storage minted_coins:tmp here.dim
data modify storage minted_coins:tmp shop.x set from storage minted_coins:tmp here.x
data modify storage minted_coins:tmp shop.y set from storage minted_coins:tmp here.y
data modify storage minted_coins:tmp shop.z set from storage minted_coins:tmp here.z
data modify storage minted_coins:registry shops append from storage minted_coins:tmp shop
# the lock: only a player holding the key opens the container
function minted_coins:shop/lock with storage minted_coins:tmp shop
# the merchant stands on the container (a chest is lower than a barrel), facing the player; its sign floats above it
tag @s add minted_coins.self
execute if block ~ ~ ~ minecraft:barrel positioned ~0.5 ~1 ~0.5 facing entity @s feet rotated ~ 0 summon minecraft:villager run function minted_coins:shop/setup
execute unless block ~ ~ ~ minecraft:barrel positioned ~0.5 ~0.875 ~0.5 facing entity @s feet rotated ~ 0 summon minecraft:villager run function minted_coins:shop/setup
tag @s remove minted_coins.self
# the key
function minted_coins:shop/key_item
function minted_coins:shop/give with storage minted_coins:tmp key
tellraw @s ["",{translate:"chat.minted_coins.shop.opened",fallback:"✔ Shop opened. Keep its key: hold it to open the stock, and click the sign above the merchant to set its offers.",color:"green"}]
