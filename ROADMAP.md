# Feuille de route — Minted Coins

Version actuelle : **1.0** (Minecraft 26.3).

Légende :
- **DP** : data pack, **RP** : resource pack.
- Effort : **S** quelques heures, **M** une journée, **L** plusieurs jours.

## 1.1 — En cours

### Fait (branche `dev`)

| Fonction | Pack | Description |
|---|---|---|
| Accès des opérateurs | DP | Plus de tag à poser : `/function minted_coins:mint/menu` ouvre le menu (réservé aux opérateurs par Minecraft) et autorise le joueur. Ensuite, `/trigger minted_coins.mint.menu` suffit ; les autres joueurs reçoivent un message d'explication. `/function minted_coins:revoke` retire l'accès. |
| Menus en boîtes de dialogue | DP + RP | La liste des ateliers s'ouvre dans une boîte de dialogue : un bouton par atelier, puis une page avec sa position, ses taux, et les boutons Se téléporter, Modifier… et Supprimer… (avec confirmation). |
| Noms saisis dans le menu | DP + RP | À la création, le nom de l'atelier et ceux de ses quatre pièces se tapent dans le menu. Un champ vide reprend l'objet renommé, sinon le nom par défaut. |
| Modifier un atelier | DP + RP | Mêmes champs qu'à la création, préremplis. L'atelier est recréé au même endroit avec le même id, ses pièces restent les siennes. Les ateliers créés avant la 1.1 peuvent ainsi gagner la petite monnaie. Une pièce renommée garde un échange de refrappe : 1 pièce sous l'ancien nom contre 1 sous le nouveau. |
| Piles de pièces | RP | Le modèle grandit avec la quantité : 1 à 8 pièces, petite pile de 9 à 31, grande pile de 32 à 59, tas à partir de 60. Pour les pièces et la petite monnaie, en 3D (modèles Blockbench) et en icône d'inventaire. |
| Textures en 32x | RP | Icônes des pièces, de la petite monnaie et des piles redessinées en 32×32, icônes des menus en 22×22. |
| Porte-monnaie | DP + RP | Vendu par chaque atelier (1 cuir + 1 ficelle). Clic droit : il range les pièces de son atelier de l'inventaire, sans limite (le *bundle* vanilla plafonne à 64 objets, d'où un contenu gardé dans les données de l'objet), puis un menu permet d'en retirer. Apparence vide ou pleine, contenu dans l'infobulle. |
| Aide | DP + RP | Un écran d'aide accessible depuis l'accueil : noms, taux, petite monnaie, modification et accès. |

## Pistes proposées

### Faire circuler la monnaie

| Fonction | Pack | Effort | Description |
|---|---|---|---|
| Boutiques | DP | L | Les opérateurs créent des marchands qui vendent des objets contre les pièces d'un atelier : objet en main, prix choisi dans un dialogue. C'est ce qui donne de la valeur aux pièces. |
| Bureau de change | DP | M | Un marchand qui échange les pièces d'un atelier contre celles d'un autre, au taux choisi par l'opérateur. Le commerce entre civilisations devient possible tout en gardant des monnaies séparées. |
| Trésor de l'atelier | DP | M | Le métal gardé par l'atelier (la seigneurie) s'accumule dans un trésor que l'opérateur peut récupérer, et qui s'affiche dans la liste des ateliers. |

### Gérer les ateliers

| Fonction | Pack | Effort | Description |
|---|---|---|---|
| Propriétaires d'atelier | DP | M | Confier un atelier à un joueur, qui le gère sans être opérateur. Chaque civilisation administre sa propre monnaie. |
| Statistiques | DP | S | Nombre de pièces frappées et rachetées par atelier, dans la liste des ateliers. |

### Apparence

| Fonction | Pack | Effort | Description |
|---|---|---|---|
| Effigies par atelier | DP + RP | M | Plusieurs dessins de pièce (couronne, soleil, ancre…) au choix à la création de l'atelier. Chaque monnaie a son visage, sur le même principe que `custom_model_data`. |
| Décor de l'atelier | DP | M | Un comptoir et une presse à frapper autour du marchand, en *display entities*, retirés avec l'atelier. |
| Textures 3D en 32x | RP | S | Les textures des pièces et des piles en 3D (`*_coin_3d.png`) restent en 16×16 : les passer en 32× pour suivre les icônes, en redessinant la tranche des pièces. |
| Plus de langues | RP | S | Espagnol, allemand, etc. Le script `tools/slider_icons.py` replace les icônes des curseurs pour chaque nouvelle langue. |

### À étudier

- **Pièce d'émeraude** : faire le lien avec l'économie des villageois. Il faut trouver un objet de base qui ne crée pas d'exploit.
- **Pièce de netherite**, au-dessus du diamant. Même contrainte sur l'objet de base : les débris et les lingots ont des recettes.
- **Coffre-fort ou banque** : déposer des pièces contre un solde. Puissant, mais un solde stocké dans un scoreboard se marie mal avec l'idée d'une monnaie physique, impossible à contrefaire.
