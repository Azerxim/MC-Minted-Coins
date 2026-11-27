# as the click box of a shop that was clicked: by the player tagged minted_coins.clicker?
data modify storage minted_coins:tmp cmp set from storage minted_coins:tmp clicker
execute store success score $diff minted_coins.data run data modify storage minted_coins:tmp cmp set from entity @s interaction.player
data remove entity @s interaction
execute unless score $diff minted_coins.data matches 0 run return 0
scoreboard players set $clicked minted_coins.data 1
scoreboard players operation @a[tag=minted_coins.clicker,limit=1] minted_coins.shop_sel = @s minted_coins.id
