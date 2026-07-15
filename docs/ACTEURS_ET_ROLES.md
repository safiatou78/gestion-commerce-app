# Acteurs et rôles du système

## Introduction

L'application fonctionne selon un modèle multi-boutiques.

Chaque boutique possède ses propres utilisateurs et ses propres données.

---

# 1. Super Admin

## Description

Le Super Admin est l'administrateur général de la plateforme.

Il contrôle l'ensemble du système.

## Permissions

- Créer une boutique
- Modifier une boutique
- Activer une boutique
- Suspendre une boutique
- Consulter les informations globales
- Gérer les abonnements

---

# 2. Admin Boutique

## Description

L'Admin Boutique est le propriétaire du commerce.

Il possède le contrôle de sa boutique.

## Permissions

- Gérer les produits
- Gérer le stock
- Créer des employés
- Consulter les ventes
- Consulter les bénéfices
- Voir les statistiques

---

# 3. Employé

## Description

L'employé réalise les opérations quotidiennes.

## Permissions

- Enregistrer une vente
- Créer une commande
- Consulter les produits disponibles

## Restrictions

- Pas d'accès aux bénéfices globaux
- Pas de gestion des employés
- Pas de suppression importante

---

# 4. Client final

## Description

Le client final achète auprès de la boutique.

Il ne possède pas de compte utilisateur.

## Informations conservées

- Nom
- Téléphone
- Historique des commandes

---

# Règle principale

Chaque action importante doit pouvoir être associée à un utilisateur.

Exemple :

Une vente doit enregistrer :

- le vendeur ;
- la date ;
- la boutique concernée.