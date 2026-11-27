data modify storage minted_coins:tmp tpl set from storage minted_coins:tmp o.price
scoreboard players operation $need minted_coins.data = $p minted_coins.data
function minted_coins:shop/take
data modify storage minted_coins:tmp tpl set from storage minted_coins:tmp o.goods
scoreboard players operation $amt minted_coins.data = $q minted_coins.data
function minted_coins:shop/put
