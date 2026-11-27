[![Download on CurseForge](https://dl.topazdev.fr/stock/images/web/curseforge.svg)](https://www.curseforge.com/minecraft/data-packs/minted-coins) [![Download on Modrinth](https://dl.topazdev.fr/stock/images/web/modrinth.svg)](https://modrinth.com/datapack/minted-coins)

# Minted Coins

A currency nobody can counterfeit. Coins are struck by **mints**: merchants that the server's operators place in the world. No recipe produces coins, so the only way to get them is to bring metal to a mint.

## Features

### Banks and mints

A **bank** is a currency. It sets everything about its coins: their names, how many it strikes per ingot or diamond, small change and conversion order. A bank can have any number of mints, placed anywhere in the world: they all strike the same coins, under the same names and at the same rates, and each one takes back the coins struck by the others. Editing a bank updates all its mints at once.

Each **mint** only chooses which families of trades it offers, so that one mint can strike coins while another one only gives change:

- **Strike**: 1 gold ingot → 8 gold coins, 1 copper ingot → 8 copper coins, 1 iron ingot → 8 iron coins, 1 diamond → 8 diamond coins
- **Small change**: 1 coin → as many small coins as the bank strikes coins per ingot (or per diamond), and back, for each metal
- **Conversion**: 64 copper coins ↔ 1 iron coin, 64 iron coins ↔ 1 gold coin, 64 gold coins ↔ 1 diamond coin (the order can be changed)
- **Diamond buyback**: 9 diamond coins of the bank → 1 diamond
- **Purse**: 1 leather + 1 string → the purse of the bank

A mint is an immobile, invulnerable merchant with its own name above its head. It stands behind its **counter**, with a coin press, scales and stacks of coins (a 3D model of the resource pack; without it, a barrel). The counter has no hitbox: clicks go through to the merchant. It goes away with the mint.

The number of coins per ingot or diamond (0 to 9) is chosen for each bank. At 0, the bank doesn't strike that coin at all and its trades don't appear, so a bank can strike only gold, for instance.

Coins work anywhere a nugget does, and **9 coins always melt back into 1 ingot** with the vanilla recipe. At 8 coins per ingot, the bank keeps one ninth of the metal (seigniorage): a coin is worth more than the metal in it, so nobody gains anything by melting coins. At 9, a coin is worth exactly its metal.

There is no diamond nugget, so diamond coins are struck on prismarine crystals. A recipe can't tell a coin from plain crystals, so instead of a recipe, **mints buy back 9 diamond coins of their bank for 1 diamond**: coins from another bank, or plain prismarine crystals, are refused.

### Exchange offices

An **exchange office** belongs to a bank too, and is placed from its page. It changes the coins of the banks ticked for it for coins of its own bank, and back, metal by metal: gold coins for gold coins, iron coins for iron coins, and so on, for the metals both banks strike. Small coins are not changed.

The rate follows the metal: if one bank strikes 8 gold coins per ingot and the other 9, 9 coins of the second are worth 8 of the first. The office keeps a **fee**, from 0 to 50 % (10 % by default): it gives back that much less metal than it receives. Each trade is the smallest one that gives exactly the fee, or at most 2 points more, rounded against the player; at 10 % between two banks with the same rate, 10 coins of one give 9 of the other.

Coins given by an exchange office are exactly those of their bank (*Struck by* that bank), so they stack with the others and its mints take them back. Coins struck under a former name of a bank are not changed: its mints exchange them first. Editing a bank updates the rates of every exchange office that changes its coins.

### Shops

Players can open their own **shop**: a villager that sells and buys goods for coins, with its stock in a chest or barrel they fill themselves.

- **Licence**: mints with the *Shop licence* trade sell it at the price set by their bank (for instance 5 gold coins; 0 = no licence). Using it (like eating, for a moment) while looking at a chest or barrel, within 5 blocks, opens the shop: a merchant stands on the container, a sign floats above it, and the player gets the **shop key**. The merchant needs 3 free blocks above the container; otherwise the licence is handed back.
- **Stock**: the container only opens for a player holding the key in their main hand. Everything the shop sells comes out of it, everything it buys or earns goes into it (on top of it when it is full).
- **Offers**: carrying the key, click the sign above the merchant. Hold the goods in the main hand and their price, in coins of any bank, in the off hand: the stack sizes give the quantity and the price (4 bread in the main hand and 3 coins in the off hand: 4 bread for 3 coins). **Sell** makes the merchant sell the goods for the coins, **Buy** makes it buy them. The exact item is kept, enchantments and name included. A shop has up to 12 offers, each removable from the same menu, which also shows what the stock allows for each one. **Rename** gives the shop the name of the item in the main hand (a name tag renamed in an anvil); **Close the shop…** unlocks the container with everything in it and hands the licence back.
- **Trades** run out with the stock: a sale can be used as many times as there are goods, a purchase as many times as there are coins to pay. When the owner adds or takes out goods, the merchant follows within a second (and at once when the stock gets too low for its trades); a trading screen open on it then closes, so that it never trades what it no longer has.
- **The key** is an item: whoever holds it manages the shop. Give it to someone and they own the shop.

Operators see the shops of each bank (the bank that issued their licence) on its page, to teleport to them or remove them. In vanilla, nothing stops a player from breaking the container or putting a hopper under it: protect shops with the usual means of the server (claims, adventure mode, spawn protection).

### Small change

When a bank has **Small change** ticked, its mints also change each coin into small coins (*Small Gold Coin*, etc.), as many as the bank strikes coins per ingot (or per diamond), and that many small coins back into 1 coin. At 8 coins per ingot, 1 coin is worth 8 small coins. Small coins are struck on firework stars, tinted with the colour of their metal: no recipe turns them into anything worth more, and only the mints of their bank take them back.

A single **Small coin name** field names the small coins of all four metals: it is a pattern where `%s` stands for the coin name. *Half %s* gives *Half Gold Coin* or *Half Aldorian Crown*, *%s Shard* gives *Gold Coin Shard*. Left empty, it keeps *Small %s*, translated by the resource pack (*Petite Pièce d'or* in French). A pattern without `%s` gives all small coins the same name, told apart only by their colour.

### Conversion

Each coin has a **conversion order**, a number from 0 to 4 set for each bank. Mints change 64 coins of one number into 1 coin of the next number among the coins the bank strikes, and 1 into 64 back. By default copper is 1, iron 2, gold 3 and diamond 4: 64 copper coins = 1 iron coin, 64 iron coins = 1 gold coin, 64 gold coins = 1 diamond coin. A coin set to 0, or not struck, is left out of the chain: without iron, 64 copper coins are worth 1 gold coin. Two struck coins can't share a number. Banks that come from mints of version 1.0 get the conversion trades once edited.

### Purse

Mints can sell the **purse** of their bank for 1 leather and 1 string. It works like a bundle, **without any limit**: in your inventory, put coins of its bank in it (coins and small coins, whatever name they were struck under), take them out, pick which ones with the scroll wheel. The bundle shows up to 32 coins and keeps the rest in reserve: as you take coins out, it shows more. Anything else put in it is handed back.

Its tooltip gives the total of each kind of coin, and it looks full or empty. Right-clicking with it doesn't spill your coins: unlike a bundle, it puts the coins it shows back in its reserve while you hold the button, and shows them again once you let go. Coins taken out come back exactly as the bank strikes them, under its current names, so they stack with the others. It is a physical item: whoever holds it holds the coins. Without the resource pack, it looks like a bundle.

In creative mode, the purse is a plain bundle (64 coins at most): the creative inventory sends the client's copy of each slot back to the server, which would undo every change of the purse. Back in survival or adventure mode, its reserve takes in what it holds at the next change of the inventory.

### Coins can't be counterfeited

Every coin carries the name of the bank that struck it (*Struck by Kingdom of Aldoria*) and its bank id. None of this can be obtained in survival: an anvil can only rename an item, and a renamed nugget or crystal shows its name in italics, without the bank line.

Coins from different banks don't stack together, so each civilization can have its own currency, with its own coin names.

### Operator menu

The menu relies on Minecraft's own operator system: no tag or role to set up. An operator (permission level 2 or more, the level `/function` requires) opens it the first time with:

```
/function minted_coins:mint/menu
```

This also authorizes them: from then on, `/trigger minted_coins.mint.menu` opens the menu, even after a reconnection. Every player can type the trigger, but players who were never authorized only get a message in the chat explaining that the menu is for operators.

- **New bank…**: a field sets the name of the bank, then, for each coin, a field sets its name and a slider sets the coins per ingot or diamond (8 by default, 0 to leave a coin out); a slider sets its conversion order (copper 1, iron 2, gold 3, diamond 4 by default, 0 for none); a checkbox adds small change and a field sets the small coin name (`%s` = the coin name). A name left empty is taken from a renamed item: the item in your main hand (a name tag renamed in an anvil, for instance) names the bank, a gold nugget renamed *Aldorian Crown* in your inventory names the gold coins, a renamed copper or iron nugget names the copper or iron coins, renamed prismarine crystals name the diamond coins. These items are only read, not consumed. Otherwise the defaults are *Bank #N*, *Gold Coin*, *Copper Coin*, *Iron Coin* and *Diamond Coin*. A name can't contain a double quote (`"`).
- **Banks**: one button per bank (hover it to see its rates). Each opens the page of the bank, with its rates, one button per mint, and:
  - **New mint here…**: a field sets the name of the mint (empty = the name of the bank) and five checkboxes its families of trades. The mint appears 2 blocks in front of you.
  - **Edit bank…**: the same fields as **New bank…**, filled with the current values (a name left empty keeps the current one). Every mint of the bank rebuilds its trades. Renamed coins: the coins already struck keep their old name, and the mints get a recoinage trade that exchanges them one for one for coins under the new name (small coins too, when the bank has small change, including when only the small coin name changed). Each former name keeps its trade; going back to a former name removes it. A coin set to 0 is no longer struck, changed or bought back by the mints of the bank.
  - **Remove bank…** (with confirmation): removes the bank, all its mints and exchange offices. Coins already struck keep their names, but no mint changes or buys them back any more.
  - **New exchange office here…**: a field sets its name (empty = *Exchange office of* the bank), a slider its fee and one checkbox per other bank the banks it changes with. It appears 2 blocks in front of you.
- **The page of a mint** (or of an exchange office, marked ⇄) gives its position and trades, with a **Teleport** button, an **Edit…** button (its name and families of trades, or for an exchange office its name, fee and banks) and a **Remove…** button that asks for confirmation. Removing a mint doesn't affect the coins of its bank.
- **Help…**: how banks, mints, coins, names and editing work, and who can use the menu.

Creating or editing a bank or a mint runs an operator command (`/function minted_coins:admin/…`), so Minecraft asks you to confirm it. The other buttons use `/trigger minted_coins.mint.menu`, so no confirmation screen appears. Mints that aren't loaded follow the changes the next time their chunk is loaded, and removed mints go away then. Minecraft doesn't tell data packs who is an operator, so the authorization stays when a player loses operator rights: remove it with `/execute as <player> run function minted_coins:revoke`, or for everyone with `/scoreboard players reset * minted_coins.op`. An operator can authorize another player with `/execute as <player> run function minted_coins:mint/menu`.

Dialogs are only loaded with the world: after updating the data pack, `/reload` is not enough for the menus, leave and rejoin the world.

### Updating from version 1.0

Each mint of version 1.0 becomes a bank with the same name, coins and settings, and the mint joins it with every family of trades. Its coins and purses already carry the id of that bank: they stay valid, and the mints rebuild their trades by themselves.

### Resource packs

Every menu and chat message is translatable: the data pack shows English text, and the companion resource pack translates it (English, French, German and Spanish) and adds coin icons to the menus.

Without a resource pack, coins look like nuggets (or prismarine crystals) with their own name. Each coin carries a `custom_model_data` string (`minted_coins:copper_coin`, `minted_coins:iron_coin`, `minted_coins:gold_coin`, `minted_coins:diamond_coin`, and `minted_coins:small_<metal>_coin` for small coins) that a resource pack can use to give them a dedicated model.

## 📦 Compatibility

|                              |                              |
| ---------------------------- | ---------------------------- |
| **Minecraft versions** | 26.3                         |
| **Type**               | Data Pack (no mods required) |
| **License**            | All Rights Reserved ([details](LICENSE)) |

## 📥 Installation

Like any data pack: drop the downloaded folder into `.minecraft/saves/<your_world>/datapacks/`, then run `/reload` or restart the world.

## 📄 License

Minted Coins © 2026 Azerxim. All rights reserved: you may play with it, use it on servers, add it to modpacks that download it from its official page and show it in videos, but not re-upload it or share a modified version. See [LICENSE](LICENSE) for the details.
