# {mint}: counts the first stack of minted_coins:tmp purse_queue into minted_coins:tmp seen (or hands it back), then the next ones
execute unless data storage minted_coins:tmp purse_queue[0] run return 0
data modify storage minted_coins:tmp pentry set from storage minted_coins:tmp purse_queue[0]
scoreboard players set $sorted minted_coins.data 0
$execute if score $sorted minted_coins.data matches 0 if data storage minted_coins:tmp pentry{id:"minecraft:gold_nugget",components:{"minecraft:custom_data":{minted_coins:{mint:$(mint)}}}} run function minted_coins:purse/count {key:"gold"}
$execute if score $sorted minted_coins.data matches 0 if data storage minted_coins:tmp pentry{id:"minecraft:copper_nugget",components:{"minecraft:custom_data":{minted_coins:{mint:$(mint)}}}} run function minted_coins:purse/count {key:"copper"}
$execute if score $sorted minted_coins.data matches 0 if data storage minted_coins:tmp pentry{id:"minecraft:iron_nugget",components:{"minecraft:custom_data":{minted_coins:{mint:$(mint)}}}} run function minted_coins:purse/count {key:"iron"}
$execute if score $sorted minted_coins.data matches 0 if data storage minted_coins:tmp pentry{id:"minecraft:prismarine_crystals",components:{"minecraft:custom_data":{minted_coins:{mint:$(mint)}}}} run function minted_coins:purse/count {key:"diamond"}
$execute if score $sorted minted_coins.data matches 0 if data storage minted_coins:tmp pentry{id:"minecraft:firework_star",components:{"minecraft:custom_data":{minted_coins:{mint:$(mint)}},"minecraft:custom_model_data":{strings:["minted_coins:small_gold_coin"]}}} run function minted_coins:purse/count {key:"small_gold"}
$execute if score $sorted minted_coins.data matches 0 if data storage minted_coins:tmp pentry{id:"minecraft:firework_star",components:{"minecraft:custom_data":{minted_coins:{mint:$(mint)}},"minecraft:custom_model_data":{strings:["minted_coins:small_copper_coin"]}}} run function minted_coins:purse/count {key:"small_copper"}
$execute if score $sorted minted_coins.data matches 0 if data storage minted_coins:tmp pentry{id:"minecraft:firework_star",components:{"minecraft:custom_data":{minted_coins:{mint:$(mint)}},"minecraft:custom_model_data":{strings:["minted_coins:small_iron_coin"]}}} run function minted_coins:purse/count {key:"small_iron"}
$execute if score $sorted minted_coins.data matches 0 if data storage minted_coins:tmp pentry{id:"minecraft:firework_star",components:{"minecraft:custom_data":{minted_coins:{mint:$(mint)}},"minecraft:custom_model_data":{strings:["minted_coins:small_diamond_coin"]}}} run function minted_coins:purse/count {key:"small_diamond"}
execute if score $sorted minted_coins.data matches 0 run function minted_coins:purse/reject
data remove storage minted_coins:tmp purse_queue[0]
$function minted_coins:purse/sort_next {mint:$(mint)}
