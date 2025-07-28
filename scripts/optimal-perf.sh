#!/bin/bash

# Script de mise à jour et optimisation pour Parrot OS - Hack the Box
# Version 1.0

# Afficher une bannière
echo "--------------------------------------"
echo "      Mise à jour de Parrot OS       "
echo "--------------------------------------"

# Vérification des privilèges root
if [ "$EUID" -ne 0 ]; then
    echo "Veuillez exécuter ce script avec des privilèges root (sudo)."
    exit 1
fi

# Mettre à jour la liste des paquets
echo "1. Mise à jour de la liste des paquets..."
sudo apt update

# Mise à jour complète des paquets
echo "2. Mise à jour complète des paquets (upgrade)..."
sudo apt upgrade -y

# Mise à niveau des paquets et du système (dist-upgrade)
echo "3. Mise à niveau du système complet (dist-upgrade)..."
sudo apt dist-upgrade -y

# Suppression des dépendances inutiles
echo "4. Suppression des paquets obsolètes et inutiles (autoremove)..."
sudo apt autoremove -y

# Nettoyage du cache APT
echo "5. Nettoyage du cache APT (autoclean et clean)..."
sudo apt autoclean
sudo apt clean

# Vérification et correction des paquets cassés
echo "6. Vérification et réparation des paquets cassés..."
sudo dpkg --configure -a
sudo apt --fix-broken install -y

# Mise à jour des snaps (si Snap est installé)
if command -v snap >/dev/null 2>&1; then
    echo "7. Mise à jour des paquets Snap..."
    sudo snap refresh
else
    echo "Snap n'est pas installé, aucune mise à jour Snap effectuée."
fi

# Mise à jour des Flatpak (si Flatpak est installé)
if command -v flatpak >/dev/null 2>&1; then
    echo "8. Mise à jour des applications Flatpak..."
    flatpak update -y
else
    echo "Flatpak n'est pas installé, aucune mise à jour Flatpak effectuée."
fi

# Synchronisation des données sur le disque
echo "9. Synchronisation des données disque..."
sync

# Vérification de l'espace disque disponible
echo "10. Vérification de l'espace disque disponible :"
df -h | grep -E '^/dev/'

# Fin du script
echo "--------------------------------------"
echo "Mise à jour et optimisation terminées avec succès !"
echo "--------------------------------------"

exit