# minted_coins:exchange/build, for an office of earlier development versions with a fee in %: 100 coins -> 100 - fee
scoreboard players set $kd minted_coins.data 100
execute store result score $fee minted_coins.data run data get storage minted_coins:tmp mint.fee
scoreboard players set $kn minted_coins.data 100
scoreboard players operation $kn minted_coins.data -= $fee minted_coins.data
