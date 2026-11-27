# minted_coins:exchange/fit: tries $try = 1, 2… coins given; stops at the first one that fits ($x set), or past 64
scoreboard players add $try minted_coins.data 1
execute if score $try minted_coins.data matches 65.. run return run scoreboard players set $try minted_coins.data 0
# $y = floor($try × $rt × $kn / ($rf × $kd))
scoreboard players operation $num minted_coins.data = $try minted_coins.data
scoreboard players operation $num minted_coins.data *= $rt minted_coins.data
scoreboard players operation $num minted_coins.data *= $kn minted_coins.data
scoreboard players operation $den minted_coins.data = $rf minted_coins.data
scoreboard players operation $den minted_coins.data *= $kd minted_coins.data
scoreboard players operation $y minted_coins.data = $num minted_coins.data
scoreboard players operation $y minted_coins.data /= $den minted_coins.data
# too many coins back: no smaller trade can fit any more
execute if score $y minted_coins.data matches 65.. run return run scoreboard players set $try minted_coins.data 0
# rounding within $tol % of the metal given: $y × $rf × $kd × 100 >= $try × $rt × ($kn × 100 - $tol × $kd)
scoreboard players operation $lhs minted_coins.data = $y minted_coins.data
scoreboard players operation $lhs minted_coins.data *= $den minted_coins.data
scoreboard players operation $lhs minted_coins.data *= $100 minted_coins.data
scoreboard players operation $rhs minted_coins.data = $kn minted_coins.data
scoreboard players operation $rhs minted_coins.data *= $100 minted_coins.data
scoreboard players operation $tk minted_coins.data = $tol minted_coins.data
scoreboard players operation $tk minted_coins.data *= $kd minted_coins.data
scoreboard players operation $rhs minted_coins.data -= $tk minted_coins.data
scoreboard players operation $rhs minted_coins.data *= $try minted_coins.data
scoreboard players operation $rhs minted_coins.data *= $rt minted_coins.data
execute if score $y minted_coins.data matches 1.. if score $lhs minted_coins.data >= $rhs minted_coins.data run scoreboard players operation $x minted_coins.data = $try minted_coins.data
execute if score $x minted_coins.data matches 1.. run return run scoreboard players set $try minted_coins.data 0
function minted_coins:exchange/fit_next
