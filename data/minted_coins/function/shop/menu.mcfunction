# as a player who selected a shop: its owner menu if they carry its key, otherwise a word about the shop
execute store success score $ok minted_coins.data run function minted_coins:shop/select
execute unless score $ok minted_coins.data matches 1 run return 0
execute if score $key minted_coins.data matches 0 run return run title @s actionbar {translate:"chat.minted_coins.shop.visitor",fallback:"%s: trade with the merchant. Only the holder of its key manages it.",with:[{nbt:"shop.name",storage:"minted_coins:tmp",interpret:true}],color:"gold"}
function minted_coins:shop/hands
data modify storage minted_coins:tmp list set value {type:"minecraft:multi_action",title:[{text:""},{translate:"%s",with:[],color:"gold"}],body:[{type:"minecraft:plain_message",width:300,contents:{translate:"dialog.minted_coins.shop.body",fallback:"Hold the goods in your main hand and their price, in coins, in your off hand: the stack sizes give the quantity and the price. Sell: customers pay the coins and get the goods from the stock. Buy: they give the goods and get the coins from the stock.",color:"gray"}}],actions:[],columns:2,exit_action:{label:{translate:"dialog.minted_coins.close",fallback:"Close"}},pause:false}
data modify storage minted_coins:tmp list.title[1].with append from storage minted_coins:tmp shop.name
# the offers, with what the stock allows
scoreboard players set $i minted_coins.data 0
data modify storage minted_coins:tmp oq set value []
data modify storage minted_coins:tmp oq set from storage minted_coins:tmp shop.offers
data modify storage minted_coins:tmp at set value {fn:"shop/menu_offers"}
data modify storage minted_coins:tmp at.dim set from storage minted_coins:tmp shop.dim
data modify storage minted_coins:tmp at.x set from storage minted_coins:tmp shop.x
data modify storage minted_coins:tmp at.y set from storage minted_coins:tmp shop.y
data modify storage minted_coins:tmp at.z set from storage minted_coins:tmp shop.z
function minted_coins:shop/at with storage minted_coins:tmp at
execute unless data storage minted_coins:tmp shop.offers[0] run data modify storage minted_coins:tmp list.body append value {type:"minecraft:plain_message",width:300,contents:{translate:"dialog.minted_coins.shop.no_offer",fallback:"No offer yet.",color:"yellow"}}
# what the hands hold
execute if data storage minted_coins:tmp hands.main run data modify storage minted_coins:tmp list.body append value {type:"minecraft:item",item:{id:"minecraft:stone"},show_decorations:true,description:{width:200,contents:{translate:"dialog.minted_coins.shop.main_hand",fallback:"Main hand: the goods",color:"gray"}}}
execute if data storage minted_coins:tmp hands.main run data modify storage minted_coins:tmp list.body[-1].item set from storage minted_coins:tmp hands.main
execute if data storage minted_coins:tmp hands.off run data modify storage minted_coins:tmp list.body append value {type:"minecraft:item",item:{id:"minecraft:stone"},show_decorations:true,description:{width:200,contents:{translate:"dialog.minted_coins.shop.off_hand",fallback:"Off hand: the price",color:"gray"}}}
execute if data storage minted_coins:tmp hands.off run data modify storage minted_coins:tmp list.body[-1].item set from storage minted_coins:tmp hands.off
data modify storage minted_coins:tmp list.actions append value {label:{translate:"dialog.minted_coins.shop.sell",fallback:"Sell: main hand for off hand",color:"green"},tooltip:{translate:"dialog.minted_coins.shop.sell.tooltip",fallback:"Customers pay the coins in your off hand and get the goods in your main hand, taken from the stock."},action:{type:"minecraft:run_command",command:"trigger minted_coins.shop set 1"}}
data modify storage minted_coins:tmp list.actions append value {label:{translate:"dialog.minted_coins.shop.buy",fallback:"Buy: main hand for off hand",color:"aqua"},tooltip:{translate:"dialog.minted_coins.shop.buy.tooltip",fallback:"Customers give the goods in your main hand and get the coins in your off hand, paid from the stock."},action:{type:"minecraft:run_command",command:"trigger minted_coins.shop set 2"}}
data modify storage minted_coins:tmp list.actions append from storage minted_coins:tmp offer_actions[]
data modify storage minted_coins:tmp list.actions append value {label:{translate:"dialog.minted_coins.shop.rename",fallback:"Rename"},tooltip:{translate:"dialog.minted_coins.shop.rename.tooltip",fallback:"Takes the name of the item in your main hand, a name tag renamed in an anvil for instance."},action:{type:"minecraft:run_command",command:"trigger minted_coins.shop set 3"}}
data modify storage minted_coins:tmp list.actions append value {label:{translate:"dialog.minted_coins.shop.close",fallback:"Close the shop…",color:"red"},action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:confirmation",title:{translate:"dialog.minted_coins.shop.close.title",fallback:"Close the shop?",color:"red"},body:{type:"minecraft:plain_message",width:300,contents:{translate:"dialog.minted_coins.shop.close.body",fallback:"The merchant leaves and the container is unlocked, with everything in it. You get your licence back.",color:"gray"}},yes:{label:{translate:"dialog.minted_coins.shop.close.confirm",fallback:"Close the shop",color:"red"},action:{type:"minecraft:run_command",command:"trigger minted_coins.shop set 4"}},no:{label:{translate:"gui.cancel",fallback:"Cancel"}},pause:false}}}
data modify storage minted_coins:tmp show.dialog set from storage minted_coins:tmp list
function minted_coins:admin/show with storage minted_coins:tmp show
