# trigger values:
#   1            open the menu
#   2            list the mints
#   5GCIDS       create a mint striking G gold / C copper / I iron / D diamond coins per ingot, S = 1 with small change (500010..599991)
#   100000 + id  teleport to a mint
#   200000 + id  ask to remove a mint
#   300000 + id  remove a mint
#   400000 + id  forget a mint that no longer exists
scoreboard players operation $action minted_coins.data = @s minted_coins
scoreboard players set @s minted_coins 0
execute if score $action minted_coins.data matches 1 run return run dialog show @s minted_coins:menu
execute if score $action minted_coins.data matches 2 run return run function minted_coins:admin/list
execute if score $action minted_coins.data matches 500000..599999 run return run function minted_coins:admin/create
execute if score $action minted_coins.data matches 100001..199999 run return run function minted_coins:admin/goto
execute if score $action minted_coins.data matches 200001..299999 run return run function minted_coins:admin/remove_ask
execute if score $action minted_coins.data matches 300001..399999 run return run function minted_coins:admin/remove
execute if score $action minted_coins.data matches 400001..499999 run return run function minted_coins:admin/forget
