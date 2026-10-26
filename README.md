[![Download on Modrinth](https://dl.topazdev.fr/stock/images/web/modrinth.svg)](https://modrinth.com/datapack/minted-coins)

# Minted Coins

A currency nobody can counterfeit. Coins are struck by **mints**: merchants that the server's admins place in the world. No recipe produces coins, so the only way to get them is to bring metal to a mint.

## Features

### Mints

A mint is an immobile, invulnerable merchant that trades:

- 1 gold ingot → 8 gold coins
- 1 copper ingot → 8 copper coins
- 1 iron ingot → 8 iron coins
- 1 diamond → 8 diamond coins
- 9 of its own diamond coins → 1 diamond

The number of coins per ingot or diamond (0 to 9) is chosen for each mint when it is created. At 0, the mint doesn't strike that coin at all and the trade doesn't appear, so a mint can strike only gold, for instance.

Coins work anywhere a nugget does, and **9 coins always melt back into 1 ingot** with the vanilla recipe. At 8 coins per ingot, the mint keeps one ninth of the metal (seigniorage): a coin is worth more than the metal in it, so nobody gains anything by melting coins. At 9, a coin is worth exactly its metal.

There is no diamond nugget, so diamond coins are struck on prismarine crystals. A recipe can't tell a coin from plain crystals, so instead of a recipe, **each mint buys back 9 of its own diamond coins for 1 diamond**: coins from another mint, or plain prismarine crystals, are refused.

### Coins can't be counterfeited

Every coin carries the name of the mint that struck it (*Struck by Kingdom of Aldoria*) and its mint id. None of this can be obtained in survival: an anvil can only rename an item, and a renamed nugget or crystal shows its name in italics, without the mint line.

Coins from different mints don't stack together, so each civilization can have its own currency, with its own coin names.

### Admin menu

Give the admin role to a player (operators only):

```
/tag <player> add minted_coins.admin
```

Admins then open the menu with `/trigger minted_coins` (no operator rights needed):

- **New mint…**: four sliders set the gold, copper, iron and diamond coins per ingot or diamond (8 by default, 0 to leave a coin out). The mint appears 2 blocks in front of you, named after the renamed item in your main hand (a name tag renamed in an anvil, for instance), or *Mint #N* otherwise. Its coins are named the same way: a gold nugget renamed *Aldorian Crown* in your inventory names the gold coins, a renamed copper or iron nugget names the copper or iron coins, renamed prismarine crystals name the diamond coins (*Gold Coin*, *Copper Coin*, *Iron Coin* and *Diamond Coin* otherwise). These items are only read, not consumed.
- **Mints list**: every mint with its position and rates, with **[Teleport]** and **[Remove]** buttons. Removing a mint doesn't affect the coins it already struck.

Players without the tag can't use the trigger.

### Resource packs

Without a resource pack, coins look like nuggets (or prismarine crystals) with their own name. Each coin carries a `custom_model_data` string (`minted_coins:copper_coin`, `minted_coins:iron_coin`, `minted_coins:gold_coin`, `minted_coins:diamond_coin`) that a resource pack can use to give them a dedicated model.

## 📦 Compatibility

|                              |                              |
| ---------------------------- | ---------------------------- |
| **Minecraft versions** | 26.3                         |
| **Type**               | Data Pack (no mods required) |
| **License**            | MIT                          |

## 📥 Installation

Like any data pack: drop the downloaded folder into `.minecraft/saves/<your_world>/datapacks/`, then run `/reload` or restart the world.
