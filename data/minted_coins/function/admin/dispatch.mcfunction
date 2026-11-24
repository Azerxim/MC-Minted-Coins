# trigger values:
#   1            open the menu
#   2            show the mints list
#   100000 + id  teleport to a mint
#   300000 + id  remove a mint
#   400000 + id  forget a mint that no longer exists
#   500000 + id  edit a mint
scoreboard players operation $action minted_coins.data = @s minted_coins.mint.menu
scoreboard players set @s minted_coins.mint.menu 0
execute unless score @s minted_coins.op matches 1 run return run tellraw @s {translate:"chat.minted_coins.not_operator",fallback:"Only operators can open the Minted Coins menu. An operator opens it once with /function minted_coins:mint/menu; after that, /trigger minted_coins.mint.menu is enough.",color:"red"}
execute if score $action minted_coins.data matches 1 run return run dialog show @s minted_coins:menu
execute if score $action minted_coins.data matches 2 run return run function minted_coins:admin/list
execute if score $action minted_coins.data matches 100001..199999 run return run function minted_coins:admin/goto
execute if score $action minted_coins.data matches 300001..399999 run return run function minted_coins:admin/remove
execute if score $action minted_coins.data matches 400001..499999 run return run function minted_coins:admin/forget
execute if score $action minted_coins.data matches 500001..599999 run return run function minted_coins:admin/edit_ask
