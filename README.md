[![Download on CurseForge](https://dl.topazdev.fr/stock/images/web/curseforge.svg)](https://www.curseforge.com/minecraft/data-packs/minted-coins) [![Download on Modrinth](https://dl.topazdev.fr/stock/images/web/modrinth.svg)](https://modrinth.com/datapack/minted-coins)

# Minted Coins

A currency nobody can counterfeit. Coins are struck by **mints**: merchants that the server's operators place in the world. No recipe produces coins, so the only way to get them is to bring metal to a mint.

## Features

### Mints

A mint is an immobile, invulnerable merchant that trades:

- 1 gold ingot → 8 gold coins
- 1 copper ingot → 8 copper coins
- 1 iron ingot → 8 iron coins
- 1 diamond → 8 diamond coins
- 9 of its own diamond coins → 1 diamond
- with small change: 1 coin → as many small coins as it strikes coins per ingot (or per diamond), and back, for each metal it strikes
- conversion: 64 copper coins ↔ 1 iron coin, 64 iron coins ↔ 1 gold coin, 64 gold coins ↔ 1 diamond coin (the order can be changed)

The mint stands behind its **counter**, with a coin press, scales and stacks of coins (a 3D model of the resource pack; without it, a barrel). The counter has no hitbox: clicks go through to the merchant. It goes away with the mint.

The number of coins per ingot or diamond (0 to 9) is chosen for each mint when it is created. At 0, the mint doesn't strike that coin at all and the trade doesn't appear, so a mint can strike only gold, for instance.

Coins work anywhere a nugget does, and **9 coins always melt back into 1 ingot** with the vanilla recipe. At 8 coins per ingot, the mint keeps one ninth of the metal (seigniorage): a coin is worth more than the metal in it, so nobody gains anything by melting coins. At 9, a coin is worth exactly its metal.

There is no diamond nugget, so diamond coins are struck on prismarine crystals. A recipe can't tell a coin from plain crystals, so instead of a recipe, **each mint buys back 9 of its own diamond coins for 1 diamond**: coins from another mint, or plain prismarine crystals, are refused.

### Small change

When a mint is created with **Small change** ticked, it also changes each of its coins into small coins (*Small Gold Coin*, etc.), as many as it strikes coins per ingot (or per diamond), and that many of its own small coins back into 1 coin. At 8 coins per ingot, 1 coin is worth 8 small coins. Small coins are struck on firework stars, tinted with the colour of their metal: no recipe turns them into anything worth more, and only the mint that struck them takes them back.

### Conversion

Each coin has a **conversion order**, a number from 0 to 4 set for each mint when it is created or edited. The mint changes 64 of its coins of one number into 1 of its coins of the next number among the coins it strikes, and 1 into 64 back. By default copper is 1, iron 2, gold 3 and diamond 4: 64 copper coins = 1 iron coin, 64 iron coins = 1 gold coin, 64 gold coins = 1 diamond coin. A coin set to 0, or not struck, is left out of the chain: without iron, 64 copper coins are worth 1 gold coin. Two struck coins can't share a number. Mints created before this version get the conversion trades once edited.

### Purse

Each mint also sells its **purse** for 1 leather and 1 string. It works like a bundle, **without any limit**: in your inventory, put coins of its mint in it (coins and small coins, whatever name they were struck under), take them out, pick which ones with the scroll wheel. The bundle shows up to 32 coins and keeps the rest in reserve: as you take coins out, it shows more. Anything else put in it is handed back.

Its tooltip gives the total of each kind of coin, and it looks full or empty. Right-clicking with it doesn't spill your coins: unlike a bundle, it puts the coins it shows back in its reserve while you hold the button, and shows them again once you let go. Coins taken out come back exactly as the mint strikes them, under its current names, so they stack with the others. It is a physical item: whoever holds it holds the coins. Without the resource pack, it looks like a bundle.

In creative mode, the purse is a plain bundle (64 coins at most): the creative inventory sends the client's copy of each slot back to the server, which would undo every change of the purse. Back in survival or adventure mode, its reserve takes in what it holds at the next change of the inventory.

### Coins can't be counterfeited

Every coin carries the name of the mint that struck it (*Struck by Kingdom of Aldoria*) and its mint id. None of this can be obtained in survival: an anvil can only rename an item, and a renamed nugget or crystal shows its name in italics, without the mint line.

Coins from different mints don't stack together, so each civilization can have its own currency, with its own coin names.

### Operator menu

The menu relies on Minecraft's own operator system: no tag or role to set up. An operator (permission level 2 or more, the level `/function` requires) opens it the first time with:

```
/function minted_coins:mint/menu
```

This also authorizes them: from then on, `/trigger minted_coins.mint.menu` opens the menu, even after a reconnection. Every player can type the trigger, but players who were never authorized only get a message in the chat explaining that the menu is for operators.

- **New mint…**: a field sets the name of the mint, then, for each coin, a field sets its name and a slider sets the coins per ingot or diamond (8 by default, 0 to leave a coin out); a slider sets its conversion order (copper 1, iron 2, gold 3, diamond 4 by default, 0 for none); a checkbox adds small change. The mint appears 2 blocks in front of you. A name left empty is taken from a renamed item: the item in your main hand (a name tag renamed in an anvil, for instance) names the mint, a gold nugget renamed *Aldorian Crown* in your inventory names the gold coins, a renamed copper or iron nugget names the copper or iron coins, renamed prismarine crystals name the diamond coins. These items are only read, not consumed. Otherwise the defaults are *Mint #N*, *Gold Coin*, *Copper Coin*, *Iron Coin* and *Diamond Coin*. The **Create the mint** button runs `/function minted_coins:admin/create`, so Minecraft asks you to confirm this operator command. A name can't contain a double quote (`"`).
- **Mints list**: one button per mint (hover it to see its rates). Each opens the page of the mint, with its position and rates, a **Teleport** button, an **Edit…** button and a **Remove…** button that asks for confirmation. Removing a mint doesn't affect the coins it already struck.
- **Edit…**: the same fields as **New mint…**, filled with the current values: names of the mint and of its coins (a name left empty keeps the current one), rates, conversion order and small change. Saving replaces the mint with a new one at the same place, with the same mint id, so the coins it already struck stay its own. Renamed coins: the coins already struck keep their old name, and the mint gets a recoinage trade that exchanges them one for one for coins under the new name (small coins too, when the mint had small change). Each former name keeps its trade; going back to a former name removes it. A coin set to 0 is no longer struck, changed or bought back by this mint. Like **Create the mint**, **Save** runs an operator command that Minecraft asks you to confirm.
- **Help…**: how mints, coins, names and editing work, and who can use the menu.

The other buttons in the menus use `/trigger minted_coins.mint.menu`, so no confirmation screen appears. Minecraft doesn't tell data packs who is an operator, so the authorization stays when a player loses operator rights: remove it with `/execute as <player> run function minted_coins:revoke`, or for everyone with `/scoreboard players reset * minted_coins.op`. An operator can authorize another player with `/execute as <player> run function minted_coins:mint/menu`.

Dialogs are only loaded with the world: after updating the data pack, `/reload` is not enough for the menus, leave and rejoin the world.

### Resource packs

Every menu and chat message is translatable: the data pack shows English text, and the companion resource pack translates it (English and French) and adds coin icons to the menus.

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
