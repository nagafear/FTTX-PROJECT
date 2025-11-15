#!/bin/bash

# Script d'entrée Docker pour Render.com
# Configure Apache pour écouter sur le port fourni par Render ($PORT)

# Si le port est défini par Render, on l'utilise
# Sinon, on utilise le port 80 par défaut
PORT=${PORT:-80}

# Configuration Apache pour écouter sur le port spécifié
sed -i "s/Listen 80/Listen $PORT/g" /etc/apache2/ports.conf
sed -i "s/:80/:$PORT/g" /etc/apache2/sites-enabled/000-default.conf

# Exécuter la commande passée en argument (apache2-foreground)
exec "$@"

