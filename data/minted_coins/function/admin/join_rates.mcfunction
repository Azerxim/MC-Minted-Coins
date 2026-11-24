# minted_coins:tmp rates -> minted_coins:tmp joined: a single text component with the rates separated by " · "
data modify storage minted_coins:tmp joined set value [{text:"",color:"yellow"}]
data modify storage minted_coins:tmp join_queue set from storage minted_coins:tmp rates
function minted_coins:admin/join_next
