# as a player using a purse (right click, advancement minted_coins:purse_use): opens its dialog
advancement revoke @s only minted_coins:purse_use
# the use goes on while the button is held: open the dialog once
execute if score @s minted_coins.purse_cd matches 1.. run return 0
scoreboard players set @s minted_coins.purse_cd 10
execute unless function minted_coins:purse/find run return fail
function minted_coins:purse/read with storage minted_coins:tmp purse_io
function minted_coins:purse/save
function minted_coins:purse/dialog
