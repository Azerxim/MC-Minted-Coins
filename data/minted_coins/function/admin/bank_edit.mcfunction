# /function minted_coins:admin/bank_edit {id:B,gold:G,copper:C,iron:I,diamond:D,small:S,gold_rank:RG,copper_rank:RC,iron_rank:RI,diamond_rank:RD,name:"N",gold_name:"…",copper_name:"…",iron_name:"…",diamond_name:"…",small_name:"…",licence:L,licence_metal:"M"},
# sent by the edit dialog of a bank (operators only, like any /function): new names, rates, small change and conversion order;
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
execute store success score $ok minted_coins.data run function minted_coins:admin/select_bank
execute unless score $ok minted_coins.data matches 1 run return fail
function minted_coins:admin/defaults
$data modify storage minted_coins:tmp new_name set value "$(name)"
$data modify storage minted_coins:tmp new_coin_names set value {gold:"$(gold_name)",copper:"$(copper_name)",iron:"$(iron_name)",diamond:"$(diamond_name)"}
$data modify storage minted_coins:tmp new_small_name set value "$(small_name)"
$scoreboard players set $licence minted_coins.data $(licence)
$data modify storage minted_coins:tmp new_licence_metal set value "$(licence_metal)"
function minted_coins:bank/edit
tellraw @s {translate:"chat.minted_coins.bank_edited",fallback:"✔ Bank updated: %s",color:"green",with:[{nbt:"bank.name",storage:"minted_coins:tmp",interpret:true,color:"gold"}]}
function minted_coins:admin/bank_page
