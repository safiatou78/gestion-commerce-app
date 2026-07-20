# Schéma de base de données - MVP

## 1. Présentation

Ce document décrit la structure de la base de données de l'application de gestion commerciale.

Le système est conçu pour gérer plusieurs boutiques tout en garantissant l'isolation des données entre elles.

---

# 2. Vue générale des tables

Les principales tables sont :

---

# 3. Table : boutiques

## Description

Stocke les informations des commerces enregistrés.

## Colonnes

| Champ | Type | Description |
|---|---|---|
| id | UUID | Identifiant unique |
| nom | VARCHAR | Nom de la boutique |
| telephone | VARCHAR | Contact |
| adresse | TEXT | Adresse |
| statut | ENUM | ESSAI, ACTIVE, EXPIREE, SUSPENDUE , EN_ATTENTE|
| date_debut_essai | DATE | Début période d'essai |
| date_fin_essai | DATE | Fin période d'essai |
| created_at | DATE | Date création |
| updated_at | DATE | Date modification |

---

# 4. Table : users

## Description

Utilisateurs ayant accès à l'application.

## Colonnes

| Champ | Type | Description |
|---|---|---|
| id | UUID / INT | Identifiant |
| nom | VARCHAR | Nom utilisateur |
| email | VARCHAR | Email |
| telephone | VARCHAR | Téléphone |
| password_hash | VARCHAR | Mot de passe crypté |
| role | ENUM | SUPER_ADMIN, ADMIN_BOUTIQUE, EMPLOYE |
| statut | ENUM | ACTIF, SUSPENDU, DESACTIVE |
| boutique_id | FK | Boutique associée |
| created_at | DATE | Date création |
| updated_at | DATE | Date modification |

## Relation

---

# 5. Table : categories

## Description

Catégories de produits d'une boutique.

## Colonnes

| Champ | Type | Description |
|---|---|---|
| id | UUID / INT | Identifiant |
| nom | VARCHAR | Nom catégorie |
| boutique_id | FK | Boutique propriétaire |
| created_at | DATE | Date création |

## Relation

---

# 6. Table : products

## Description

Produits vendus.

## Colonnes

| Champ | Type | Description |
|---|---|---|
| id | UUID / INT | Identifiant |
| nom | VARCHAR | Nom produit |
| description | TEXT | Description |
| prix_vente | DECIMAL | Prix actuel |
| quantite_stock | INT | Stock disponible |
| category_id | FK | Catégorie |
| boutique_id | FK | Boutique |
| created_at | DATE | Date création |

---

# 7. Table : approvisionnements

## Description

Historique des achats de marchandises.

Chaque entrée représente un achat avec son prix réel.

## Colonnes

| Champ | Type | Description |
|---|---|---|
| id | UUID / INT | Identifiant |
| produit_id | FK | Produit acheté |
| boutique_id | FK | Boutique |
| quantite | INT | Quantité reçue |
| prix_achat_unitaire | DECIMAL | Prix d'achat |
| date_achat | DATE | Date achat |
| created_at | DATE | Création |

---

# 8. Table : clients

## Description

Clients des boutiques.

## Colonnes

| Champ | Type | Description |
|---|---|---|
| id | UUID / INT | Identifiant |
| nom | VARCHAR | Nom client |
| telephone | VARCHAR | Contact |
| boutique_id | FK | Boutique |
| created_at | DATE | Création |

---

# 9. Table : commandes

## Description

Enregistre les ventes réalisées.

## Colonnes

| Champ | Type | Description |
|---|---|---|
| id | UUID / INT | Identifiant |
| client_id | FK | Client |
| utilisateur_id | FK | Vendeur |
| boutique_id | FK | Boutique |
| montant_total | DECIMAL | Total vente |
| statut | ENUM | PAYEE, ANNULEE |
| date_vente | DATE | Date vente |
| created_at | DATE | Création |

---

# 10. Table : lignes_commandes

## Description

Détail des produits d'une commande.

## Colonnes

| Champ | Type | Description |
|---|---|---|
| id | UUID / INT | Identifiant |
| commande_id | FK | Commande |
| produit_id | FK | Produit vendu |
| quantite | INT | Quantité vendue |
| prix_vente_unitaire | DECIMAL | Prix vente |
| prix_achat_reference | DECIMAL | Prix achat utilisé |
| sous_total | DECIMAL | Montant ligne |

---

# 11. Relations principales

## Boutique

Une boutique possède :

- plusieurs utilisateurs ;
- plusieurs catégories ;
- plusieurs produits ;
- plusieurs clients ;
- plusieurs commandes ;
- plusieurs approvisionnements.

---

## Produit

Un produit possède :

- une catégorie ;
- plusieurs approvisionnements ;
- plusieurs lignes de commandes.

---

## Commande

Une commande possède :

- un client ;
- un vendeur ;
- plusieurs produits.

---

# 12. Règles métier importantes

## Séparation des boutiques

Toutes les tables métier possèdent un `boutique_id`.

Cela garantit qu'une boutique ne peut pas accéder aux données d'une autre.

---

## Historisation

Les prix d'achat ne sont jamais modifiés.

Chaque nouvel achat crée un nouvel enregistrement dans :

---

## Traçabilité des ventes

Chaque vente conserve :

- l'utilisateur responsable ;
- les produits vendus ;
- le prix de vente ;
- le prix d'achat de référence.