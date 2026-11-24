# shows the mints list dialog: one button per mint, each opening the page of that mint
execute unless data storage minted_coins:registry mints[0] run return run dialog show @s minted_coins:list_empty
data modify storage minted_coins:tmp list set value {type:"minecraft:multi_action",title:[{text:""},{translate:"dialog.minted_coins.icon.gold",fallback:"",font:"minted_coins:dialog",color:"white",shadow_color:0},{translate:"dialog.minted_coins.list.title",fallback:"Mints",color:"gold"}],body:{type:"minecraft:plain_message",width:300,contents:{translate:"dialog.minted_coins.list.body",fallback:"Choose a mint to see its position and rates, teleport to it, edit it or remove it.",color:"gray"}},actions:[],columns:1,exit_action:{label:{translate:"gui.back",fallback:"Back"},action:{type:"minecraft:show_dialog",dialog:"minted_coins:menu"}},pause:false}
data modify storage minted_coins:tmp queue set from storage minted_coins:registry mints
function minted_coins:admin/list_next
data modify storage minted_coins:tmp show.dialog set from storage minted_coins:tmp list
function minted_coins:admin/show with storage minted_coins:tmp show
