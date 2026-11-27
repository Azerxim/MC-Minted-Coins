# {id, components, n}: n such items dropped on top of the container
$loot spawn ~0.5 ~1.1 ~0.5 loot {pools:[{rolls:1,entries:[{type:"minecraft:item",name:"$(id)",modifier:[{type:"minecraft:set_components",components:$(components)},{type:"minecraft:set_count",count:$(n)}]}]}]}
