# as a player: finds the purse in their hand (main hand first) and writes its slot in minted_coins:tmp purse_io.slot;
# fails without a purse
execute if items entity @s weapon.mainhand minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run return run data modify storage minted_coins:tmp purse_io set value {slot:"weapon.mainhand"}
execute if items entity @s weapon.offhand minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}}] run return run data modify storage minted_coins:tmp purse_io set value {slot:"weapon.offhand"}
return fail
