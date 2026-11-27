# {metal, model, color}, once the new names are in minted_coins:tmp bank and minted_coins:tmp small_names:
# when the name of the small coins of this metal changed (renamed coin or new small coin name), keeps the former one
# (minted_coins:tmp small_old) in mint.legacy_small, so that the mint exchanges the small coins already struck
execute unless data storage minted_coins:tmp small_old{small:1} run return 0
# a coin the mint didn't strike (mint.<metal> is still the rate before the edit) has no small coins
$execute if data storage minted_coins:tmp bank{$(metal):0} run return 0
$data modify storage minted_coins:tmp legacy_cmp set from storage minted_coins:tmp small_old.$(metal)
$execute store success score $changed minted_coins.data run data modify storage minted_coins:tmp legacy_cmp set from storage minted_coins:tmp small_names.$(metal)
execute if score $changed minted_coins.data matches 0 run return 0
# back to a former name: small coins under it are current again; the former name is kept only once
$data modify storage minted_coins:tmp legacy_forget set value {metal:"$(metal)"}
$data modify storage minted_coins:tmp legacy_forget.name set from storage minted_coins:tmp small_names.$(metal)
function minted_coins:mint/legacy_small_forget with storage minted_coins:tmp legacy_forget
$data modify storage minted_coins:tmp legacy_forget.name set from storage minted_coins:tmp small_old.$(metal)
function minted_coins:mint/legacy_small_forget with storage minted_coins:tmp legacy_forget
execute unless data storage minted_coins:tmp bank.legacy_small run data modify storage minted_coins:tmp bank.legacy_small set value []
$data modify storage minted_coins:tmp bank.legacy_small append value {metal:"$(metal)",model:"$(model)",color:$(color)}
$data modify storage minted_coins:tmp bank.legacy_small[-1].name set from storage minted_coins:tmp small_old.$(metal)
