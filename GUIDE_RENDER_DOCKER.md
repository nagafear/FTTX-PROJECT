# Guide : Déployer PHP sur Render.com avec Docker

## 🔧 Solution : Utiliser Docker sur Render.com

Puisque Render.com ne propose pas PHP directement dans la liste des langages, nous allons utiliser **Docker** avec une image PHP.

---

## 📋 Instructions pour Remplir le Formulaire Render.com

### ✅ Champs Déjà Remplis (Ne Pas Modifier)

- **Source Code** : `Nedim7050 / FTTX-PROJECT` ✅
- **Name** : `FTTX-PROJECT` ✅
- **Environment** : `Production` ✅
- **Branch** : `main` ✅
- **Region** : `Oregon (US West)` ✅

---

### 🔧 Champs à Configurer

#### 1. **Language** 

**Sélectionnez :** `Docker` ✅

- Cliquez sur le menu déroulant "Language"
- Sélectionnez **"Docker"**

#### 2. **Project** (Optionnel)

- Laissez **"My project"** ou créez un nouveau projet nommé **"FTTX"**

#### 3. **Root Directory** (Optionnel)

- **Laissez VIDE** ✅
- Votre code est à la racine du dépôt

#### 4. **Dockerfile Path**

- **Entrez :** `.` (point) ✅
- Ou laissez la valeur par défaut `.`
- Cela indique que le Dockerfile est à la racine du projet

#### 5. **Instance Type**

**Recommandation :** Choisir **"Free"** pour commencer ✅

- Cliquez sur **"Free"** ($0/month)
- **Limitations :**
  - 512 MB RAM
  - 0.1 CPU
  - S'arrête après 15 minutes d'inactivité

#### 6. **Environment Variables** 🔐 TRÈS IMPORTANT

**⚠️ ATTENTION :** Vous devez d'abord créer une base de données sur Render !

##### Étape A : Créer une Base de Données (si pas déjà fait)

1. Dans le Dashboard Render, cliquez sur **"New +"**
2. Sélectionnez **"PostgreSQL"** (ou "MySQL" si disponible)
3. Configurez :
   - **Name** : `fttx-database`
   - **Database** : `fttx_project`
   - **Plan** : **Free**
4. Cliquez sur **"Create Database"**
5. **IMPORTANT :** Notez toutes les informations de connexion affichées

##### Étape B : Ajouter les Variables d'Environnement

Cliquez sur **"Add Environment Variable"** pour chaque variable :

| Variable | Valeur | Exemple |
|----------|--------|---------|
| `DB_HOST` | Host de votre DB Render | `dpg-xxxxx-a.oregon-postgres.render.com` |
| `DB_PORT` | Port (5432 pour PostgreSQL, 3306 pour MySQL) | `5432` |
| `DB_NAME` | Nom de la base de données | `fttx_project` |
| `DB_USER` | Utilisateur de la base | `fttx_user` |
| `DB_PASSWORD` | Mot de passe de la base | `[mot de passe copié]` |
| `APP_ENV` | Environnement | `production` |

**Pour chaque variable :**
1. Cliquez sur **"Add Environment Variable"**
2. Entrez le **NAME** (ex: `DB_HOST`)
3. Entrez la **value** (ex: `dpg-xxxxx-a.oregon-postgres.render.com`)
4. Cliquez sur **"Save"**

#### 7. **Advanced** (Ouvrir cette section) ⚠️ IMPORTANT

Cliquez sur **"Advanced"** pour ouvrir les options avancées.

##### **Build Command**

- **Laissez VIDE** ✅
- Docker construira automatiquement l'image à partir du Dockerfile

##### **Start Command**

- **Laissez VIDE** ✅
- Docker utilisera automatiquement la commande CMD du Dockerfile

---

## ✅ Checklist Avant de Cliquer sur "Create Web Service"

- [ ] **Language** : `Docker` sélectionné
- [ ] **Dockerfile Path** : `.` (point)
- [ ] **Instance Type** : `Free` sélectionné
- [ ] **Base de données** créée sur Render
- [ ] **Environment Variables** configurées :
  - [ ] `DB_HOST`
  - [ ] `DB_PORT`
  - [ ] `DB_NAME`
  - [ ] `DB_USER`
  - [ ] `DB_PASSWORD`
  - [ ] `APP_ENV = production`
- [ ] **Advanced** ouvert (optionnel, pour vérifier)
- [ ] **Build Command** : vide
- [ ] **Start Command** : vide

---

## 🚀 Après Avoir Cliqué sur "Create Web Service"

1. **Render va automatiquement :**
   - Cloner votre dépôt GitHub
   - Détecter le Dockerfile
   - Construire l'image Docker avec PHP 8.1 et Apache
   - Installer les extensions PHP nécessaires (PDO, MySQL, GD, ZIP)
   - Démarrer le conteneur

2. **Attendez 5-10 minutes** pour le premier déploiement
   - La construction Docker prend plus de temps que les déploiements natifs

3. **Vérifiez les logs :**
   - Cliquez sur votre service
   - Allez dans l'onglet **"Logs"**
   - Vérifiez qu'il n'y a pas d'erreurs
   - Vous devriez voir : "Apache/2.x.x (Unix) configured" ou similaire

4. **Votre application sera accessible à :**
   - `https://fttx-project.onrender.com` (ou un nom similaire)
   - L'URL exacte sera affichée dans le dashboard

---

## 📦 Fichiers Docker Créés

### Dockerfile
- Image PHP 8.1 avec Apache
- Extensions : PDO, MySQL, GD, ZIP
- Configuration pour servir les fichiers PHP

### docker-entrypoint.sh
- Script pour configurer le port dynamique Render
- Configure Apache pour écouter sur le port fourni par Render ($PORT)

---

## 🐛 Dépannage

### Erreur : "Cannot find Dockerfile"
**Solution :**
- Vérifiez que le Dockerfile est à la racine du projet
- Vérifiez que le "Dockerfile Path" est `.` (point)

### Erreur : "Port already in use"
**Solution :**
- Le script docker-entrypoint.sh configure automatiquement le port
- Vérifiez que docker-entrypoint.sh est exécutable (chmod +x)

### Erreur : "Cannot connect to database"
**Solution :**
- Vérifiez que toutes les variables d'environnement sont correctes
- Vérifiez que votre base de données est dans la même région (Oregon)
- Pour PostgreSQL, assurez-vous que le port est 5432

### L'application ne démarre pas
**Solution :**
- Consultez les logs dans le dashboard Render
- Vérifiez que index.php existe à la racine
- Vérifiez la syntaxe PHP (pas d'erreurs)

### Build échoue
**Solution :**
- Vérifiez que le Dockerfile est valide
- Consultez les logs de build dans Render
- Vérifiez que toutes les dépendances sont installées

---

## 🔄 Alternative : Railway.app (Support PHP Natif)

Si vous préférez éviter Docker, **Railway.app** supporte PHP nativement :

### Avantages Railway :
- ✅ Support PHP natif (pas besoin de Docker)
- ✅ Interface plus simple
- ✅ Déploiement plus rapide
- ✅ 5$ de crédit gratuit/mois

### Guide Railway :
Consultez `DEPLOIEMENT.md` section "Étape 4 : Alternative - Déployer sur Railway.app"

---

## 📚 Ressources

- [Documentation Render Docker](https://render.com/docs/docker)
- [Documentation Railway PHP](https://docs.railway.app/languages/php)
- Guide complet : Voir `DEPLOIEMENT.md`

---

**Bon déploiement avec Docker ! 🐳**

