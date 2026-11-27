# at the stock container: one line per offer in the menu (its goods, price and stock), and its Remove button
data modify storage minted_coins:tmp offer_actions set value []
function minted_coins:shop/menu_next
