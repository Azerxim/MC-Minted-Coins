execute unless data storage minted_coins:tmp oq[0] run return 0
data modify storage minted_coins:tmp o set from storage minted_coins:tmp oq[0]
scoreboard players add $i minted_coins.data 1
function minted_coins:shop/stock
data modify storage minted_coins:tmp line set value {type:"minecraft:item",item:{id:"minecraft:stone"},show_decorations:true,description:{width:220,contents:{translate:"",fallback:"",with:[{text:""},{text:""},{text:""},{text:""}]}}}
data modify storage minted_coins:tmp line.item set from storage minted_coins:tmp o.goods
data modify storage minted_coins:tmp line.item.count set from storage minted_coins:tmp o.qty
execute store result storage minted_coins:tmp line.description.contents.with[0].text int 1 run scoreboard players get $i minted_coins.data
data modify storage minted_coins:tmp line.description.contents.with[0].text set string storage minted_coins:tmp line.description.contents.with[0].text
data modify storage minted_coins:tmp line.description.contents.with[1].text set string storage minted_coins:tmp o.pcount
data modify storage minted_coins:tmp line.description.contents.with[2] set from storage minted_coins:tmp o.price.components."minecraft:item_name"
execute store result storage minted_coins:tmp line.description.contents.with[3].text int 1 run scoreboard players get $stock minted_coins.data
data modify storage minted_coins:tmp line.description.contents.with[3].text set string storage minted_coins:tmp line.description.contents.with[3].text
execute if data storage minted_coins:tmp o{mode:"sell"} run data modify storage minted_coins:tmp line.description.contents merge value {translate:"dialog.minted_coins.shop.offer_sell",fallback:"%s. Sells for %s × %s (stock: %s trades)"}
execute if data storage minted_coins:tmp o{mode:"buy"} run data modify storage minted_coins:tmp line.description.contents merge value {translate:"dialog.minted_coins.shop.offer_buy",fallback:"%s. Buys for %s × %s (coins for %s trades)"}
data modify storage minted_coins:tmp list.body append from storage minted_coins:tmp line
data modify storage minted_coins:tmp args set value {}
execute store result storage minted_coins:tmp args.n int 1 run scoreboard players get $i minted_coins.data
scoreboard players operation $value minted_coins.data = $i minted_coins.data
scoreboard players add $value minted_coins.data 100
execute store result storage minted_coins:tmp args.v int 1 run scoreboard players get $value minted_coins.data
function minted_coins:shop/menu_remove with storage minted_coins:tmp args
data remove storage minted_coins:tmp oq[0]
function minted_coins:shop/menu_next
