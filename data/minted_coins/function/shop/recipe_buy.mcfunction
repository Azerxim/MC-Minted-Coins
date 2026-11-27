# the shop buys: <qty> goods -> <pcount> coins
data modify storage minted_coins:tmp recipe.buy set from storage minted_coins:tmp o.goods
data modify storage minted_coins:tmp recipe.buy.count set from storage minted_coins:tmp o.qty
data modify storage minted_coins:tmp recipe.sell set from storage minted_coins:tmp o.price
data modify storage minted_coins:tmp recipe.sell.count set from storage minted_coins:tmp o.pcount
