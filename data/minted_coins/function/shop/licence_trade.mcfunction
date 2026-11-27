# as a mint whose bank (minted_coins:tmp bank) sells shop licences: <licence> coins of <licence_metal> -> 1 licence,
# when the bank strikes that coin (its coin as taken back: minted_coins:tmp coins.buy, set by minted_coins:mint/trades)
execute store result score $licence minted_coins.data run data get storage minted_coins:tmp bank.licence
execute if score $licence minted_coins.data matches ..0 run return 0
function minted_coins:shop/licence_trade_metal with storage minted_coins:tmp bank
