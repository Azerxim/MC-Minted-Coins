# {d, id, acc}: the checkbox of bank id (its value: the id when ticked, 0 otherwise), ticked when it is already a partner
$data modify storage minted_coins:tmp form.acc set value "$(acc),$(d)(b$(id))"
$data modify storage minted_coins:tmp input set value {type:"minecraft:boolean",key:"b$(id)",label:"",initial:false,on_true:"$(id)",on_false:"0"}
data modify storage minted_coins:tmp input.label set from storage minted_coins:tmp xqueue[0].name
$execute if data storage minted_coins:tmp form{sel:[$(id)]} run data modify storage minted_coins:tmp input.initial set value true
data modify storage minted_coins:tmp form.inputs append from storage minted_coins:tmp input
