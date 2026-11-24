# fails when two struck coins share the same conversion rank (scores $gold… and $gold_rank…, see minted_coins:mint/chain)
execute unless score $gold minted_coins.data matches 0 unless score $copper minted_coins.data matches 0 unless score $gold_rank minted_coins.data matches 0 if score $gold_rank minted_coins.data = $copper_rank minted_coins.data run return fail
execute unless score $gold minted_coins.data matches 0 unless score $iron minted_coins.data matches 0 unless score $gold_rank minted_coins.data matches 0 if score $gold_rank minted_coins.data = $iron_rank minted_coins.data run return fail
execute unless score $gold minted_coins.data matches 0 unless score $diamond minted_coins.data matches 0 unless score $gold_rank minted_coins.data matches 0 if score $gold_rank minted_coins.data = $diamond_rank minted_coins.data run return fail
execute unless score $copper minted_coins.data matches 0 unless score $iron minted_coins.data matches 0 unless score $copper_rank minted_coins.data matches 0 if score $copper_rank minted_coins.data = $iron_rank minted_coins.data run return fail
execute unless score $copper minted_coins.data matches 0 unless score $diamond minted_coins.data matches 0 unless score $copper_rank minted_coins.data matches 0 if score $copper_rank minted_coins.data = $diamond_rank minted_coins.data run return fail
execute unless score $iron minted_coins.data matches 0 unless score $diamond minted_coins.data matches 0 unless score $iron_rank minted_coins.data matches 0 if score $iron_rank minted_coins.data = $diamond_rank minted_coins.data run return fail
return 1
