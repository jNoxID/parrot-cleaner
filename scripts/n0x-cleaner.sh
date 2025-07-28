#!/bin/bash

# Script de nettoyage pour Parrot OS - Hack the Box
# Version 1.0

echo "--------------------------------------"
echo "       Nettoyage de Parrot OS         "
echo "--------------------------------------"

# Fonction pour vérifier si une commande existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# 1. Nettoyage avec BleachBit (en ligne de commande)
if command_exists bleachbit; then
    echo "Exécution de BleachBit en ligne de commande..."
    sudo bleachbit --clean system.cache system.trash system.tmp system.logs firefox.cache
else
    echo "BleachBit n'est pas installé. Installation en cours..."
    sudo apt update && sudo apt install -y bleachbit
    sudo bleachbit --clean system.cache system.trash system.tmp system.logs firefox.cache
fi

# 2. Nettoyage du cache APT
echo "Nettoyage du cache APT..."
sudo apt clean
sudo apt autoclean
sudo apt autoremove -y

# 3. Suppression des fichiers temporaires
echo "Suppression des fichiers temporaires..."
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

# 4. Suppression des anciens journaux système
echo "Nettoyage des anciens journaux système..."
sudo journalctl --vacuum-time=7d

# 5. Recherche et suppression des fichiers inutiles
echo "Recherche des fichiers inutiles (.bak, .tmp, etc.) dans le dossier utilisateur..."
find $HOME -type f \( -name "*.bak" -o -name "*.tmp" -o -name "*.old" \) -exec rm -f {} \;

# 6. Réparation des permissions système (facultatif mais utile)
echo "Réparation des permissions système..."
sudo chmod -R u+rwX,go+rX,go-w /var/log

# 7. Nettoyage du cache des miniatures
echo "Nettoyage du cache des miniatures..."
rm -rf ~/.cache/thumbnails/*

# 8. Vérification et nettoyage des paquets cassés
echo "Recherche et suppression des paquets cassés..."
sudo dpkg --configure -a
sudo apt --fix-broken install -y

# 9. Synchronisation des données disque pour s'assurer qu'elles sont bien écrites
echo "Synchronisation des données sur le disque..."
sync

echo "--------------------------------------"
echo "Nettoyage terminé avec succès !"
echo "--------------------------------------"

exit
