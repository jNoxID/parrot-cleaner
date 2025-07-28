# 🧹 Script de Nettoyage pour Parrot OS

Ce script Bash automatise le nettoyage d'un système **Parrot OS**, particulièrement adapté à un usage dans un environnement **Hack The Box** ou tout autre scénario de pentest. Il supprime les fichiers inutiles, optimise l'espace disque et améliore la confidentialité en nettoyant les caches et journaux système.

## 📜 Fonctionnalités

- Nettoyage avancé avec **BleachBit** (en ligne de commande)
- Suppression du cache APT et des paquets obsolètes
- Nettoyage des fichiers temporaires et anciens journaux
- Suppression des fichiers inutiles (`*.bak`, `*.tmp`, `*.old`)
- Réparation des permissions sur `/var/log`
- Purge du cache de miniatures
- Détection et correction des paquets cassés
- Synchronisation des données disque

## ⚙️ Prérequis

- Parrot OS (ou toute distribution Debian-based compatible)
- Droits `sudo` pour exécuter les commandes système

## 🚀 Installation et utilisation

1. Cloner le dépôt ou copier le script sur votre machine :

   ```bash
   git clone https://github.com/votre-utilisateur/parrot-cleanup.git
   cd parrot-cleanup
   chmod +x cleanup.sh
   ./cleanup.sh
   ```

   cleanup.sh # Script principal de nettoyage README.md # Documentation du projet

# 🧹 Script de Nettoyage pour Parrot OS — Ce script Bash automatise le nettoyage d'un système Parrot OS, particulièrement adapté à un usage dans un environnement Hack The Box ou tout autre scénario de pentest. Il supprime les fichiers inutiles, optimise l'espace disque et améliore la confidentialité en nettoyant les caches et journaux système. Fonctionnalités : nettoyage avancé avec BleachBit (en ligne de commande), suppression du cache APT et des paquets obsolètes, nettoyage des fichiers temporaires et anciens journaux, suppression des fichiers inutiles (_.bak, _.tmp, \*.old), réparation des permissions sur /var/log, purge du cache de miniatures, détection et correction des paquets cassés, synchronisation des données disque. Prérequis : Parrot OS ou toute distribution Debian-based compatible, droits sudo. Installation : cloner le dépôt, donner les droits d'exécution avec chmod +x cleanup.sh, puis exécuter ./cleanup.sh. Exemple de sortie : Nettoyage de Parrot OS… Exécution de BleachBit… Nettoyage du cache APT… Suppression des fichiers temporaires… etc. Technologies utilisées : Bash, BleachBit, APT, outils systèmes Linux. Auteur : Jérôme Pointreau (https://github.com/jNoxID). Licence : GPL-3.0-only

## 👨‍💼 Auteurs

- Jérôme Pointreau

## 📄 Licence

Ce projet est sous licence GPL-3.0-only. Voir le fichier [LICENSE](LICENSE) pour plus d'informations.
