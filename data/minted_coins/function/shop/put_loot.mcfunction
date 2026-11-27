# {id, components, n}: n such items into the container (split into stacks); components first, or they would be lost
$loot insert ~ ~ ~ loot {pools:[{rolls:1,entries:[{type:"minecraft:item",name:"$(id)",modifier:[{type:"minecraft:set_components",components:$(components)},{type:"minecraft:set_count",count:$(n)}]}]}]}
