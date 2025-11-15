# Guide : Remplir le Formulaire Render.com pour FTTX-PROJECT

## ⚠️ IMPORTANT : Render.com ne Supporte Pas PHP Directement

Render.com ne propose pas PHP dans la liste des langages pour les Web Services. Nous devons utiliser **Docker** avec une image PHP.

**Deux options disponibles :**
1. ✅ **Utiliser Docker** (ce guide) - Une fois configuré, ça fonctionne parfaitement
2. ✅ **Utiliser Railway.app** - Support PHP natif (voir `DEPLOIEMENT.md` section Railway)

---

## 📝 Instructions Détaillées pour Créer votre Web Service avec Docker

### ✅ Champs Déjà Remplis (Ne Pas Modifier)

- **Source Code** : `Nedim7050 / FTTX-PROJECT` ✅
- **Name** : `FTTX-PROJECT` ✅
- **Environment** : `Production` ✅
- **Branch** : `main` ✅
- **Region** : `Oregon (US West)` ✅

---

## 🔧 Champs à Configurer

### 1. **Project** (Optionnel)
- Vous pouvez laisser **"My project"** ou créer un nouveau projet
- Pour simplifier, laissez **"My project"** ou créez un projet nommé **"FTTX"**

### 2. **Language** ✅

**Sélectionnez :** `Docker` ✅

1. Cliquez sur le menu déroulant **"Language"**
2. Sélectionnez **"Docker"** dans la liste
3. Un fichier Dockerfile a été créé dans votre projet pour configurer PHP 8.1 avec Apache

---

### 3. **Root Directory** (Optionnel)
- **Laisser VIDE** ✅
- Votre code est à la racine du dépôt, donc pas besoin de spécifier

---

### 4. **Dockerfile Path** ⚠️ IMPORTANT

**Entrez :** `.` (point) ✅

- Ce champ indique où se trouve le Dockerfile
- Comme le Dockerfile est à la racine du projet, entrez `.` (point)
- Ou laissez la valeur par défaut si elle est déjà `.`

**Note :** Un Dockerfile a été créé dans votre projet qui configure PHP 8.1 avec Apache et toutes les extensions nécessaires.

---

### 5. **Instance Type**

**Recommandation :** Choisir **"Free"** pour commencer ✅

- Cliquez sur **"Free"** ($0/month)
- **Limitations du plan Free :**
  - 512 MB RAM
  - 0.1 CPU
  - L'instance s'arrête après 15 minutes d'inactivité
  - Pas de SSH
  - Pas de scaling
  - Pas de persistent disks

**Si vous avez besoin de plus de ressources plus tard :**
- Vous pouvez toujours upgrader vers **"Starter"** ($9/month)
- Ou **"Standard"** ($25/month)

---

### 6. **Environment Variables** 🔐 TRÈS IMPORTANT

Vous devez configurer les variables d'environnement pour la connexion à votre base de données.

**⚠️ NOTE :** Un Dockerfile a été créé qui configure PHP 8.1 avec Apache. Le script docker-entrypoint.sh configure automatiquement le port dynamique Render.

**⚠️ ATTENTION :** Vous devez d'abord créer une base de données sur Render pour obtenir ces valeurs !

#### Option A : Si vous avez déjà créé une base de données sur Render

Cliquez sur **"Add Environment Variable"** pour chaque variable :

```
DB_HOST = [Copiez depuis votre base de données Render]
DB_PORT = 3306
DB_NAME = [Nom de votre base de données]
DB_USER = [Utilisateur de votre base de données]
DB_PASSWORD = [Mot de passe de votre base de données]
APP_ENV = production
```

**Où trouver ces valeurs ?**
1. Allez dans votre Dashboard Render
2. Cliquez sur votre base de données créée
3. Dans l'onglet **"Connections"** ou **"Info"**, vous trouverez :
   - Internal Database Host
   - Internal Database Port
   - Database Name
   - Database User
   - Database Password

#### Option B : Si vous n'avez pas encore créé de base de données

**ÉTAPE 1 : Créer la base de données d'abord**

