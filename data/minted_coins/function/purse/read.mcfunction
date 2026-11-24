# {slot}: reads the purse in this slot of the player into minted_coins:tmp purse
# {mint, gold, copper, iron, diamond, small_gold, small_copper, small_iron, small_diamond, names:{mint, gold, copper, iron, diamond}},
# and what was just put in it (bundle contents) into minted_coins:tmp purse_contents.
# Any slot works, the cursor too: the purse is copied into a temporary item display to be read.
data remove storage minted_coins:tmp purse
data remove storage minted_coins:tmp purse_contents
summon minecraft:item_display ~ ~ ~ {Tags:["minted_coins.reader"]}
$item replace entity @e[type=minecraft:item_display,tag=minted_coins.reader,limit=1] contents from entity @s $(slot)
execute as @e[type=minecraft:item_display,tag=minted_coins.reader,limit=1] run function minted_coins:purse/read_display
kill @e[type=minecraft:item_display,tag=minted_coins.reader]
execute unless data storage minted_coins:tmp purse.gold run data modify storage minted_coins:tmp purse.gold set value 0
execute unless data storage minted_coins:tmp purse.copper run data modify storage minted_coins:tmp purse.copper set value 0
execute unless data storage minted_coins:tmp purse.iron run data modify storage minted_coins:tmp purse.iron set value 0
execute unless data storage minted_coins:tmp purse.diamond run data modify storage minted_coins:tmp purse.diamond set value 0
execute unless data storage minted_coins:tmp purse.small_gold run data modify storage minted_coins:tmp purse.small_gold set value 0
execute unless data storage minted_coins:tmp purse.small_copper run data modify storage minted_coins:tmp purse.small_copper set value 0
execute unless data storage minted_coins:tmp purse.small_iron run data modify storage minted_coins:tmp purse.small_iron set value 0
execute unless data storage minted_coins:tmp purse.small_diamond run data modify storage minted_coins:tmp purse.small_diamond set value 0
# names: from the registry while the mint exists (they follow its renamings), otherwise the last ones seen
function minted_coins:purse/names with storage minted_coins:tmp purse
