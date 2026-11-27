# the trigger was named minted_coins, then minted_coins.menu, before
scoreboard objectives remove minted_coins
scoreboard objectives remove minted_coins.menu
scoreboard objectives add minted_coins.mint.menu trigger
scoreboard objectives add minted_coins.data dummy
scoreboard objectives add minted_coins.id dummy
scoreboard objectives add minted_coins.trades dummy
# mints: the bank they belong to, and the version of the configuration their trades were built from
scoreboard objectives add minted_coins.bank dummy
scoreboard objectives add minted_coins.ver dummy
# shops: /trigger minted_coins.shop is open to every player (the menu of the shop they selected, checked against its key);
# the shop they clicked, the bank of the licence they use, and for shop villagers the version of their offers and a cooldown
scoreboard objectives add minted_coins.shop trigger
scoreboard objectives add minted_coins.shop_sel dummy
scoreboard objectives add minted_coins.licence dummy
scoreboard objectives add minted_coins.shop_ver dummy
scoreboard objectives add minted_coins.shop_cd dummy
# players authorized by /function minted_coins:mint/menu
scoreboard objectives add minted_coins.op dummy
# purses: ticks left before the bundle refills after a right click (earlier development versions: purse_use, purse)
scoreboard objectives remove minted_coins.purse_use
scoreboard objectives remove minted_coins.purse
scoreboard objectives add minted_coins.purse_cd dummy
# menu sessions of earlier development versions
scoreboard objectives remove minted_coins.session
scoreboard objectives remove minted_coins.left
scoreboard players reset * minted_coins.mint.menu
scoreboard players set $10 minted_coins.data 10
scoreboard players set $100 minted_coins.data 100
scoreboard players set $1000 minted_coins.data 1000
scoreboard players set $10000 minted_coins.data 10000
# purse macros test $small_0 / $small_1 to tell small coins apart
scoreboard players set $small_0 minted_coins.data 0
scoreboard players set $small_1 minted_coins.data 1
# purses: set while a used purse puts its coins back in its reserve
scoreboard players set $stow minted_coins.data 0
execute unless score $last_id minted_coins.data matches 0.. run scoreboard players set $last_id minted_coins.data 0
execute unless data storage minted_coins:registry mints run data modify storage minted_coins:registry mints set value []
# banks: ids follow the ids of the mints of earlier versions, each of which becomes a bank with the same id (its coins carry that id)
execute unless score $last_bank minted_coins.data matches 0.. run scoreboard players operation $last_bank minted_coins.data = $last_id minted_coins.data
execute unless data storage minted_coins:registry banks run function minted_coins:bank/migrate
execute unless data storage minted_coins:registry shops run data modify storage minted_coins:registry shops set value []
execute unless score $last_shop minted_coins.data matches 0.. run scoreboard players set $last_shop minted_coins.data 0
# every mint rebuilds its trades from the registry the next time it is loaded (the data pack may have changed)
scoreboard players add $config_ver minted_coins.data 1