1. Dans le Dashboard Render, cliquez sur **"New +"**
2. Sélectionnez **"PostgreSQL"** ou **"MySQL"**
   - **Note :** Render propose généralement PostgreSQL par défaut
   - Si vous avez besoin de MySQL spécifiquement, vous pouvez utiliser une alternative :
     - [PlanetScale](https://planetscale.com) (MySQL gratuit)
     - [Aiven](https://aiven.io) (MySQL gratuit)
     - Ou utiliser PostgreSQL (compatible avec votre code PHP/PDO)
3. Configurez :
   - **Name** : `fttx-database`
   - **Database** : `fttx_project`
   - **User** : (auto-généré)
   - **Plan** : **Free**
4. Cliquez sur **"Create Database"**
5. **IMPORTANT :** Notez toutes les informations de connexion affichées

**ÉTAPE 2 : Revenir au formulaire du Web Service**

Ajoutez les variables d'environnement avec les valeurs de votre base de données :

| Variable | Valeur | Exemple |
|----------|--------|---------|
| `DB_HOST` | Host interne de Render | `dpg-xxxxx-a.oregon-postgres.render.com` |
| `DB_PORT` | Port (3306 pour MySQL, 5432 pour PostgreSQL) | `5432` ou `3306` |
| `DB_NAME` | Nom de la base de données | `fttx_project` |
| `DB_USER` | Utilisateur de la base | `fttx_user` |
| `DB_PASSWORD` | Mot de passe de la base | `[mot de passe fourni]` |
| `APP_ENV` | Environnement | `production` |

**Pour chaque variable :**
1. Cliquez sur **"Add Environment Variable"**
2. Entrez le **NAME** (ex: `DB_HOST`)
3. Entrez la **value** (ex: `dpg-xxxxx-a.oregon-postgres.render.com`)
4. Cliquez sur **"Save"** ou appuyez sur Entrée
5. Répétez pour chaque variable

---

### 7. **Advanced** (Ouvrir cette section) ⚠️ IMPORTANT

Cliquez sur **"Advanced"** pour ouvrir les options avancées.

#### **Build Command**
- **Laisser VIDE** ✅
- Pas de build nécessaire pour une application PHP simple

#### **Start Command**

- **Laissez VIDE** ✅
- Docker utilisera automatiquement la commande CMD du Dockerfile
- Le Dockerfile configure déjà Apache pour démarrer correctement

#### **Health Check Path** (Optionnel)
- Vous pouvez laisser vide ou entrer : `/` ou `/index.php`

---

## 📋 Récapitulatif des Configurations

| Champ | Valeur |
|-------|--------|
| **Source Code** | `Nedim7050 / FTTX-PROJECT` ✅ |
| **Name** | `FTTX-PROJECT` ✅ |
| **Project** | `My project` (ou créez-en un) |
| **Environment** | `Production` ✅ |
| **Language** | `PHP` ⚠️ **À CHANGER** |
| **Branch** | `main` ✅ |
| **Region** | `Oregon (US West)` ✅ |
| **Root Directory** | (vide) ✅ |
| **Instance Type** | `Free` ✅ |
| **Environment Variables** | Voir ci-dessus ⚠️ **À CONFIGURER** |
| **Build Command** | (vide) ✅ |
| **Start Command** | `php -S 0.0.0.0:$PORT` ⚠️ **À CONFIGURER** |

---

## ✅ Checklist Avant de Cliquer sur "Create Web Service"

- [ ] **Language** : **Docker** sélectionné ✅
- [ ] **Dockerfile Path** : `.` (point) ✅
- [ ] **Instance Type** : **Free** sélectionné
- [ ] **Base de données** créée sur Render (si pas encore fait)
- [ ] **Environment Variables** configurées :
  - [ ] `DB_HOST`
  - [ ] `DB_PORT`
  - [ ] `DB_NAME`
  - [ ] `DB_USER`
  - [ ] `DB_PASSWORD`
  - [ ] `APP_ENV = production`
- [ ] **Advanced** ouvert
- [ ] **Start Command** configuré : `php -S 0.0.0.0:$PORT`
- [ ] **Build Command** laissé vide

---

## 🚀 Après Avoir Cliqué sur "Create Web Service"

1. **Render va automatiquement :**
   - Cloner votre dépôt GitHub
   - Détecter le Dockerfile
   - Construire l'image Docker avec PHP 8.1 et Apache
   - Installer les extensions PHP nécessaires (PDO, MySQL, GD, ZIP)
   - Démarrer le conteneur avec Apache

2. **Attendez 5-10 minutes** pour le premier déploiement
   - ⚠️ La construction Docker prend plus de temps que les déploiements natifs (5-10 minutes)

3. **Vérifiez les logs :**
   - Cliquez sur votre service
   - Allez dans l'onglet **"Logs"**
   - Vérifiez qu'il n'y a pas d'erreurs

4. **Votre application sera accessible à :**
   - `https://fttx-project.onrender.com` (ou un nom similaire)
   - L'URL exacte sera affichée dans le dashboard

---

## 🐛 Dépannage

### Erreur : "Cannot find Dockerfile"
**Solution :**
- Vérifiez que le Dockerfile est à la racine du projet (il a été créé automatiquement)
- Vérifiez que le "Dockerfile Path" est `.` (point)

### Erreur : "Port already in use"
**Solution :**
- Le script docker-entrypoint.sh configure automatiquement le port
- Vérifiez que docker-entrypoint.sh est dans le projet

### Erreur : "Cannot connect to database"
- Vérifiez que toutes les variables d'environnement sont correctes
- Vérifiez que votre base de données est dans la même région (Oregon)

### Erreur : "Port already in use"
- Ne modifiez pas `$PORT` dans la commande start, Render le gère automatiquement

### L'application ne démarre pas
- Vérifiez les logs dans le dashboard
- Assurez-vous que `index.php` existe à la racine
- Vérifiez la syntaxe PHP (pas d'erreurs)

---

## 📞 Besoin d'Aide ?

1. Consultez les logs de votre service dans Render
2. Vérifiez que toutes les variables d'environnement sont définies
3. Vérifiez la documentation Render : https://render.com/docs

---

**Bonne chance avec votre déploiement ! 🚀**

