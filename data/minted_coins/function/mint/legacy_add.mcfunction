# {metal, item, model, color}, before the new name of this coin replaces minted_coins:tmp bank.<metal>_name:
# keeps the current name in mint.legacy, so that the mint exchanges the coins already struck (small coins: minted_coins:mint/legacy_small_add)
data modify storage minted_coins:tmp legacy_new set value {text:""}
$data modify storage minted_coins:tmp legacy_new.text set from storage minted_coins:tmp new_coin_names.$(metal)
$data modify storage minted_coins:tmp legacy_old set from storage minted_coins:tmp bank.$(metal)_name
data modify storage minted_coins:tmp legacy_cmp set from storage minted_coins:tmp legacy_old
execute store success score $changed minted_coins.data run data modify storage minted_coins:tmp legacy_cmp set from storage minted_coins:tmp legacy_new
execute if score $changed minted_coins.data matches 0 run return 0
# back to a former name: coins under that name are current again
$data modify storage minted_coins:tmp legacy_forget set value {metal:"$(metal)"}
data modify storage minted_coins:tmp legacy_forget.name set from storage minted_coins:tmp legacy_new
function minted_coins:mint/legacy_forget with storage minted_coins:tmp legacy_forget
execute unless data storage minted_coins:tmp bank.legacy run data modify storage minted_coins:tmp bank.legacy set value []
$data modify storage minted_coins:tmp bank.legacy append value {metal:"$(metal)",item:"$(item)",model:"$(model)",color:$(color),small:0}
data modify storage minted_coins:tmp bank.legacy[-1].name set from storage minted_coins:tmp legacy_old
