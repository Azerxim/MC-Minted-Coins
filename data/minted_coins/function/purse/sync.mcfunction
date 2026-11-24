# {slot}: the purse of this slot follows its bundle contents: coins of its mint put in it join it, coins taken out leave it,
# anything else is handed back. Its bundle then shows up to 32 coins, the rest stays in its reserve, without limit.
$data modify storage minted_coins:tmp purse_io set value {slot:"$(slot)"}
function minted_coins:purse/read with storage minted_coins:tmp purse_io
execute unless data storage minted_coins:tmp purse.shown run data modify storage minted_coins:tmp purse.shown set value {gold:0,copper:0,iron:0,diamond:0,small_gold:0,small_copper:0,small_iron:0,small_diamond:0}
data modify storage minted_coins:tmp seen set value {gold:0,copper:0,iron:0,diamond:0,small_gold:0,small_copper:0,small_iron:0,small_diamond:0}
scoreboard players set $rejected minted_coins.data 0
data modify storage minted_coins:tmp purse_queue set value []
data modify storage minted_coins:tmp purse_queue set from storage minted_coins:tmp purse_contents
function minted_coins:purse/sort_next with storage minted_coins:tmp purse
execute store success score $changed minted_coins.data run data modify storage minted_coins:tmp purse.shown set from storage minted_coins:tmp seen
function minted_coins:purse/balance
# the bundle holds what it showed and already shows what it should: nothing to write (writing would change the inventory again)
execute store success score $rebalanced minted_coins.data run data modify storage minted_coins:tmp seen set from storage minted_coins:tmp purse.shown
execute if score $changed minted_coins.data matches 0 if score $rebalanced minted_coins.data matches 0 if score $rejected minted_coins.data matches 0 run return 0
function minted_coins:purse/save
execute if score $rejected minted_coins.data matches 1.. run title @s actionbar {translate:"chat.minted_coins.purse.rejected",fallback:"Only coins of %s go in this purse",with:[{nbt:"purse.names.mint",storage:"minted_coins:tmp",interpret:true}],color:"red"}
