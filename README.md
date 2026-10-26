[![Download on Modrinth](https://dl.topazdev.fr/stock/images/web/modrinth.svg)](https://modrinth.com/datapack/minted-coins)

# Minted Coins

Need a currency for your server that nobody can print out of thin air? Minted Coins lets you strike copper and gold coins at the stonecutter. Each coin is worth exactly the metal it was struck from, so the money supply follows what players actually mine.

## Features

### Stonecutter

**Copper coins**
- 1 copper ingot → 9 copper coins
- 1 copper nugget → 1 copper coin

**Gold coins**
- 1 gold ingot → 9 gold coins
- 1 gold nugget → 1 gold coin

### Melting coins back

A coin is still a nugget underneath: 9 coins craft back into an ingot with the vanilla recipe, and coins work anywhere a nugget does. No value is ever created or lost.

> Coins are not counterfeit-proof: anyone with a stonecutter and some metal can strike them. That is the point: a coin is only ever worth its metal.

### Resource packs

Without a resource pack, coins look like nuggets with their own name and stack separately from plain nuggets. Each coin carries a `custom_model_data` string (`minted_coins:copper_coin`, `minted_coins:gold_coin`) that a resource pack can use to give them a dedicated model.

## 📦 Compatibility

| | |
|---|---|
| **Minecraft versions** | 26.3 |
| **Type** | Data Pack (no mods required) |
| **License** | MIT |

## 📥 Installation

Like any data pack: drop the downloaded folder into `.minecraft/saves/<your_world>/datapacks/`, then run `/reload` or restart the world.
