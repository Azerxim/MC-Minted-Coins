# writes minted_coins:tmp purse back into the purse in minted_coins:tmp purse_io.slot: its data, a lore listing its contents,
# its full / empty look, and empty bundle contents
data modify storage minted_coins:tmp purse_io.lore set value [{translate:"lore.minted_coins.purse_of",fallback:"Coins of %s",with:[],color:"gray",italic:false}]
data modify storage minted_coins:tmp purse_io.lore[0].with append from storage minted_coins:tmp purse.names.mint
data modify storage minted_coins:tmp purse_io.full set value 0b
execute unless data storage minted_coins:tmp purse{gold:0} run function minted_coins:purse/lore_line {key:"gold",metal:"gold",small:0}
execute unless data storage minted_coins:tmp purse{copper:0} run function minted_coins:purse/lore_line {key:"copper",metal:"copper",small:0}
execute unless data storage minted_coins:tmp purse{iron:0} run function minted_coins:purse/lore_line {key:"iron",metal:"iron",small:0}
execute unless data storage minted_coins:tmp purse{diamond:0} run function minted_coins:purse/lore_line {key:"diamond",metal:"diamond",small:0}
execute unless data storage minted_coins:tmp purse{small_gold:0} run function minted_coins:purse/lore_line {key:"small_gold",metal:"gold",small:1}
execute unless data storage minted_coins:tmp purse{small_copper:0} run function minted_coins:purse/lore_line {key:"small_copper",metal:"copper",small:1}
execute unless data storage minted_coins:tmp purse{small_iron:0} run function minted_coins:purse/lore_line {key:"small_iron",metal:"iron",small:1}
execute unless data storage minted_coins:tmp purse{small_diamond:0} run function minted_coins:purse/lore_line {key:"small_diamond",metal:"diamond",small:1}
data modify storage minted_coins:tmp purse_io.components set value {"minecraft:bundle_contents":[],"minecraft:custom_data":{minted_coins:{purse:{}}},"minecraft:lore":[],"minecraft:custom_model_data":{strings:["minted_coins:purse"],flags:[0b]}}
data modify storage minted_coins:tmp purse_io.components."minecraft:custom_data".minted_coins.purse set from storage minted_coins:tmp purse
data modify storage minted_coins:tmp purse_io.components."minecraft:lore" set from storage minted_coins:tmp purse_io.lore
data modify storage minted_coins:tmp purse_io.components."minecraft:custom_model_data".flags[0] set from storage minted_coins:tmp purse_io.full
function minted_coins:purse/save_item with storage minted_coins:tmp purse_io
