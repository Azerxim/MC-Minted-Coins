# Feuille de route — Minted Coins

Version actuelle : **1.0** (Minecraft 26.3).

Légende :

- **DP** : data pack, **RP** : resource pack.
- Effort : **S** quelques heures, **M** une journée, **L** plusieurs jours.

## 2.0 — En cours

### Fait (branche `dev`)

| Fonction                     | Pack    | Description                                                                                                                                                                                                                                                                                                                                                                                                           |
| ---------------------------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Accès des opérateurs       | DP      | Plus de tag à poser : `/function minted_coins:mint/menu` ouvre le menu (réservé aux opérateurs par Minecraft) et autorise le joueur. Ensuite, `/trigger minted_coins.mint.menu` suffit ; les autres joueurs reçoivent un message d'explication. `/function minted_coins:revoke` retire l'accès.                                                                                                           |
| Menus en boîtes de dialogue | DP + RP | La liste des ateliers s'ouvre dans une boîte de dialogue : un bouton par atelier, puis une page avec sa position, ses taux, et les boutons Se téléporter, Modifier… et Supprimer… (avec confirmation).                                                                                                                                                                                                           |
| Noms saisis dans le menu     | DP + RP | À la création, le nom de l'atelier et ceux de ses quatre pièces se tapent dans le menu. Un champ vide reprend l'objet renommé, sinon le nom par défaut.                                                                                                                                                                                                                                                          |
| Modifier un atelier          | DP + RP | Mêmes champs qu'à la création, préremplis. L'atelier est recréé au même endroit avec le même id, ses pièces restent les siennes. Les ateliers créés avant la 1.1 peuvent ainsi gagner la petite monnaie. Une pièce renommée garde un échange de refrappe : 1 pièce sous l'ancien nom contre 1 sous le nouveau.                                                                                         |
| Piles de pièces             | RP      | Le modèle grandit avec la quantité : 1 à 8 pièces, petite pile de 9 à 31, grande pile de 32 à 59, tas à partir de 60. Pour les pièces et la petite monnaie, en 3D (modèles Blockbench) et en icône d'inventaire.                                                                                                                                                                                            |
| Textures en 32x              | RP      | Icônes des pièces, de la petite monnaie et des piles redessinées en 32×32, icônes des menus en 22×22.                                                                                                                                                                                                                                                                                                           |
| Porte-monnaie                | DP + RP | Vendu par chaque atelier (1 cuir + 1 ficelle), en tête de sa liste. Il fonctionne comme un *bundle*, sans limite : on y glisse les pièces de son atelier, on les retire, on choisit lesquelles. Le bundle en montre 32 au plus (son contenu natif plafonne à 64), le reste est gardé dans les données de l'objet et réapparaît à mesure qu'on en retire. Apparence vide ou pleine, totaux dans l'infobulle. |
| Espagnol et allemand         | RP      | Traductions complètes, icônes des curseurs placées pour chaque langue.                                                                                                                                                                                                                                                                                                                                             |
| Comptoir de l'atelier        | DP + RP | Le marchand se tient derrière un comptoir (modèle 3D Blockbench) : presse à frapper, balance et piles de pièces. Une *item display* sans boîte de collision, posée et retirée avec l'atelier ; un tonneau sans le resource pack.                                                                                                                                                                             |
| Conversion entre pièces     | DP + RP | L'atelier refond ses pièces en lingots ou en diamants sans perte, au taux de la banque, échange les pièces frappées sous un ancien nom contre les actuelles, et change 64 pièces contre 1 pièce du rang au-dessus, et inversement : par défaut 64 cuivre = 1 fer, 64 fer = 1 or, 64 or = 1 diamant. L'ordre (0 à 4, 0 = pas de conversion) se règle pièce par pièce dans les menus de création et de modification ; une pièce non frappée est sautée. Une option, désactivée par défaut, refond aussi les pièces de toutes les autres banques, à leurs taux.                                                                                                            |
| Nom des petites pièces      | DP + RP | Un seul champ, à la création et à la modification, nomme les petites pièces des quatre métaux : un modèle où `%s` est le nom de la pièce (*Demi %s*, *Éclat de %s*). Vide, il garde « Petite %s » traduit par le pack de ressources. Changer le modèle ajoute les échanges de refonte des petites pièces déjà frappées.                                                                        |
| Banques                      | DP + RP | Une banque est une monnaie : elle porte les noms, taux, petite monnaie et ordre de conversion de ses pièces. Ses ateliers, placés depuis sa page, frappent tous les mêmes pièces et reprennent celles des autres ; chacun choisit seulement ses familles d'échanges (frappe, petite monnaie, conversion, rachat des diamants, porte-monnaie). Modifier la banque met à jour tous ses ateliers, même non chargés (au prochain chargement). Chaque atelier de la 1.0 devient une banque du même id : ses pièces restent valables. |
| Bureaux de change            | DP + RP | Placés depuis la page d'une banque, ils changent les pièces des banques cochées contre celles de leur banque, et inversement, métal par métal, à métal égal (d'après les pièces par lingot de chaque banque), au taux fixé par deux chiffres : pièces données et pièces rendues (10 → 9 par défaut). Chaque échange est le plus petit qui donne ce taux exact, sinon à 2 % près, arrondi contre le joueur. Les petites pièces ne sont pas changées. |
| Boutiques                    | DP + RP | Une licence vendue par les ateliers (prix fixé par banque), utilisée en regardant un coffre ou un tonneau, y installe un villageois marchand et donne une clé. Le conteneur, verrouillé par la clé, est le stock : les ventes en sortent, les achats et les recettes y entrent. Le détenteur de la clé règle jusqu'à 12 offres depuis l'enseigne au-dessus du marchand : marchandise en main principale, prix en pièces en main secondaire. Les échanges s'épuisent avec le stock et le suivent dans la seconde, sans fermer la fenêtre d'échange ouverte. Reste à faire côté RP : modèles de la licence, de la clé et de l'enseigne. |
| Aide                         | DP + RP | Un écran d'aide accessible depuis l'accueil : noms, taux, petite monnaie, conversion, modification et accès.                                                                                                                                                                                                                                                                                                        |

