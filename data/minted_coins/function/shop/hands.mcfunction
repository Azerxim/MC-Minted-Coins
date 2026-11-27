# as a player: minted_coins:tmp hands {main, off} = the items in their hands (missing when empty)
data modify storage minted_coins:tmp hands set value {}
summon minecraft:item_display ~ ~ ~ {Tags:["minted_coins.reader"]}
item replace entity @e[type=minecraft:item_display,tag=minted_coins.reader,limit=1] contents from entity @s weapon.mainhand
data modify storage minted_coins:tmp hands.main set from entity @e[type=minecraft:item_display,tag=minted_coins.reader,limit=1] item
item replace entity @e[type=minecraft:item_display,tag=minted_coins.reader,limit=1] contents from entity @s weapon.offhand
data modify storage minted_coins:tmp hands.off set from entity @e[type=minecraft:item_display,tag=minted_coins.reader,limit=1] item
kill @e[type=minecraft:item_display,tag=minted_coins.reader]
