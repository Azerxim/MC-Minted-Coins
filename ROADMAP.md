# Feuille de route — Minted Coins

Version actuelle : **1.0** (Minecraft 26.3).

Légende :
- **DP** : data pack, **RP** : resource pack.
- Effort : **S** quelques heures, **M** une journée, **L** plusieurs jours.

## 1.1 — Prévu

| Fonction | Pack | Effort | Description |
|---|---|---|---|
| Piles de pièces | RP | S | Le modèle grandit avec la quantité : 1 pièce, une petite pile, une grande pile, un tas. Pour les pièces et la petite monnaie, en 3D et en icône d'inventaire, via la propriété `minecraft:count` des définitions d'objet. Aucun changement au data pack. |
| Porte-monnaie | DP + RP | M | Un sac (basé sur le *bundle* vanilla) vendu par chaque atelier, avec son propre modèle et le nom de l'atelier. À étudier : refuser ce qui n'est pas une pièce (vérification régulière du contenu, puis éjection), et afficher l'état vide ou plein. |

## Pistes proposées

### Faire circuler la monnaie

| Fonction | Pack | Effort | Description |
|---|---|---|---|
| Boutiques | DP | L | Les admins créent des marchands qui vendent des objets contre les pièces d'un atelier : objet en main, prix choisi dans un dialogue. C'est ce qui donne de la valeur aux pièces. |
| Bureau de change | DP | M | Un marchand qui échange les pièces d'un atelier contre celles d'un autre, au taux choisi par l'admin. Le commerce entre civilisations devient possible tout en gardant des monnaies séparées. |
| Trésor de l'atelier | DP | M | Le métal gardé par l'atelier (la seigneurie) s'accumule dans un trésor que l'admin peut récupérer, et qui s'affiche dans la liste des ateliers. |

### Gérer les ateliers

| Fonction | Pack | Effort | Description |
|---|---|---|---|
| Modifier un atelier | DP | M | Changer les taux, la petite monnaie ou le nom d'un atelier existant, sans le supprimer. Les ateliers créés avant la 1.1 pourraient ainsi gagner la petite monnaie. |
| Propriétaires d'atelier | DP | M | Confier un atelier à un joueur, qui le gère sans être admin. Chaque civilisation administre sa propre monnaie. |
| Statistiques | DP | S | Nombre de pièces frappées et rachetées par atelier, dans la liste des ateliers. |

### Apparence

| Fonction | Pack | Effort | Description |
|---|---|---|---|
| Effigies par atelier | DP + RP | M | Plusieurs dessins de pièce (couronne, soleil, ancre…) au choix à la création de l'atelier. Chaque monnaie a son visage, sur le même principe que `custom_model_data`. |
| Décor de l'atelier | DP | M | Un comptoir et une presse à frapper autour du marchand, en *display entities*, retirés avec l'atelier. |
| Plus de langues | RP | S | Espagnol, allemand, etc. Le script `tools/slider_icons.py` replace les icônes des curseurs pour chaque nouvelle langue. |

### À étudier

- **Pièce d'émeraude** : faire le lien avec l'économie des villageois. Il faut trouver un objet de base qui ne crée pas d'exploit.
- **Pièce de netherite**, au-dessus du diamant. Même contrainte sur l'objet de base : les débris et les lingots ont des recettes.
- **Coffre-fort ou banque** : déposer des pièces contre un solde. Puissant, mais un solde stocké dans un scoreboard se marie mal avec l'idée d'une monnaie physique, impossible à contrefaire.
