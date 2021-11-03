# The Gossip Project

[![forthebadge](https://raw.githubusercontent.com/fleopaulD/README-parts/main/Badges/ftb-the-hacking-project.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com/images/badges/made-with-ruby.svg)


## 1. À propos
Encore un super projet pour cette **semaine 6** de la formation développeur web, un upgrade de notre fameuse appli qui permet de commérer en commuauté !
Tous les jours de cette semaine des petites révisions vont venir améliorer notre appli de Gossips !

Voici les requis pour la version initiale :
1. L'application roulera sur Rails avec une base de données en PostegreSQL
1. Vérifer tous les branchements en console
1. Seeder la base de donnée
1. Les pages html à créer pour aujourd'hui :
    - La page d'accueil, bien entendu. Cette page d'accueil affichera tous les potins créés
    - La page qui présente l'équipe de The Gossip Project, aka toi et ton binome
    - La page de contact où tu vas balancer une superbe adresse de contact
    - Une page de bienvenue, qui accueille l'utilisateur en fonction du nom passé dans l'URL
## 2. Index des révisions
- Version initiale
- [Rev 1](https://github.com/joffrey7486/The_gossip_Project/commit/54ab88e9723639ff56a50c1ec96f2c6aa69770eb) : Appliquer la méthode REST pour la gestion des potins

## 3. Prérequis à l'installation
1. Ruby en version 2.7.4
1. Rails en version 5.2.3
1. PostgreSQL
## 4. Lancement de l'application
1. Ouvrir un terminal dans le dossier racine de l'application
1. `bundle install` -> pour installer toutes les gems nécessaires
1. `rails db:create` -> création de la base de données
1. `rails db:migrate` -> réaliser les migrations
1. `rails db:seed` -> peupler la base de données
1. `rails s` -> lancement du serveur
1. [Accéder à la page web](http://localhost:3000/accueil)
1. Enjoy :smile:

## 5. Crédits

Une belle semaine en pair-programming chez [THP](https://www.thehackingproject.org) !

Les try-harders du jour pour vous servir : [joffrey7486](https://github.com/joffrey7486) et [fleopaulD](https://github.com/fleopaulD) avec le précieux soutien de la communauté THP :sparkling_heart:
