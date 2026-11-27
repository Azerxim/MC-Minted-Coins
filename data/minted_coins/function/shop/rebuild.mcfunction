# as a shop villager: settles its trades, then replaces it with a new villager (same place, rotation and id) built from its
# entry and its stock. Its sign and click box stay.
function minted_coins:shop/settle
function minted_coins:shop/load_self
execute unless data storage minted_coins:tmp shop run return 0
tag @s add minted_coins.old
execute at @s rotated as @s summon minecraft:villager run function minted_coins:shop/respawn
execute at @s run tp @s ~ -1000 ~
kill @s
