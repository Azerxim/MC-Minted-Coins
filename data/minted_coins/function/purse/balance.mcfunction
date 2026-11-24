# minted_coins:tmp purse: <kind> is the reserve and shown.<kind> what the bundle holds; shares the 32 coins the bundle shows
# between the kinds the purse holds, the rest going to the reserve
scoreboard players set $kinds minted_coins.data 0
function minted_coins:purse/total {key:"gold"}
function minted_coins:purse/total {key:"copper"}
function minted_coins:purse/total {key:"iron"}
function minted_coins:purse/total {key:"diamond"}
function minted_coins:purse/total {key:"small_gold"}
function minted_coins:purse/total {key:"small_copper"}
function minted_coins:purse/total {key:"small_iron"}
function minted_coins:purse/total {key:"small_diamond"}
scoreboard players set $cap minted_coins.data 32
execute if score $kinds minted_coins.data matches 1.. run scoreboard players operation $cap minted_coins.data /= $kinds minted_coins.data
# while the purse is used, its bundle shows nothing, so that it has nothing to drop
execute if score $stow minted_coins.data matches 1 run scoreboard players set $cap minted_coins.data 0
function minted_coins:purse/split {key:"gold"}
function minted_coins:purse/split {key:"copper"}
function minted_coins:purse/split {key:"iron"}
function minted_coins:purse/split {key:"diamond"}
function minted_coins:purse/split {key:"small_gold"}
function minted_coins:purse/split {key:"small_copper"}
function minted_coins:purse/split {key:"small_iron"}
function minted_coins:purse/split {key:"small_diamond"}
