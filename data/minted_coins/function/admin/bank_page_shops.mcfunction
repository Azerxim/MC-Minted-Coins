# {id, page}: the buttons of the shops whose licence this bank issued, after its mints
data modify storage minted_coins:tmp squeue set value []
$data modify storage minted_coins:tmp squeue append from storage minted_coins:registry shops[{bank:$(id)}]
function minted_coins:admin/bank_page_shop_next
