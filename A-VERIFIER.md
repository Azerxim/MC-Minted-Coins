# À vérifier en jeu — Minted Coins (branche `dev`)

Tout ce qui suit a été testé sur un serveur dédié sans joueur, via RCON. Ces vérifications demandent un vrai client, avec le resource pack « Minted Coins Resources » activé.

Préparation :

- Copier la version `dev` du data pack et du resource pack dans l'instance Prism « Minted Coins captures ».
- Quitter puis rouvrir le monde : `/reload` ne recharge pas les dialogues.
- Être opérateur, puis ouvrir le menu avec `/function minted_coins:mint/menu`.

Cocher chaque case une fois vérifiée.

---

## 1. Migration depuis la 1.0

À faire sur une **copie** d'un monde qui contient des ateliers de la 1.0, avec des pièces et des porte-monnaie déjà en circulation.

- [X] Après chargement, le menu **Banques** liste une banque par ancien atelier, au même nom.
- [X] Chaque ancien atelier propose les mêmes échanges qu'avant (frappe, petite monnaie, rachat, porte-monnaie).
- [X] Les pièces déjà frappées sont toujours reprises par leur atelier (petite monnaie, rachat).
- [X] Un ancien porte-monnaie accepte toujours ses pièces et affiche le bon nom dans l'infobulle.
- [X] Les comptoirs (presse, balance) sont toujours devant les ateliers.

## 2. Menus

- [X] Accueil : boutons « Nouvelle banque… », « Banques », « Aide… ». Les textes sont traduits en français.
- [X] « Nouvelle banque… » : tous les champs tiennent à l'écran.
  - [X] Champs attendus : nom, 4 pièces (nom, taux, ordre), petite monnaie, nom des petites pièces.
  - [ ] Nouveaux champs : **prix de la licence** (« Prix de la licence (0 = aucune) », qui tient dans le curseur) et **pièce de la licence** (bouton qui fait défiler or, cuivre, fer, diamant).
- [X] La création d'une banque affiche la confirmation de commande opérateur, puis la page de la banque.
- [X] Page de banque :
  - [ ] Boutons dans l'ordre : ateliers, bureaux de change (⇄), boutiques (🛒), « Nouvel atelier ici… », « Nouveau bureau de change ici… », « Modifier la banque… », « Supprimer la banque… ».
  - [ ] L'infobulle de chaque atelier liste ses familles d'échanges.
- [X] « Modifier la banque… » est prérempli : noms tapés, taux, ordres, petite monnaie, modèle des petites pièces, prix et pièce de la licence.
- [ ] Les icônes de pièces du resource pack sont bien placées dans les dialogues, surtout sur les deux nouveaux champs de licence.
- [ ] L'écran d'aide affiche ses nouvelles entrées : ateliers, bureaux de change, boutiques.

## 3. Nom des petites pièces

- [X] Banque créée avec le modèle `Demi %s` : les petites pièces s'appellent « Demi Pièce d'or », « Demi <nom de la pièce> », etc.
- [X] Champ vide : les petites pièces s'appellent « Petite Pièce d'or » (traduction du resource pack).
- [X] Modèle sans `%s` (par exemple `Denier`) : toutes les petites pièces portent ce nom.
- [X] Changer le modèle dans « Modifier la banque… » ajoute aux ateliers un échange 1 ancienne petite pièce → 1 nouvelle.
- [X] Revenir à l'ancien modèle retire cet échange.
- [ ] Le porte-monnaie affiche le bon nom pour les petites pièces.

## 4. Banques et ateliers

- [ ] « Nouvel atelier ici… » fait apparaître l'atelier à 2 blocs devant soi, tourné vers soi, avec son comptoir.
- [ ] Nom laissé vide : l'atelier prend le nom de la banque. Les pièces indiquent « Frappée par <banque></banque> ».
- [ ] Deux ateliers de la même banque : leurs pièces s'empilent, et chacun reprend les pièces de l'autre (petite monnaie, rachat).
- [ ] Atelier avec seulement « Petite monnaie » et « Porte-monnaie » cochés : il n'a que ces échanges, sans frappe ni conversion.
- [ ] Une case décochée retire bien sa famille d'échanges :
  - [ ] Frappe
  - [ ] Petite monnaie
  - [ ] Conversion
  - [ ] Rachat
  - [ ] Porte-monnaie
  - [ ] Licence
