# minted_coins:tmp form {d, own (its bank), cmd, name, give, back, sel (ticked banks), title, confirm, acc:"0"}: shows the exchange
# office dialog: its name, its rate (coins given -> coins given back, in metal) and one checkbox per other bank, whose values make the partners list of the command
data modify storage minted_coins:tmp form.inputs set value [{type:"minecraft:text",key:"name",label:{translate:"dialog.minted_coins.exchange_form.name",fallback:"Exchange office name (empty = Exchange office of <bank>)"},width:240,initial:"",max_length:32},{type:"minecraft:number_range",key:"give",label:{translate:"dialog.minted_coins.exchange_form.give",fallback:"Coins given"},width:240,start:1,end:64,step:1,initial:10},{type:"minecraft:number_range",key:"back",label:{translate:"dialog.minted_coins.exchange_form.back",fallback:"Coins given back"},width:240,start:1,end:64,step:1,initial:9}]
data modify storage minted_coins:tmp form.inputs[0].initial set from storage minted_coins:tmp form.name
execute store result storage minted_coins:tmp form.inputs[1].initial float 1 run data get storage minted_coins:tmp form.give
execute store result storage minted_coins:tmp form.inputs[2].initial float 1 run data get storage minted_coins:tmp form.back
data modify storage minted_coins:tmp xqueue set from storage minted_coins:registry banks
execute store result score $own minted_coins.data run data get storage minted_coins:tmp form.own
function minted_coins:admin/exchange_form_next
execute store result score $partners minted_coins.data if data storage minted_coins:tmp form.inputs[{type:"minecraft:boolean"}]
scoreboard players operation $value minted_coins.data = $own minted_coins.data
scoreboard players add $value minted_coins.data 600000
execute store result storage minted_coins:tmp form.page int 1 run scoreboard players get $value minted_coins.data
function minted_coins:admin/exchange_form_dialog with storage minted_coins:tmp form
data modify storage minted_coins:tmp show.dialog.title[2] set from storage minted_coins:tmp form.title
data modify storage minted_coins:tmp show.dialog.actions[0].label set from storage minted_coins:tmp form.confirm
data modify storage minted_coins:tmp show.dialog.inputs set from storage minted_coins:tmp form.inputs
execute if score $partners minted_coins.data matches 0 run data modify storage minted_coins:tmp show.dialog.body append value {type:"minecraft:plain_message",width:300,contents:{translate:"dialog.minted_coins.exchange_form.alone",fallback:"There is no other bank yet: create one first, then tick it here.",color:"red"}}
function minted_coins:admin/show with storage minted_coins:tmp show
