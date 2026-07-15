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