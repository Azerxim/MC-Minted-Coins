# minted_coins:tmp key {id, components} = the key of the shop minted_coins:tmp shop: it opens the stock container
# when held, and its holder manages the shop
data modify storage minted_coins:tmp key set value {id:"minecraft:tripwire_hook",components:{"minecraft:item_name":{translate:"item.minted_coins.shop_key",fallback:"Shop Key"},"minecraft:lore":[{translate:"%s",with:[""],color:"gray",italic:false},{translate:"lore.minted_coins.key_use",fallback:"Hold it to open the stock; carry it to manage the shop",color:"dark_gray",italic:false}],"minecraft:custom_data":{minted_coins:{key:0}},"minecraft:custom_model_data":{strings:["minted_coins:shop_key"]},"minecraft:max_stack_size":1,"minecraft:enchantment_glint_override":true}}
data modify storage minted_coins:tmp key.components."minecraft:lore"[0].with[0] set from storage minted_coins:tmp shop.name
data modify storage minted_coins:tmp key.components."minecraft:custom_data".minted_coins.key set from storage minted_coins:tmp shop.id