## Pistes proposées

### Faire circuler la monnaie

| Fonction             | Pack | Effort | Description                                                                                                                                                                                            |
| -------------------- | ---- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Boutiques            | DP   | L      | Les opérateurs créent des marchands qui vendent des objets contre les pièces d'un atelier : objet en main, prix choisi dans un dialogue. C'est ce qui donne de la valeur aux pièces.               |
| Bureau de change     | DP   | M      | Un marchand qui échange les pièces d'un atelier contre celles d'un autre, au taux choisi par l'opérateur. Le commerce entre civilisations devient possible tout en gardant des monnaies séparées. |
| Trésor de l'atelier | DP   | M      | Le métal gardé par l'atelier (la seigneurie) s'accumule dans un trésor que l'opérateur peut récupérer, et qui s'affiche dans la liste des ateliers.                                              |

### Gérer les ateliers

| Fonction                 | Pack | Effort | Description                                                                                                            |
| ------------------------ | ---- | ------ | ---------------------------------------------------------------------------------------------------------------------- |
| Propriétaires d'atelier | DP   | M      | Confier un atelier à un joueur, qui le gère sans être opérateur. Chaque civilisation administre sa propre monnaie. |
| Statistiques             | DP   | S      | Nombre de pièces frappées et rachetées par atelier, dans la liste des ateliers.                                     |

### Apparence

| Fonction             | Pack    | Effort | Description                                                                                                                                                                  |
| -------------------- | ------- | ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Effigies par atelier | DP + RP | M      | Plusieurs dessins de pièce (couronne, soleil, ancre…) au choix à la création de l'atelier. Chaque monnaie a son visage, sur le même principe que `custom_model_data`. |
| Textures 3D en 32x   | RP      | S      | Les textures des pièces et des piles en 3D (`*_coin_3d.png`) restent en 16×16 : les passer en 32× pour suivre les icônes, en redessinant la tranche des pièces.       |
| Plus de langues      | RP      | S      | Italien, portugais, etc. Le script `tools/slider_icons.py` replace les icônes des curseurs pour chaque nouvelle langue.                                                   |

### À étudier

- **Pièce d'émeraude** : faire le lien avec l'économie des villageois. Il faut trouver un objet de base qui ne crée pas d'exploit.
- **Pièce de netherite**, au-dessus du diamant. Même contrainte sur l'objet de base : les débris et les lingots ont des recettes.
- **Texture propre au marchand de l'atelier** avec le mod Entity Texture Features (ou OptiFine) côté client : le resource pack donnerait une texture aux seuls marchands portant le tag `minted_coins.mint`, sans toucher aux autres marchands ambulants. Sans le mod, rien ne change : en vanilla, une texture d'entité vaut pour tout le type.
- **Coffre-fort ou banque** : déposer des pièces contre un solde. Puissant, mais un solde stocké dans un scoreboard se marie mal avec l'idée d'une monnaie physique, impossible à contrefaire.
