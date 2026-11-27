# with storage minted_coins:tmp entry (a bank, page = trigger value of its page): appends its button to the banks list dialog
$data modify storage minted_coins:tmp button set value {label:"",tooltip:"",width:300,action:{type:"minecraft:run_command",command:"trigger minted_coins.mint.menu set $(page)"}}
data modify storage minted_coins:tmp button.label set from storage minted_coins:tmp entry.name
data modify storage minted_coins:tmp button.tooltip set from storage minted_coins:tmp joined
data modify storage minted_coins:tmp list.actions append from storage minted_coins:tmp button
