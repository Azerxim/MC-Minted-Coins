[![Download on Modrinth](https://dl.topazdev.fr/stock/images/web/modrinth.svg)](https://modrinth.com/datapack/minted-coins)

# Minted Coins

A currency nobody can counterfeit. Coins are struck by **mints**: merchants that the server's admins place in the world. No recipe produces coins, so the only way to get them is to bring metal to a mint.

## Features

### Mints

A mint is an immobile, invulnerable merchant that trades:

- 1 gold ingot → 8 gold coins
- 1 copper ingot → 8 copper coins

The number of coins per ingot (1 to 9) is chosen for each mint when it is created.

Coins work anywhere a nugget does, and **9 coins always melt back into 1 ingot** with the vanilla recipe. At 8 coins per ingot, the mint keeps one ninth of the metal (seigniorage): a coin is worth more than the metal in it, so nobody gains anything by melting coins. At 9, a coin is worth exactly its metal.

### Coins can't be counterfeited

Every coin carries the name of the mint that struck it (*Struck by Kingdom of Aldoria*) and its mint id. None of this can be obtained in survival: an anvil can only rename an item, and a renamed nugget shows its name in italics, without the mint line.

Coins from different mints don't stack together, so each civilization can have its own currency.

### Admin menu

Give the admin role to a player (operators only):

```
/tag <player> add minted_coins.admin
```

Admins then open the menu with `/trigger minted_coins` (no operator rights needed):

- **New mint…**: two sliders set the gold and copper coins per ingot (8 by default). The mint appears 2 blocks in front of you, named after the renamed item in your main hand (a name tag renamed in an anvil, for instance), or *Mint #N* otherwise.
- **Mints list**: every mint with its position and rates, with **[Teleport]** and **[Remove]** buttons. Removing a mint doesn't affect the coins it already struck.

Players without the tag can't use the trigger.

### Resource packs

Without a resource pack, coins look like nuggets with their own name. Each coin carries a `custom_model_data` string (`minted_coins:copper_coin`, `minted_coins:gold_coin`) that a resource pack can use to give them a dedicated model.

## 📦 Compatibility

| | |
|---|---|
| **Minecraft versions** | 26.3 |
| **Type** | Data Pack (no mods required) |
| **License** | MIT |

## 📥 Installation

Like any data pack: drop the downloaded folder into `.minecraft/saves/<your_world>/datapacks/`, then run `/reload` or restart the world.
