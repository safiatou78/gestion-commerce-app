# Architecture technique - Application de gestion commerciale

## 1. Présentation générale

L'application est une plateforme de gestion commerciale destinée aux petites commerçantes.

Elle permet de gérer :

- les boutiques ;
- les utilisateurs ;
- les produits ;
- le stock ;
- les commandes ;
- les ventes ;
- les statistiques.

L'application est conçue selon une architecture séparant le frontend et le backend.

---

# 2. Architecture globale

Le projet est composé de trois parties principales :

---

# 3. Frontend

## Technologie

- Next.js
- React
- TypeScript
- Tailwind CSS

## Responsabilités

Le frontend gère :

- l'affichage des interfaces ;
- la navigation ;
- les formulaires ;
- les interactions utilisateur ;
- la communication avec l'API.

---

## Organisation prévue

---

# 5. Base de données

La base de données doit permettre de gérer un système multi-boutiques.

## Entités principales :

- User
- Boutique
- Category
- Product
- Stock
- Client
- Commande
- LigneCommande

---

# 6. Gestion des utilisateurs

Le système utilise une gestion par rôles.

## Rôles :

### SUPER_ADMIN

Administrateur de la plateforme.

### ADMIN_BOUTIQUE

Propriétaire de la boutique.

### EMPLOYE

Utilisateur travaillant dans la boutique.

---

# 7. Sécurité

Le système devra prévoir :

- authentification sécurisée ;
- protection des routes ;
- contrôle des permissions ;
- séparation des données entre boutiques.

Une boutique ne doit jamais accéder aux données d'une autre boutique.

---

# 8. Hébergement prévu

## Frontend

Déploiement prévu :

- Vercel

Avantages :

- CDN gratuit ;
- intégration simple avec Next.js.

---

## Backend

Déploiement prévu :

- Render

---

# 9. Évolution future

L'architecture devra pouvoir accueillir :

- application mobile ;
- gestion des prestations ;
- fournisseurs ;
- notifications ;
- paiement en ligne ;
- multi-boutiques par utilisateur.