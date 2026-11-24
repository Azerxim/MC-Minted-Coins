# as and at a mint: places its counter just in front of it (an item display, without hitbox: clicks reach the mint),
# facing the same way, instead of the one it may already have. Without the resource pack, it shows as a barrel.
scoreboard players operation $target minted_coins.data = @s minted_coins.id
function minted_coins:counter/remove
execute rotated as @s rotated ~ 0 positioned ^ ^ ^0.7 run summon minecraft:item_display ~ ~0.5 ~ {Tags:["minted_coins.counter","minted_coins.new"],item_display:"none",item:{id:"minecraft:barrel",count:1,components:{"minecraft:custom_model_data":{strings:["minted_coins:mint_counter"]}}}}
data modify entity @e[type=minecraft:item_display,tag=minted_coins.new,limit=1] Rotation[0] set from entity @s Rotation[0]
scoreboard players operation @e[type=minecraft:item_display,tag=minted_coins.new,limit=1] minted_coins.id = @s minted_coins.id
tag @e[type=minecraft:item_display,tag=minted_coins.new] remove minted_coins.new
