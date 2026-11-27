# {licence_metal}: ticks the current licence coin in the edit dialog of the bank
$data modify storage minted_coins:tmp show.dialog.inputs[16].options[{id:"$(licence_metal)"}].initial set value true
