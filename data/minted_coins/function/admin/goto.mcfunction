scoreboard players operation $target minted_coins.data = $action minted_coins.data
scoreboard players remove $target minted_coins.data 100000
execute store success score $ok minted_coins.data run function minted_coins:admin/select_mint
execute if score $ok minted_coins.data matches 1 run function minted_coins:admin/goto_entry with storage minted_coins:tmp entry
