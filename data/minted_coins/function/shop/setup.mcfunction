# as the new shop villager (shop in minted_coins:tmp shop): its trades, then its sign and click box above it
function minted_coins:shop/villager
tp @s ~ ~ ~ ~ ~
scoreboard players operation @s minted_coins.id = $last_shop minted_coins.data
function minted_coins:shop/build
execute rotated ~ 0 positioned ~ ~2.15 ~ run summon minecraft:item_display ~ ~ ~ {Tags:["minted_coins.shop_part","minted_coins.shop_sign","minted_coins.new"],billboard:"fixed",item:{id:"minecraft:oak_hanging_sign",count:1,components:{"minecraft:custom_model_data":{strings:["minted_coins:shop_sign"]}}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.25f,0f],scale:[0.6f,0.6f,0.6f]}}
execute positioned ~ ~2.05 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["minted_coins.shop_part","minted_coins.shop_click","minted_coins.new"],width:0.6f,height:0.6f,response:1b}
data modify entity @e[type=minecraft:item_display,tag=minted_coins.new,limit=1] Rotation[0] set from entity @s Rotation[0]
scoreboard players operation @e[tag=minted_coins.new] minted_coins.id = $last_shop minted_coins.data
tag @e[tag=minted_coins.new] remove minted_coins.new
