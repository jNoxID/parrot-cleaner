#!/bin/bash

echo "🔄 Démarrage du nettoyage avec BleachBit..."

# Liste des options de nettoyage
OPTIONS="system.cache system.clipboard system.tmp system.recent_documents system.trash"

# Nettoyage pour l'utilisateur actuel
echo "🧹 Nettoyage pour l'utilisateur actuel ($(whoami))..."
bleachbit --clean $OPTIONS
echo "✅ Nettoyage utilisateur terminé."

# Vérification si l'utilisateur est root, sinon exécuter avec sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "🛠️ Nettoyage en tant que root..."
    sudo bleachbit --clean $OPTIONS
    echo "✅ Nettoyage root terminé."
else
    echo "🔹 Vous êtes déjà root, pas besoin d'exécuter sudo."
fi

echo "🎯 Nettoyage complet terminé !"

