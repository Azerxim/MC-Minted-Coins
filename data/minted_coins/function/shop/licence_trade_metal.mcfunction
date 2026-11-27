# {licence_metal}: the licence trade, if the bank strikes this coin
$execute unless data storage minted_coins:tmp bank{$(licence_metal):0} if data storage minted_coins:tmp bank.$(licence_metal) run function minted_coins:shop/licence_trade_add {metal:"$(licence_metal)"}
