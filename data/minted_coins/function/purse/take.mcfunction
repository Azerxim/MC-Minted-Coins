# {key, metal, item, model, color, small}: takes $amount coins of this kind out of minted_coins:tmp purse (at most what it holds)
$execute store result score $have minted_coins.data run data get storage minted_coins:tmp purse.$(key)
execute if score $amount minted_coins.data matches 9999.. run scoreboard players operation $amount minted_coins.data = $have minted_coins.data
execute if score $amount minted_coins.data > $have minted_coins.data run scoreboard players operation $amount minted_coins.data = $have minted_coins.data
execute if score $amount minted_coins.data matches ..0 run return fail
scoreboard players operation $have minted_coins.data -= $amount minted_coins.data
$execute store result storage minted_coins:tmp purse.$(key) int 1 run scoreboard players get $have minted_coins.data
$data modify storage minted_coins:tmp give set value {item:"$(item)",model:"$(model)",color:$(color),small:$(small)}
data modify storage minted_coins:tmp give.mint set from storage minted_coins:tmp purse.mint
data modify storage minted_coins:tmp give.mint_name set from storage minted_coins:tmp purse.names.mint
$data modify storage minted_coins:tmp give.name set from storage minted_coins:tmp purse.names.$(metal)
function minted_coins:purse/give_loop
