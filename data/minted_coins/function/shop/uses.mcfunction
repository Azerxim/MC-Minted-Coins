# {i}: $uses / $max = the uses and max uses of trade i of the villager
$execute store result score $uses minted_coins.data run data get entity @s Offers.Recipes[$(i)].uses
$execute store result score $max minted_coins.data run data get entity @s Offers.Recipes[$(i)].maxUses
