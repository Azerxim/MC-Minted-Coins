# /function minted_coins:admin/mint_create {bank:B,name:"N",strike:S,small:S,convert:C,convert_all:A,buyback:B,purse:P,licence:L}, sent by the new mint dialog
# of a bank (operators only, like any /function): a mint of bank B appears 2 blocks in front of the admin, named N ("" = the name
# of the bank), with the families of trades set to 1: strike, small change, conversion, diamond buyback, purse
execute unless entity @s[type=minecraft:player] run return fail
scoreboard players set @s minted_coins.op 1
$scoreboard players set $target minted_coins.data $(bank)
execute store success score $ok minted_coins.data run function minted_coins:admin/select_bank
execute unless score $ok minted_coins.data matches 1 run return fail
function minted_coins:admin/defaults
data modify storage minted_coins:tmp bank set from storage minted_coins:tmp entry
$data modify storage minted_coins:tmp mint set value {bank:$(bank),name:{text:"$(name)"},trades:{strike:$(strike)b,small:$(small)b,convert:$(convert)b,convert_all:$(convert_all)b,buyback:$(buyback)b,purse:$(purse)b,licence:$(licence)b}}
execute if data storage minted_coins:tmp mint.name{text:""} run data modify storage minted_coins:tmp mint.name set from storage minted_coins:tmp bank.name
function minted_coins:mint/create
