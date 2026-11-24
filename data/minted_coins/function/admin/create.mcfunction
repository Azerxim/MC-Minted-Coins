# /function minted_coins:admin/create {gold:G,copper:C,iron:I,diamond:D,small:S,gold_rank:RG,copper_rank:RC,iron_rank:RI,diamond_rank:RD,name:"N",gold_name:"…",copper_name:"…",iron_name:"…",diamond_name:"…"},
# sent by the minted_coins:create dialog
# (operators only, like any /function): G gold / C copper / I iron / D diamond coins per ingot or diamond (0 = not struck),
# S small change (1 = yes), RG / RC / RI / RD the conversion order of the coins (0 = not converted), N the name of the mint ("" = the renamed item in the main hand, otherwise "Mint #<id>"),
# <coin>_name the name of its coins ("" = a renamed nugget / prismarine crystals in the inventory, otherwise "Gold Coin"…)
execute unless entity @s[type=minecraft:player] run return fail
scoreboard players set @s minted_coins.op 1
$scoreboard players set $gold minted_coins.data $(gold)
$scoreboard players set $copper minted_coins.data $(copper)
$scoreboard players set $iron minted_coins.data $(iron)
$scoreboard players set $diamond minted_coins.data $(diamond)
$scoreboard players set $small minted_coins.data $(small)
$scoreboard players set $gold_rank minted_coins.data $(gold_rank)
$scoreboard players set $copper_rank minted_coins.data $(copper_rank)
$scoreboard players set $iron_rank minted_coins.data $(iron_rank)
$scoreboard players set $diamond_rank minted_coins.data $(diamond_rank)
execute if score $gold minted_coins.data matches 0 if score $copper minted_coins.data matches 0 if score $iron minted_coins.data matches 0 if score $diamond minted_coins.data matches 0 run return run tellraw @s {translate:"chat.minted_coins.no_coin",fallback:"Choose at least one coin to strike.",color:"red"}
execute unless function minted_coins:admin/check_ranks run return run tellraw @s {translate:"chat.minted_coins.same_rank",fallback:"Two coins have the same conversion order: give each coin its own number, or 0.",color:"red"}
$data modify storage minted_coins:tmp new_name set value "$(name)"
$data modify storage minted_coins:tmp new_coin_names set value {gold:"$(gold_name)",copper:"$(copper_name)",iron:"$(iron_name)",diamond:"$(diamond_name)"}
function minted_coins:mint/create
