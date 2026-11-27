# {id}: locks the container here: it only opens for a player holding the key of shop id
$data modify block ~ ~ ~ lock set value {predicates:{"minecraft:custom_data":{minted_coins:{key:$(id)}}}}
