execute unless data storage minted_coins:tmp migrate[0] run return 0
data modify storage minted_coins:tmp entry set from storage minted_coins:tmp migrate[0]
function minted_coins:admin/defaults
# the bank: settings, names and former names
data modify storage minted_coins:tmp bank set from storage minted_coins:tmp entry
data remove storage minted_coins:tmp bank.dim
data remove storage minted_coins:tmp bank.x
data remove storage minted_coins:tmp bank.y
data remove storage minted_coins:tmp bank.z
data remove storage minted_coins:tmp bank.bx
data remove storage minted_coins:tmp bank.by
data remove storage minted_coins:tmp bank.bz
data remove storage minted_coins:tmp bank.goto
data remove storage minted_coins:tmp bank.confirm
data remove storage minted_coins:tmp bank.forget
data remove storage minted_coins:tmp bank.edit
data modify storage minted_coins:registry banks append from storage minted_coins:tmp bank
# the mint: same id and name, its position, every family of trades
data modify storage minted_coins:tmp mint set value {trades:{strike:1b,small:1b,convert:1b,buyback:1b,purse:1b}}
data modify storage minted_coins:tmp mint.id set from storage minted_coins:tmp entry.id
data modify storage minted_coins:tmp mint.bank set from storage minted_coins:tmp entry.id
data modify storage minted_coins:tmp mint.name set from storage minted_coins:tmp entry.name
data modify storage minted_coins:tmp mint.dim set from storage minted_coins:tmp entry.dim
data modify storage minted_coins:tmp mint.x set from storage minted_coins:tmp entry.x
data modify storage minted_coins:tmp mint.y set from storage minted_coins:tmp entry.y
data modify storage minted_coins:tmp mint.z set from storage minted_coins:tmp entry.z
data modify storage minted_coins:tmp mint.bx set from storage minted_coins:tmp entry.bx
data modify storage minted_coins:tmp mint.by set from storage minted_coins:tmp entry.by
data modify storage minted_coins:tmp mint.bz set from storage minted_coins:tmp entry.bz
data modify storage minted_coins:registry mints append from storage minted_coins:tmp mint
data remove storage minted_coins:tmp migrate[0]
function minted_coins:bank/migrate_next
