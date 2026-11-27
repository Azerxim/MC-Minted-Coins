# as a new shop villager: a merchant that doesn't move, can't be hurt, keeps its trades and doesn't level up
data merge entity @s {Tags:["minted_coins.shop"],NoAI:1b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,CustomNameVisible:1b,Xp:0,VillagerData:{profession:"minecraft:none",level:1,type:"minecraft:plains"},Offers:{Recipes:[]}}
