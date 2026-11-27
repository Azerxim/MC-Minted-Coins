# /function minted_coins:admin/exchange_create {bank:B,name:"N",give:G,back:K,partners:[0,…]}, sent by the new exchange office dialog of a bank
# (operators only, like any /function): an exchange office of bank B appears 2 blocks in front of the admin, named N
# ("" = "Exchange office of <bank>"), giving back the metal of K coins for G coins, with the ticked banks (0 = not ticked)
execute unless entity @s[type=minecraft:player] run return fail
scoreboard players set @s minted_coins.op 1
$scoreboard players set $target minted_coins.data $(bank)
execute store success score $ok minted_coins.data run function minted_coins:admin/select_bank
execute unless score $ok minted_coins.data matches 1 run return fail
function minted_coins:admin/defaults
data modify storage minted_coins:tmp bank set from storage minted_coins:tmp entry
$data modify storage minted_coins:tmp partners set value $(partners)
function minted_coins:exchange/clean
$data modify storage minted_coins:tmp mint set value {kind:"exchange",bank:$(bank),name:{text:"$(name)"},give:$(give),back:$(back)}
data modify storage minted_coins:tmp mint.partners set from storage minted_coins:tmp partners
execute if data storage minted_coins:tmp mint.name{text:""} run data modify storage minted_coins:tmp mint.name set value {translate:"name.minted_coins.default_exchange",fallback:"Exchange office of %s",with:[]}
execute if data storage minted_coins:tmp mint.name.with run data modify storage minted_coins:tmp mint.name.with append from storage minted_coins:tmp bank.name
function minted_coins:mint/create
