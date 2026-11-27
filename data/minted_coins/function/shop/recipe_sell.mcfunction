# the shop sells: <pcount> coins -> <qty> goods
data modify storage minted_coins:tmp recipe.buy set from storage minted_coins:tmp cost
data modify storage minted_coins:tmp recipe.buy.count set from storage minted_coins:tmp o.pcount
data modify storage minted_coins:tmp recipe.sell set from storage minted_coins:tmp o.goods
data modify storage minted_coins:tmp recipe.sell.count set from storage minted_coins:tmp o.qty
