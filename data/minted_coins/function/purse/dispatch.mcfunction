# trigger minted_coins.purse = amount * 100 + kind of coin (1-4 gold, copper, iron, diamond, 5-8 their small coins),
# sent by the dialog of the purse; an amount of 9999 withdraws every coin of that kind
scoreboard players operation $type minted_coins.data = @s minted_coins.purse
scoreboard players set @s minted_coins.purse 0
scoreboard players operation $amount minted_coins.data = $type minted_coins.data
scoreboard players operation $type minted_coins.data %= $100 minted_coins.data
scoreboard players operation $amount minted_coins.data /= $100 minted_coins.data
execute unless function minted_coins:purse/find run return run tellraw @s {translate:"chat.minted_coins.purse.not_held",fallback:"Hold the purse in your hand to withdraw coins.",color:"red"}
function minted_coins:purse/read with storage minted_coins:tmp purse_io
execute if score $type minted_coins.data matches 1 run function minted_coins:purse/take {key:"gold",metal:"gold",item:"minecraft:gold_nugget",model:"gold_coin",color:0,small:0}
execute if score $type minted_coins.data matches 2 run function minted_coins:purse/take {key:"copper",metal:"copper",item:"minecraft:copper_nugget",model:"copper_coin",color:0,small:0}
execute if score $type minted_coins.data matches 3 run function minted_coins:purse/take {key:"iron",metal:"iron",item:"minecraft:iron_nugget",model:"iron_coin",color:0,small:0}
execute if score $type minted_coins.data matches 4 run function minted_coins:purse/take {key:"diamond",metal:"diamond",item:"minecraft:prismarine_crystals",model:"diamond_coin",color:0,small:0}
execute if score $type minted_coins.data matches 5 run function minted_coins:purse/take {key:"small_gold",metal:"gold",item:"minecraft:firework_star",model:"small_gold_coin",color:16438858,small:1}
execute if score $type minted_coins.data matches 6 run function minted_coins:purse/take {key:"small_copper",metal:"copper",item:"minecraft:firework_star",model:"small_copper_coin",color:15170646,small:1}
execute if score $type minted_coins.data matches 7 run function minted_coins:purse/take {key:"small_iron",metal:"iron",item:"minecraft:firework_star",model:"small_iron_coin",color:14278631,small:1}
execute if score $type minted_coins.data matches 8 run function minted_coins:purse/take {key:"small_diamond",metal:"diamond",item:"minecraft:firework_star",model:"small_diamond_coin",color:4910553,small:1}
function minted_coins:purse/save
function minted_coins:purse/dialog
