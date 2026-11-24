# as a player whose inventory changed while they carry a purse (advancement minted_coins:purse_inventory):
# every purse follows what was put in it or taken out of it
advancement revoke @s only minted_coins:purse_inventory
# in creative mode, the client decides what the inventory holds and sends its own copy of each changed slot back:
# rewriting the purse would loop. There it stays a plain bundle; back in survival, its reserve takes in what it holds
execute if entity @s[gamemode=creative] run return 0
# while the purse is used (right click), the bundle empties itself: wait until it is over
execute if score @s minted_coins.purse_cd matches 1.. run return 0
execute if items entity @s container.0 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.0"}
execute if items entity @s container.1 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.1"}
execute if items entity @s container.2 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.2"}
execute if items entity @s container.3 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.3"}
execute if items entity @s container.4 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.4"}
execute if items entity @s container.5 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.5"}
execute if items entity @s container.6 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.6"}
execute if items entity @s container.7 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.7"}
execute if items entity @s container.8 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.8"}
execute if items entity @s container.9 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.9"}
execute if items entity @s container.10 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.10"}
execute if items entity @s container.11 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.11"}
execute if items entity @s container.12 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.12"}
execute if items entity @s container.13 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.13"}
execute if items entity @s container.14 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.14"}
execute if items entity @s container.15 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.15"}
execute if items entity @s container.16 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.16"}
execute if items entity @s container.17 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.17"}
execute if items entity @s container.18 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.18"}
execute if items entity @s container.19 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.19"}
execute if items entity @s container.20 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.20"}
execute if items entity @s container.21 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.21"}
execute if items entity @s container.22 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.22"}
execute if items entity @s container.23 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.23"}
execute if items entity @s container.24 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.24"}
execute if items entity @s container.25 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.25"}
execute if items entity @s container.26 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.26"}
execute if items entity @s container.27 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.27"}
execute if items entity @s container.28 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.28"}
execute if items entity @s container.29 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.29"}
execute if items entity @s container.30 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.30"}
execute if items entity @s container.31 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.31"}
execute if items entity @s container.32 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.32"}
execute if items entity @s container.33 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.33"}
execute if items entity @s container.34 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.34"}
execute if items entity @s container.35 minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"container.35"}
execute if items entity @s weapon.offhand minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"weapon.offhand"}
