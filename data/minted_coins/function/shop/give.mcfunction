# {id, components}: gives the player one such item (a licence handed back, a shop key)
$loot give @s loot {pools:[{rolls:1,entries:[{type:"minecraft:item",name:"$(id)",modifier:[{type:"minecraft:set_components",components:$(components)}]}]}]}
