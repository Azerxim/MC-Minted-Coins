# as the new mint (id $last_id); the admin is tagged minted_coins.self; minted_coins:tmp mint {bank, name, trades}, minted_coins:tmp bank
data merge entity @s {Tags:["minted_coins.mint"],NoAI:1b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,DespawnDelay:0,CustomNameVisible:1b}
execute facing entity @e[tag=minted_coins.self,limit=1] feet run tp @s ~ ~ ~ ~ 0
scoreboard players operation @s minted_coins.id = $last_id minted_coins.data
scoreboard players operation @s minted_coins.ver = $config_ver minted_coins.data
function minted_coins:mint/build
# registry entry
execute store result storage minted_coins:tmp mint.id int 1 run scoreboard players get $last_id minted_coins.data
data modify storage minted_coins:tmp mint.dim set value "minecraft:overworld"
data modify storage minted_coins:tmp mint.dim set from entity @e[tag=minted_coins.self,limit=1] Dimension
data modify storage minted_coins:tmp mint.x set from entity @s Pos[0]
data modify storage minted_coins:tmp mint.y set from entity @s Pos[1]
data modify storage minted_coins:tmp mint.z set from entity @s Pos[2]
execute store result storage minted_coins:tmp mint.bx int 1 run data get entity @s Pos[0]
execute store result storage minted_coins:tmp mint.by int 1 run data get entity @s Pos[1]
execute store result storage minted_coins:tmp mint.bz int 1 run data get entity @s Pos[2]
data modify storage minted_coins:registry mints append from storage minted_coins:tmp mint
