# as an exchange office: the trades with the first bank of minted_coins:tmp xq (skipped if it was removed), then the next ones
execute unless data storage minted_coins:tmp xq[0] run return 0
data remove storage minted_coins:tmp other
data modify storage minted_coins:tmp args set value {}
data modify storage minted_coins:tmp args.id set from storage minted_coins:tmp xq[0]
function minted_coins:exchange/load_other with storage minted_coins:tmp args
execute if data storage minted_coins:tmp other run function minted_coins:exchange/pair {metal:"gold",item:"minecraft:gold_nugget",model:"gold_coin"}
execute if data storage minted_coins:tmp other run function minted_coins:exchange/pair {metal:"copper",item:"minecraft:copper_nugget",model:"copper_coin"}
execute if data storage minted_coins:tmp other run function minted_coins:exchange/pair {metal:"iron",item:"minecraft:iron_nugget",model:"iron_coin"}
execute if data storage minted_coins:tmp other run function minted_coins:exchange/pair {metal:"diamond",item:"minecraft:prismarine_crystals",model:"diamond_coin"}
data remove storage minted_coins:tmp xq[0]
function minted_coins:exchange/partner_next
