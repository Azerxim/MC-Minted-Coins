# {id}: $key = 1 when the player carries the key of shop id (in their inventory or off hand)
scoreboard players set $key minted_coins.data 0
$execute if items entity @s container.* *[minecraft:custom_data~{minted_coins:{key:$(id)}}] run scoreboard players set $key minted_coins.data 1
$execute if items entity @s weapon.offhand *[minecraft:custom_data~{minted_coins:{key:$(id)}}] run scoreboard players set $key minted_coins.data 1
