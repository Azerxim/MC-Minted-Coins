# {key, metal, small}: adds the line "<count> × <coin name>" to the lore of the purse, which is then full
data modify storage minted_coins:tmp purse_io.full set value 1b
$function minted_coins:purse/coin_name {key:"$(key)",metal:"$(metal)",small:$(small)}
data modify storage minted_coins:tmp line set value {translate:"lore.minted_coins.purse_count",fallback:"%s × %s",with:[{text:""},{text:""}],color:"yellow",italic:false}
data modify storage minted_coins:tmp line.with[0].text set from storage minted_coins:tmp coin.count
data modify storage minted_coins:tmp line.with[1] set from storage minted_coins:tmp coin.name
data modify storage minted_coins:tmp purse_io.lore append from storage minted_coins:tmp line
