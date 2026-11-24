# as a player starting to use a purse: the purse in their hand puts every coin its bundle shows back in its reserve
scoreboard players set $stow minted_coins.data 1
execute if items entity @s weapon.mainhand minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"weapon.mainhand"}
execute if items entity @s weapon.offhand minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run function minted_coins:purse/sync {slot:"weapon.offhand"}
scoreboard players set $stow minted_coins.data 0
