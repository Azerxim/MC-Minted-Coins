# as a player who used /trigger minted_coins.shop (from the menu of their selected shop): any player can type it, so the
# action only happens if they carry the key of that shop.
#   1  new offer: sell the main hand for the off hand     2  new offer: buy the main hand for the off hand
#   3  rename the shop after the item in the main hand    4  close the shop
#   100 + n  remove offer n
scoreboard players operation $act minted_coins.data = @s minted_coins.shop
scoreboard players set @s minted_coins.shop 0
scoreboard players set $changed minted_coins.data 0
execute store success score $ok minted_coins.data run function minted_coins:shop/select
execute unless score $ok minted_coins.data matches 1 run return run tellraw @s {translate:"chat.minted_coins.shop.none",fallback:"Click the sign above a shop first.",color:"red"}
execute if score $key minted_coins.data matches 0 run return run tellraw @s {translate:"chat.minted_coins.shop.no_key",fallback:"You need the key of this shop.",color:"red"}
execute if score $act minted_coins.data matches 1..2 run function minted_coins:shop/offer_add
execute if score $act minted_coins.data matches 3 run function minted_coins:shop/rename
execute if score $act minted_coins.data matches 101..199 run function minted_coins:shop/offer_remove
execute if score $act minted_coins.data matches 4 run return run function minted_coins:shop/close
# the offers changed: the villager is rebuilt from them (a new version of the shop), then the menu shows them again
execute if score $changed minted_coins.data matches 1 run function minted_coins:shop/apply
function minted_coins:shop/menu
