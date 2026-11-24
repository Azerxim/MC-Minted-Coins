# as the temporary item display holding a copy of the purse
data modify storage minted_coins:tmp purse set from entity @s item.components."minecraft:custom_data".minted_coins.purse
data modify storage minted_coins:tmp purse_contents set from entity @s item.components."minecraft:bundle_contents"
