# on load, once: the mints of earlier versions held their own settings. Each becomes a bank with the same id, name and settings
# (the coins it struck carry that id, so they stay valid), and the mint joins it with every family of trades
data modify storage minted_coins:registry banks set value []
data modify storage minted_coins:tmp migrate set from storage minted_coins:registry mints
data modify storage minted_coins:registry mints set value []
function minted_coins:bank/migrate_next
