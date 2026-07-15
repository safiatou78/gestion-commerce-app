# Modèle de données initial

## Objectif

Définir les principales entités nécessaires au fonctionnement du MVP.

---

# Entités principales

## User

Représente un utilisateur du système.

Attributs possibles :

- id
- nom
- téléphone
- email
- mot_de_passe
- rôle
- statut
- date_creation

---

## Boutique

Représente un commerce enregistré sur la plateforme.

Attributs :

- id
- nom
- propriétaire
- téléphone
- adresse
- statut
- date_debut_essai
- date_fin_essai

---

## Produit

Représente un article vendu par une boutique.

Attributs :

- id
- nom
- catégorie
- prix_achat
- prix_vente
- quantité
- boutique_id

---

## Stock

Permet de suivre les mouvements de stock.

Attributs :

- id
- produit_id
- type_mouvement
- quantité
- date

---

## Client

Représente un acheteur.

Attributs :

- id
- nom
- téléphone
- boutique_id

---

## Commande

Représente une vente.

Attributs :

- id
- client_id
- utilisateur_id
- montant_total
- statut
- date

---

## Ligne_Commande

Détaille les produits vendus.

Attributs :

- id
- commande_id
- produit_id
- quantité
- prix

---

# Relations principales

Boutique :

- possède plusieurs utilisateurs
- possède plusieurs produits
- possède plusieurs commandes


Utilisateur :

- appartient à une boutique
- réalise plusieurs ventes


Produit :

- appartient à une boutique
- apparaît dans plusieurs commandes


Commande :

- appartient à un client
- est réalisée par un utilisateur
- contient plusieurs produits 
/*********************/
# Modèle de données - Version MVP

## Objectif

Définir les principales entités nécessaires au fonctionnement de l'application de gestion commerciale.

Le modèle doit permettre :

- la gestion des boutiques ;
- la gestion des utilisateurs ;
- le suivi des produits ;
- la gestion du stock ;
- la traçabilité des achats ;
- le suivi des ventes ;
- le calcul des bénéfices.

---

# 1. Boutique

## Description

Représente le commerce d'une commerçante.

Dans le MVP :

Une commerçante possède une seule boutique.

## Attributs

- id
- nom
- téléphone
- adresse
- statut
- date_debut_essai
- date_fin_essai
- created_at

## Relations

Une boutique possède :

- plusieurs utilisateurs ;
- plusieurs catégories ;
- plusieurs produits ;
- plusieurs clients ;
- plusieurs commandes ;
- plusieurs approvisionnements.

---

# 2. User (Utilisateur)

## Description

Représente une personne pouvant accéder au système.

## Rôles

- SUPER_ADMIN
- ADMIN_BOUTIQUE
- EMPLOYE

## Attributs

- id
- nom
- téléphone
- email
- mot_de_passe
- role
- statut
- boutique_id
- created_at

## Relations

Un utilisateur :

- appartient à une boutique (sauf SUPER_ADMIN) ;
- peut réaliser plusieurs ventes.

---

# 3. Category (Catégorie)

## Description

Permet de classer les produits d'une boutique.

Exemples :

- vêtements
- chaussures
- cosmétiques
- accessoires

## Attributs

- id
- nom
- boutique_id
- created_at

## Relations

Une catégorie :

- appartient à une boutique ;
- possède plusieurs produits.

---

# 4. Produit

## Description

Représente un article vendu par une boutique.

## Attributs

- id
- nom
- description
- prix_vente
- quantite_stock
- category_id
- boutique_id
- created_at

## Relations

Un produit :

- appartient à une catégorie ;
- possède plusieurs historiques d'achat ;
- apparaît dans plusieurs ventes.

---

# 5. Approvisionnement

## Description

Représente une entrée de stock.

Cette table permet de conserver l'historique des prix d'achat.

## Exemple

Un même produit peut avoir plusieurs prix d'achat selon la période.

## Attributs

- id
- produit_id
- boutique_id
- quantite
- prix_achat_unitaire
- date_achat
- created_at

## Relations

Un approvisionnement :

- concerne un produit ;
- appartient à une boutique.

---

# 6. Client

## Description

Représente un acheteur de la boutique.

Le client ne possède pas de compte dans le MVP.

## Attributs

- id
- nom
- téléphone
- boutique_id
- created_at

## Relations

Un client :

- appartient à une boutique ;
- possède plusieurs commandes.

---

# 7. Commande / Vente

## Description

Représente une transaction réalisée dans la boutique.

## Attributs

- id
- client_id
- utilisateur_id
- boutique_id
- montant_total
- statut
- date_vente
- created_at

## Relations

Une commande :

- appartient à un client ;
- est réalisée par un utilisateur ;
- contient plusieurs produits.

---

# 8. Ligne_Commande

## Description

Contient le détail des produits vendus.

## Attributs

- id
- commande_id
- produit_id
- quantite
- prix_vente_unitaire
- prix_achat_reference
- sous_total

## Pourquoi garder prix_achat_reference ?

Pour conserver le bénéfice réel au moment de la vente.

Même si le prix d'achat change plus tard, l'ancien calcul reste correct.

---

# Relations générales

---

# Règles importantes

## Isolation des données

Une boutique ne peut jamais voir les données d'une autre boutique.

---

## Traçabilité

Chaque vente doit enregistrer :

- le vendeur ;
- la date ;
- la boutique ;
- les produits concernés.

---

## Historique financier

Les prix d'achat ne sont jamais écrasés.

Chaque nouvel achat crée un nouvel historique.