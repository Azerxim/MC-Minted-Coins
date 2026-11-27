# trigger values:
#   1            open the menu
#   2            show the banks list
#   100000 + id  teleport to a mint
#   300000 + id  remove a mint
#   500000 + id  edit a mint
#   600000 + id  show the page of a bank (its mints)
#   700000 + id  edit a bank
#   800000 + id  remove a bank and its mints
#   900000 + id  new mint of a bank
#   1000000 + id new exchange office of a bank
#   1100000 + id teleport to a shop
#   1200000 + id remove a shop
scoreboard players operation $action minted_coins.data = @s minted_coins.mint.menu
scoreboard players set @s minted_coins.mint.menu 0
execute unless score @s minted_coins.op matches 1 run return run tellraw @s {translate:"chat.minted_coins.not_operator",fallback:"Only operators can open the Minted Coins menu. An operator opens it once with /function minted_coins:mint/menu; after that, /trigger minted_coins.mint.menu is enough.",color:"red"}
execute if score $action minted_coins.data matches 1 run return run dialog show @s minted_coins:menu
execute if score $action minted_coins.data matches 2 run return run function minted_coins:admin/list
execute if score $action minted_coins.data matches 100001..199999 run return run function minted_coins:admin/goto
execute if score $action minted_coins.data matches 300001..399999 run return run function minted_coins:admin/mint_remove
execute if score $action minted_coins.data matches 500001..599999 run return run function minted_coins:admin/mint_edit_ask
execute if score $action minted_coins.data matches 600001..699999 run scoreboard players operation $target minted_coins.data = $action minted_coins.data
execute if score $action minted_coins.data matches 600001..699999 run scoreboard players remove $target minted_coins.data 600000
execute if score $action minted_coins.data matches 600001..699999 run return run function minted_coins:admin/bank_page
execute if score $action minted_coins.data matches 700001..799999 run return run function minted_coins:admin/bank_edit_ask
execute if score $action minted_coins.data matches 800001..899999 run return run function minted_coins:admin/bank_remove
execute if score $action minted_coins.data matches 900001..999999 run return run function minted_coins:admin/mint_new
execute if score $action minted_coins.data matches 1000001..1099999 run return run function minted_coins:admin/exchange_new
execute if score $action minted_coins.data matches 1100001..1199999 run return run function minted_coins:admin/shop_goto
execute if score $action minted_coins.data matches 1200001..1299999 run return run function minted_coins:admin/shop_remove
