# the exchange office in minted_coins:tmp entry has a fee in % (earlier development versions): its edit dialog suggests
# 10 coins given for 10 - fee / 10 given back (at least 1)
data modify storage minted_coins:tmp form.give set value 10
execute store result score $fee minted_coins.data run data get storage minted_coins:tmp entry.fee
scoreboard players operation $fee minted_coins.data /= $10 minted_coins.data
scoreboard players set $back minted_coins.data 10
scoreboard players operation $back minted_coins.data -= $fee minted_coins.data
execute if score $back minted_coins.data matches ..0 run scoreboard players set $back minted_coins.data 1
execute store result storage minted_coins:tmp form.back int 1 run scoreboard players get $back minted_coins.data
