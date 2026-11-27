# as the player, at the corner of the container they look at: checks it, then opens the shop on it
data modify storage minted_coins:tmp here set value {dim:"minecraft:overworld"}
data modify storage minted_coins:tmp here.dim set from entity @s Dimension
summon minecraft:marker ~ ~ ~ {Tags:["minted_coins.here"]}
execute store result storage minted_coins:tmp here.x int 1 run data get entity @e[type=minecraft:marker,tag=minted_coins.here,limit=1] Pos[0]
execute store result storage minted_coins:tmp here.y int 1 run data get entity @e[type=minecraft:marker,tag=minted_coins.here,limit=1] Pos[1]
execute store result storage minted_coins:tmp here.z int 1 run data get entity @e[type=minecraft:marker,tag=minted_coins.here,limit=1] Pos[2]
kill @e[type=minecraft:marker,tag=minted_coins.here]
execute if data block ~ ~ ~ lock run return run tellraw @s {translate:"chat.minted_coins.shop.locked",fallback:"This container is already locked, maybe by another shop.",color:"red"}
execute unless block ~ ~1 ~ #minecraft:air run return run tellraw @s {translate:"chat.minted_coins.shop.no_room",fallback:"The merchant needs 3 free blocks above the container.",color:"red"}
execute unless block ~ ~2 ~ #minecraft:air run return run tellraw @s {translate:"chat.minted_coins.shop.no_room",fallback:"The merchant needs 3 free blocks above the container.",color:"red"}
execute unless block ~ ~3 ~ #minecraft:air run return run tellraw @s {translate:"chat.minted_coins.shop.no_room",fallback:"The merchant needs 3 free blocks above the container.",color:"red"}
data remove storage minted_coins:tmp bank
data modify storage minted_coins:tmp args set value {}
execute store result storage minted_coins:tmp args.id int 1 run scoreboard players get @s minted_coins.licence
function minted_coins:bank/load_entry with storage minted_coins:tmp args
execute unless data storage minted_coins:tmp bank run return run tellraw @s {translate:"chat.minted_coins.shop.no_bank",fallback:"The bank that issued this licence no longer exists.",color:"red"}
function minted_coins:shop/open
