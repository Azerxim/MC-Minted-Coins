# as a player using a shop licence (advancement minted_coins:shop_licence_using): remembers its bank in minted_coins.licence,
# for minted_coins:shop/use_licence once it is used up (the item is gone by then)
advancement revoke @s only minted_coins:shop_licence_using
summon minecraft:item_display ~ ~ ~ {Tags:["minted_coins.reader"]}
item replace entity @e[type=minecraft:item_display,tag=minted_coins.reader,limit=1] contents from entity @s weapon.mainhand
execute unless data entity @e[type=minecraft:item_display,tag=minted_coins.reader,limit=1] item.components."minecraft:custom_data".minted_coins.licence run item replace entity @e[type=minecraft:item_display,tag=minted_coins.reader,limit=1] contents from entity @s weapon.offhand
execute store result score @s minted_coins.licence run data get entity @e[type=minecraft:item_display,tag=minted_coins.reader,limit=1] item.components."minecraft:custom_data".minted_coins.licence
kill @e[type=minecraft:item_display,tag=minted_coins.reader]
