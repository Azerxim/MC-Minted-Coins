# as a player: succeeds when one of their purses holds something put in it like in a bundle
execute if items entity @s container.* minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}},!minecraft:bundle_contents=[]] run return 1
execute if items entity @s weapon.offhand minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}},!minecraft:bundle_contents=[]] run return 1
execute if items entity @s player.cursor minecraft:bundle[minecraft:custom_data~{minted_coins:{purse:{}}},!minecraft:bundle_contents=[]] run return 1
return fail
