# {key}: turns the plain string minted_coins:tmp purse.names.<key> into {text:...}
data modify storage minted_coins:tmp wrap set value {text:""}
$data modify storage minted_coins:tmp wrap.text set from storage minted_coins:tmp purse.names.$(key)
$data modify storage minted_coins:tmp purse.names.$(key) set from storage minted_coins:tmp wrap