- [ ] Modifier la banque (renommer la pièce d'or, changer un taux) met à jour **tous** ses ateliers dans la seconde.
- [ ] Un échange de refonte (ancien nom → nouveau) apparaît dans chaque atelier qui a la conversion cochée.
- [ ] Rachat : l'atelier reprend ses pièces contre du métal sans perte, au taux de la banque (8 pièces d'or → 1 lingot à 8 par lingot), pour chaque pièce frappée. Plus d'échange 9 pièces de diamant → 1 diamant.
- [ ] La conversion ne contient plus que la refonte (ancien nom → nouveau) et les 64 ↔ 1.
- [ ] Case « Rachat : pièces de toutes les banques » décochée par défaut ; cochée, l'atelier reprend aussi les pièces des autres banques, au taux de chacune (9 Couronnes → 1 lingot pour une banque à 9).
- [ ] Une nouvelle banque apparaît aussitôt dans les ateliers qui reprennent les pièces de toutes les banques.
- [ ] Atelier dans un chunk non chargé pendant la modification : il est à jour dès qu'on s'en approche.
- [ ] Supprimer un atelier depuis sa page : il disparaît avec son comptoir (même s'il était loin : au prochain chargement).
- [ ] Supprimer une banque : tous ses ateliers et bureaux de change disparaissent.
- [ ] Un joueur non autorisé qui tape `/trigger minted_coins.mint.menu` reçoit seulement le message d'explication.

## 5. Bureaux de change

Préparer deux banques aux taux différents, par exemple Aldoria à 8 pièces par lingot et Empire à 9.

- [ ] « Nouveau bureau de change ici… » : formulaire avec nom, « Pièces données » (10 par défaut), « Pièces rendues » (9 par défaut) et une case par autre banque.
- [ ] Sans autre banque, le formulaire affiche le message rouge « Il n'y a pas encore d'autre banque… ».
- [ ] 10 données → 9 rendues : 5 Aureus → 4 Couronnes et 1 Couronne → 1 Aureus. Taux égaux : 10 → 9.
- [ ] 1 donnée → 1 rendue : 9 Aureus ↔ 8 Couronnes.
- [ ] Les pièces reçues sont celles de la banque d'arrivée (« Frappée par Empire ») et s'empilent avec les autres.
- [ ] Un métal qu'une des deux banques ne frappe pas n'a pas d'échange.
- [ ] L'infobulle sur la page de banque indique « change avec Empire, 10 pièces données → 9 rendues ».
- [ ] Modifier le bureau : les banques déjà choisies sont précochées et les deux chiffres sont préremplis. Un bureau créé avec l'ancienne commission en % propose 10 → 10 − commission/10.

## 6. Boutiques — le plus important

Préparation :

- [ ] Banque avec une licence à 5 pièces d'or, et un atelier avec la case « Licence » cochée.
- [ ] Tester avec **un joueur non opérateur**, en plus d'un opérateur.

### Licence

- [ ] L'atelier vend la « Licence de boutique » contre 5 pièces d'or.
- [ ] Son infobulle affiche « Délivrée par <banque></banque> » et la phrase d'usage.
- [ ] Clic droit maintenu sur la licence : elle s'utilise comme un aliment (environ 1 s, bruit de page tournée), puis disparaît.
- [ ] Utilisée en regardant un tonneau à moins de 5 blocs :
  - [ ] Un villageois s'installe dessus et regarde le joueur.
  - [ ] Une enseigne (panneau suspendu) flotte au-dessus de sa tête.
  - [ ] Le joueur reçoit une **Clé de boutique** (crochet brillant).
  - [ ] Le chat confirme l'ouverture.
- [ ] Même test sur un **coffre** : le villageois est posé à la bonne hauteur, sans flotter ni s'enfoncer.
- [ ] Utilisée en regardant le vide ou un bloc ordinaire : message « Regardez un coffre ou un tonneau… », et la licence est **rendue**.
- [ ] Utilisée sur un coffre avec un plafond trop bas (moins de 3 blocs libres) : message d'erreur et licence rendue.
- [ ] Utilisée sur le conteneur d'une boutique existante : « déjà verrouillé », licence rendue.

### Le villageois

- [ ] Il ne bouge pas, ne prend pas de dégâts, n'a pas de métier.
- [ ] **Il accepte de commercer** : c'est le point le plus incertain, il n'a pas de métier.
- [ ] Les joueurs ne peuvent pas le pousser.
- [ ] Ses prix ne changent pas avec le temps, la réputation ou l'effet Héros du village.

### Clé et coffre

- [ ] Clé tenue en main principale : le tonneau s'ouvre.
- [ ] Sans la clé en main, ou pour un autre joueur : « verrouillé ».
- [ ] Clé ailleurs dans l'inventaire : un clic sur l'enseigne ouvre le **menu de la boutique**.
- [ ] Clé donnée à un autre joueur : c'est lui qui gère la boutique et ouvre le coffre.
- [ ] Clic sur l'enseigne sans la clé : barre d'action « <boutique></boutique> : commercez avec le marchand… ».
- [ ] Un clic sur l'enseigne n'ouvre **pas** la fenêtre d'échange, et un clic sur le corps du villageois l'ouvre bien.

### Offres

- [ ] Menu : la main principale et la main secondaire sont affichées en objets, avec leur nombre.
- [ ] 4 pains en main principale, 3 pièces en main secondaire, puis **Vendre** :
  - [ ] Le chat affiche « Offre ajoutée ».
  - [ ] Le menu se rouvre avec la ligne « 1. Vend pour 3 × Pièce … (stock : N échanges) ».
- [ ] Même principe avec **Acheter** (par exemple 8 blés contre 1 pièce).
- [ ] Erreurs attendues :
  - [ ] Main principale vide → message d'erreur.
  - [ ] Main secondaire autre chose qu'une pièce → message d'erreur.
  - [ ] Clé en main principale → « Une clé de boutique ne se vend pas ».
  - [ ] Treizième offre → « 12 offres au plus ».
- [ ] Un objet enchanté et renommé est revendu à l'identique.
- [ ] « Retirer l'offre N » retire la bonne offre.
- [ ] « Renommer » avec une étiquette renommée : le nom du villageois change. Sans objet renommé : message d'erreur.
- [ ] Taper soi-même `/trigger minted_coins.shop set 1` **sans** la clé : refusé (« Il vous faut la clé… »).

### Échanges et stock

- [ ] Tonneau avec 20 pains, offre « 4 pains pour 3 pièces » : le villageois propose 5 ventes, puis l'échange est barré.
- [ ] Après **un vrai achat** par un autre joueur, le tonneau contient 4 pains de moins et 3 pièces de plus.
- [ ] Maj+clic pour acheter plusieurs fois d'un coup : le stock baisse du bon total.
- [ ] Offre d'achat : le joueur donne les marchandises, reçoit les pièces du tonneau, et les marchandises y entrent.
- [ ] Le propriétaire ajoute ou retire des pains : le nombre de ventes suit dans la seconde (visible en rouvrant la fenêtre d'échange).
- [ ] Une fenêtre d'échange ouverte **ne se ferme plus** : ni quand le stock change, ni quelques secondes après un échange. Avec une offre de vente et une offre d'achat payées dans les mêmes pièces, commercer plusieurs fois de suite sans que la fenêtre se ferme.
- [ ] Stock retiré pendant que la fenêtre est ouverte : l'échange devenu impossible est refusé (rien ne sort).
- [ ] Coffre plein lors d'un encaissement : l'excédent tombe sur le coffre et rien n'est perdu.
- [ ] Coffre cassé (en survie) : le villageois n'a plus d'échanges disponibles.
- [ ] Les pièces encaissées sont reprises normalement par les ateliers de leur banque, et s'empilent avec les pièces frappées en les manipulant.

### Fermeture et suppression

- [ ] « Fermer la boutique… » puis confirmer :
  - [ ] Le marchand et l'enseigne disparaissent.
  - [ ] Le coffre s'ouvre sans clé et garde son contenu.
  - [ ] La licence est rendue.
- [ ] Opérateur : la boutique apparaît (🛒) sur la page de la banque.
  - [ ] « Téléporter » amène à côté du coffre.
  - [ ] « Supprimer… » retire le marchand et déverrouille le coffre, sans rendre la licence.

## 7. Resource pack

- [ ] Toutes les nouvelles chaînes sont traduites en français, allemand et espagnol, sans clé brute affichée (du type `dialog.minted_coins…`).
- [ ] Les `%` s'affichent bien : le `%s` dans le libellé du nom des petites pièces.
- [ ] **À faire** : il n'existe pas encore de modèles pour la licence (`minted_coins:shop_licence`), la clé (`minted_coins:shop_key`) et l'enseigne (`minted_coins:shop_sign`). Pour l'instant ils apparaissent en papier, crochet et panneau suspendu vanilla.

## 8. Hors Minted Coins

- [ ] En 26.3, les fonctions de butin s'écrivent `"modifier": [{"type": "minecraft:set_count", …}]` au lieu de `"functions": [{"function": …}]`. Vérifier les autres data packs (Amethyst Reforge, Artefact, Bastion Recipes…) s'ils utilisent des tables de butin, des `/loot` ou des `/item modify`.
