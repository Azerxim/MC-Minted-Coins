# writes minted_coins:tmp purse back into the purse in minted_coins:tmp purse_io.slot: its data, the coins its bundle shows,
# a lore with the totals (reserve + bundle) and its full / empty look
data modify storage minted_coins:tmp purse_io.lore set value [{translate:"lore.minted_coins.purse_of",fallback:"Coins of %s",with:[],color:"gray",italic:false}]
data modify storage minted_coins:tmp purse_io.lore[0].with append from storage minted_coins:tmp purse.names.mint
data modify storage minted_coins:tmp purse_io.full set value 0b
data modify storage minted_coins:tmp purse_io.components set value {"minecraft:bundle_contents":[],"minecraft:custom_data":{minted_coins:{purse:{}}},"minecraft:lore":[],"minecraft:custom_model_data":{strings:["minted_coins:purse"],flags:[0b]}}
function minted_coins:purse/kind {key:"gold",item:"minecraft:gold_nugget",model:"gold_coin",metal:"gold",color:0,small:0}
function minted_coins:purse/kind {key:"copper",item:"minecraft:copper_nugget",model:"copper_coin",metal:"copper",color:0,small:0}
function minted_coins:purse/kind {key:"iron",item:"minecraft:iron_nugget",model:"iron_coin",metal:"iron",color:0,small:0}
function minted_coins:purse/kind {key:"diamond",item:"minecraft:prismarine_crystals",model:"diamond_coin",metal:"diamond",color:0,small:0}
function minted_coins:purse/kind {key:"small_gold",item:"minecraft:firework_star",model:"small_gold_coin",metal:"gold",color:16438858,small:1}
function minted_coins:purse/kind {key:"small_copper",item:"minecraft:firework_star",model:"small_copper_coin",metal:"copper",color:15170646,small:1}
function minted_coins:purse/kind {key:"small_iron",item:"minecraft:firework_star",model:"small_iron_coin",metal:"iron",color:14278631,small:1}
function minted_coins:purse/kind {key:"small_diamond",item:"minecraft:firework_star",model:"small_diamond_coin",metal:"diamond",color:4910553,small:1}
data modify storage minted_coins:tmp purse_io.components."minecraft:custom_data".minted_coins.purse set from storage minted_coins:tmp purse
data modify storage minted_coins:tmp purse_io.components."minecraft:lore" set from storage minted_coins:tmp purse_io.lore
data modify storage minted_coins:tmp purse_io.components."minecraft:custom_model_data".flags[0] set from storage minted_coins:tmp purse_io.full
function minted_coins:purse/save_item with storage minted_coins:tmp purse_io
