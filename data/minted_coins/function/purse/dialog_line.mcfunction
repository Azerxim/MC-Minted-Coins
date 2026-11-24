# {index, key, metal, item, model, small}: one kind of coin of the purse: a line in the body and an option of the coin choice
$function minted_coins:purse/coin_name {key:"$(key)",metal:"$(metal)",small:$(small)}
$data modify storage minted_coins:tmp show.dialog.body append value {type:"minecraft:item",item:{id:"$(item)",components:{"minecraft:custom_model_data":{strings:["minted_coins:$(model)"]}}},show_decorations:false,show_tooltip:false,description:{width:200,contents:{translate:"lore.minted_coins.purse_count",fallback:"%s × %s",with:[{text:""},{text:""}]}}}
data modify storage minted_coins:tmp show.dialog.body[-1].description.contents.with[0].text set from storage minted_coins:tmp coin.count
data modify storage minted_coins:tmp show.dialog.body[-1].description.contents.with[1] set from storage minted_coins:tmp coin.name
$data modify storage minted_coins:tmp show.dialog.inputs[0].options append value {id:"$(index)",display:{text:""}}
data modify storage minted_coins:tmp show.dialog.inputs[0].options[-1].display set from storage minted_coins:tmp coin.name
