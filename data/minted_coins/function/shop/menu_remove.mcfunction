# {n, v}: the Remove button of offer n (trigger value v)
$data modify storage minted_coins:tmp offer_actions append value {label:{translate:"dialog.minted_coins.shop.remove_offer",fallback:"Remove offer %s",with:["$(n)"]},action:{type:"minecraft:run_command",command:"trigger minted_coins.shop set $(v)"}}
