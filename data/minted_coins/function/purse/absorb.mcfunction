# {slot}: the coins put in the purse of this slot (like in a bundle) join its contents, which have no limit;
# anything else is handed back. The bundle is then empty again, ready for more.
$data modify storage minted_coins:tmp purse_io set value {slot:"$(slot)"}
function minted_coins:purse/read with storage minted_coins:tmp purse_io
scoreboard players set $deposited minted_coins.data 0
scoreboard players set $rejected minted_coins.data 0
data modify storage minted_coins:tmp purse_queue set value []
data modify storage minted_coins:tmp purse_queue set from storage minted_coins:tmp purse_contents
function minted_coins:purse/absorb_next with storage minted_coins:tmp purse
function minted_coins:purse/save
execute if score $rejected minted_coins.data matches 1.. run return run title @s actionbar {translate:"chat.minted_coins.purse.rejected",fallback:"Only coins of %s go in this purse",with:[{nbt:"purse.names.mint",storage:"minted_coins:tmp",interpret:true}],color:"red"}
execute if score $deposited minted_coins.data matches 1.. run title @s actionbar {translate:"chat.minted_coins.purse.deposited",fallback:"%s coins put away",with:[{score:{name:"$deposited",objective:"minted_coins.data"}}],color:"gold"}
