# /function minted_coins:admin/edit {id:N,gold:G,copper:C,iron:I,diamond:D,small:S,gold_rank:RG,copper_rank:RC,iron_rank:RI,diamond_rank:RD,name:"N",gold_name:"…",copper_name:"…",iron_name:"…",diamond_name:"…"},
# sent by the edit dialog of a mint (operators only, like any /function): new names, rates, small change and conversion order;
# a name left empty keeps the current one. Coins already struck keep their name and stay valid.
execute unless entity @s[type=minecraft:player] run return fail
scoreboard players set @s minted_coins.op 1
$scoreboard players set $target minted_coins.data $(id)
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
execute store success score $ok minted_coins.data run function minted_coins:admin/select
execute unless score $ok minted_coins.data matches 1 run return fail
function minted_coins:admin/defaults
$data modify storage minted_coins:tmp new_name set value "$(name)"
$data modify storage minted_coins:tmp new_coin_names set value {gold:"$(gold_name)",copper:"$(copper_name)",iron:"$(iron_name)",diamond:"$(diamond_name)"}
scoreboard players set $found minted_coins.data 0
execute as @e[type=minecraft:wandering_trader,tag=minted_coins.mint] if score @s minted_coins.id = $target minted_coins.data run function minted_coins:mint/edit
execute if score $found minted_coins.data matches 0 run return run function minted_coins:admin/remove_unloaded with storage minted_coins:tmp entry
tellraw @s {translate:"chat.minted_coins.edited",fallback:"✔ Mint updated: %s",color:"green",with:[{nbt:"mint.name",storage:"minted_coins:tmp",interpret:true,color:"gold"}]}
function minted_coins:admin/list
