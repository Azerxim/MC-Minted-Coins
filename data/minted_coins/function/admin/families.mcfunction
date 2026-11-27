# minted_coins:tmp families = the families of trades minted_coins:tmp m accepts, as one text component separated by " · "
# (an exchange office: the banks it changes with and its fee)
execute if data storage minted_coins:tmp m{kind:"exchange"} run function minted_coins:admin/exchange_families
execute if data storage minted_coins:tmp m{kind:"exchange"} run return 0
data modify storage minted_coins:tmp join_queue set value []
execute if data storage minted_coins:tmp m.trades{strike:1b} run data modify storage minted_coins:tmp join_queue append value {translate:"chat.minted_coins.family.strike",fallback:"strike"}
execute if data storage minted_coins:tmp m.trades{small:1b} run data modify storage minted_coins:tmp join_queue append value {translate:"chat.minted_coins.small_change",fallback:"small change"}
execute if data storage minted_coins:tmp m.trades{convert:1b} run data modify storage minted_coins:tmp join_queue append value {translate:"chat.minted_coins.family.convert",fallback:"conversion"}
execute if data storage minted_coins:tmp m.trades{buyback:1b} run data modify storage minted_coins:tmp join_queue append value {translate:"chat.minted_coins.family.buyback",fallback:"diamond buyback"}
execute if data storage minted_coins:tmp m.trades{purse:1b} run data modify storage minted_coins:tmp join_queue append value {translate:"chat.minted_coins.family.purse",fallback:"purse"}
execute if data storage minted_coins:tmp m.trades{licence:1b} run data modify storage minted_coins:tmp join_queue append value {translate:"chat.minted_coins.family.licence",fallback:"shop licence"}
execute unless data storage minted_coins:tmp join_queue[0] run data modify storage minted_coins:tmp join_queue append value {translate:"chat.minted_coins.family.none",fallback:"no trade"}
data modify storage minted_coins:tmp families set value [{text:"",color:"yellow"}]
function minted_coins:admin/families_next
