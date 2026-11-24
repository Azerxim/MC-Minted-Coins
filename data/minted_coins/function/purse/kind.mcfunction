# {key, item, model, metal, color, small}: one kind of coin of the purse: its stack in the bundle and its line in the lore
$execute store result score $show minted_coins.data run data get storage minted_coins:tmp purse.shown.$(key)
$execute store result score $have minted_coins.data run data get storage minted_coins:tmp purse.$(key)
scoreboard players operation $have minted_coins.data += $show minted_coins.data
execute if score $have minted_coins.data matches ..0 run return 0
data modify storage minted_coins:tmp purse_io.full set value 1b
$function minted_coins:purse/coin_name {metal:"$(metal)",small:$(small)}
# lore: <total> × <coin name>
data modify storage minted_coins:tmp line set value {translate:"lore.minted_coins.purse_count",fallback:"%s × %s",with:[{text:""},{text:""}],color:"yellow",italic:false}
execute store result storage minted_coins:tmp total int 1 run scoreboard players get $have minted_coins.data
data modify storage minted_coins:tmp line.with[0].text set string storage minted_coins:tmp total
data modify storage minted_coins:tmp line.with[1] set from storage minted_coins:tmp coin.name
data modify storage minted_coins:tmp purse_io.lore append from storage minted_coins:tmp line
# bundle: the coins it shows, exactly like the ones the mint strikes, so that they stack with them
execute if score $show minted_coins.data matches ..0 run return 0
$data modify storage minted_coins:tmp stack set value {id:"$(item)",count:1,components:{"minecraft:item_name":{text:""},"minecraft:lore":[{translate:"lore.minted_coins.struck_by",fallback:"Struck by %s",with:[{text:""}],color:"gray",italic:false}],"minecraft:custom_data":{minted_coins:{mint:0}},"minecraft:custom_model_data":{strings:["minted_coins:$(model)"]}}}
$execute if score $small_$(small) minted_coins.data matches 1 run data modify storage minted_coins:tmp stack.components merge value {"minecraft:firework_explosion":{shape:"small_ball",colors:[I;$(color)]},"minecraft:tooltip_display":{hidden_components:["minecraft:firework_explosion"]}}
execute store result storage minted_coins:tmp stack.count int 1 run scoreboard players get $show minted_coins.data
data modify storage minted_coins:tmp stack.components."minecraft:item_name" set from storage minted_coins:tmp coin.name
data modify storage minted_coins:tmp stack.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp purse.names.mint
data modify storage minted_coins:tmp stack.components."minecraft:custom_data".minted_coins.mint set from storage minted_coins:tmp purse.mint
data modify storage minted_coins:tmp purse_io.components."minecraft:bundle_contents" append from storage minted_coins:tmp stack
