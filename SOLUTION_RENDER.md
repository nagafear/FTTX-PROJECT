# Solution : Erreur Render.com "failed to read dockerfile: is a directory"

## 🔴 Problème

Même avec "Dockerfile Path" = `.` (point), l'erreur persiste :
```
error: failed to solve: failed to read dockerfile: read /home/user/.local/tmp/buildkit-mount940701381/src: is a directory
```

## ✅ Solutions à Essayer (Dans l'Ordre)

### ⭐ Solution 1 : Laisser "Dockerfile Path" COMPLÈTEMENT VIDE

**C'est la solution la plus probable !**

1. Dans Render, allez dans votre service **FTTX-PROJECT**
2. Cliquez sur **"Settings"** (ou "Environment")
3. Trouvez l'onglet **"Build & Deploy"** ou cherchez **"Dockerfile Path"**
4. **EFFACEZ complètement** la valeur dans "Dockerfile Path" (ne laissez même pas `.`)
5. Le champ doit être **complètement vide**
6. Cliquez sur **"Save Changes"**
7. Redéployez : **"Manual Deploy"** > **"Deploy latest commit"**

**Note :** Render devrait détecter automatiquement le Dockerfile à la racine si le champ est vide.

---

### ✅ Solution 2 : Vérifier que "Root Directory" est VIDE

1. Dans **Settings** > **Build & Deploy**
2. Trouvez le champ **"Root Directory"**
3. **Assurez-vous qu'il est complètement vide** (pas de valeur, pas même un point)
4. Si quelque chose est dedans, **effacez-le complètement**
5. Cliquez sur **"Save Changes"**
6. Redéployez

---

### ✅ Solution 3 : Essayer "Dockerfile" Explicitement (Sans Point)

1. Dans **Settings** > **Build & Deploy**
2. Dans **"Dockerfile Path"**, entrez exactement : `Dockerfile` (sans le point, sans slash)
3. Cliquez sur **"Save Changes"**
4. Redéployez

---

### ✅ Solution 4 : Essayer "./Dockerfile" avec Slash

1. Dans **Settings** > **Build & Deploy**
2. Dans **"Dockerfile Path"**, entrez : `./Dockerfile`
3. Cliquez sur **"Save Changes"**
4. Redéployez

---

### ✅ Solution 5 : Vérifier sur GitHub

1. Allez sur : https://github.com/Nedim7050/FTTX-PROJECT
2. Vérifiez que le fichier **Dockerfile** est bien visible à la racine du dépôt
3. Cliquez sur le fichier pour voir son contenu
4. Le fichier doit commencer par `FROM php:8.1-apache`

Si le Dockerfile n'est pas visible sur GitHub :
```bash
git add Dockerfile
git commit -m "Ensure Dockerfile is at root"
git push origin main
```

---

### ✅ Solution 6 : Supprimer et Recréer le Service (Solution Ultime)

Si aucune des solutions ci-dessus ne fonctionne :

1. **Sauvegardez vos variables d'environnement** (copiez-les quelque part)
2. Dans Render, cliquez sur votre service **FTTX-PROJECT**
3. Allez dans **"Settings"** > **"Danger Zone"** ou cliquez sur le menu (⋯)
4. Cliquez sur **"Delete Service"** ou **"Destroy"**
5. Confirmez la suppression

6. **Recréez** un nouveau service :
   - Cliquez sur **"New +"** > **"Web Service"**
   - Sélectionnez votre dépôt GitHub : **FTTX-PROJECT**
   - **Name** : `fttx-project`
   - **Language** : Sélectionnez **"Docker"** ⚠️ IMPORTANT
   - **Branch** : `main`
   - **Region** : `Oregon (US West)`
   - **Dockerfile Path** : ⚠️ **LAISSEZ COMPLÈTEMENT VIDE** (ne mettez rien)
   - **Root Directory** : ⚠️ **LAISSEZ COMPLÈTEMENT VIDE** (ne mettez rien)
   - **Instance Type** : `Free`
   - **Environment Variables** : Ajoutez vos 6 variables
   - **Advanced** : Ne touchez pas aux champs Build Command et Start Command (laissez vides)
   
7. Cliquez sur **"Create Web Service"**

---

## 🔍 Diagnostic

L'erreur `read /home/user/.local/tmp/buildkit-mount940701381/src: is a directory` suggère que :
- Render essaie de lire un répertoire au lieu d'un fichier
- Il cherche peut-être dans un répertoire `src` qui n'existe pas ou qui est un répertoire
- Le problème vient probablement de la configuration du "Dockerfile Path" ou "Root Directory"

---

## 📋 Checklist Avant de Recréer le Service

Si vous décidez de supprimer et recréer :

- [ ] Variables d'environnement sauvegardées (copiées quelque part)
- [ ] Base de données créée sur Render (si nécessaire)
- [ ] Dockerfile visible sur GitHub à la racine
- [ ] Prêt à recréer le service avec les bonnes configurations

---

## 📝 Configuration Correcte

### Dans Render Settings :

| Champ | Valeur Correcte |
|-------|----------------|
| **Language** | `Docker` |
| **Dockerfile Path** | `VIDE` (rien du tout) ou `Dockerfile` |
| **Root Directory** | `VIDE` (rien du tout) |
| **Build Command** | `VIDE` (laissez vide) |
| **Start Command** | `VIDE` (laissez vide) |

---

## 🚀 Après Avoir Appliqué la Solution

1. Attendez 5-10 minutes pour le déploiement Docker
2. Vérifiez les logs dans Render
3. Votre application devrait être accessible à l'URL fournie

---

## 📞 Si Rien Ne Fonctionne

1. Consultez les logs de build dans Render (Build Logs)
2. Vérifiez la documentation Render : https://render.com/docs/docker
3. Contactez le support Render avec les détails de l'erreur

---

**Essayez d'abord la Solution 1 (Dockerfile Path vide) - c'est souvent la solution ! ⭐**
