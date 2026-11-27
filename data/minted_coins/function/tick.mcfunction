# /trigger minted_coins.mint.menu is open to every player; the dispatcher only serves the players authorized by /function minted_coins:mint/menu
scoreboard players enable @a minted_coins.mint.menu
execute as @a[scores={minted_coins.mint.menu=1..}] at @s run function minted_coins:admin/dispatch
# purses follow their bundle contents when the inventory changes (advancement minted_coins:purse_inventory);
# after a right click, once the bundle stopped dropping coins, the purse syncs and refills its bundle
scoreboard players remove @a[scores={minted_coins.purse_cd=1..}] minted_coins.purse_cd 1
execute as @a[scores={minted_coins.purse_cd=0}] at @s run function minted_coins:purse/inventory
scoreboard players reset @a[scores={minted_coins.purse_cd=0}] minted_coins.purse_cd
# counters whose mint was forgotten while they were not loaded, every 5 seconds
scoreboard players add $counter_timer minted_coins.data 1
execute if score $counter_timer minted_coins.data matches 100.. run execute as @e[type=minecraft:item_display,tag=minted_coins.counter] run function minted_coins:counter/check
execute if score $counter_timer minted_coins.data matches 100.. run scoreboard players set $counter_timer minted_coins.data 0
# mints keep only their own trades, whatever other mods or data packs add to wandering traders
execute as @e[type=minecraft:wandering_trader,tag=minted_coins.mint] run function minted_coins:mint/guard
# shops: the menu actions of their owners, and every second the stock of each loaded shop
scoreboard players enable @a minted_coins.shop
execute as @a[scores={minted_coins.shop=1..}] at @s run function minted_coins:shop/act
scoreboard players add $shop_timer minted_coins.data 1
execute if score $shop_timer minted_coins.data matches 20.. as @e[type=minecraft:villager,tag=minted_coins.shop] run function minted_coins:shop/check
execute if score $shop_timer minted_coins.data matches 20.. run scoreboard players set $shop_timer minted_coins.data 0
