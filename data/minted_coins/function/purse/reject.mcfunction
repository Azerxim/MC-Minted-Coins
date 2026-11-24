# as a player: the stack minted_coins:tmp pentry is not a coin of the mint of the purse, it drops at their feet to be picked up again
summon minecraft:item ~ ~ ~ {Tags:["minted_coins.reject"],PickupDelay:0,Item:{id:"minecraft:stone",count:1}}
data modify entity @e[type=minecraft:item,tag=minted_coins.reject,limit=1] Item set from storage minted_coins:tmp pentry
tag @e[type=minecraft:item,tag=minted_coins.reject] remove minted_coins.reject
scoreboard players add $rejected minted_coins.data 1
