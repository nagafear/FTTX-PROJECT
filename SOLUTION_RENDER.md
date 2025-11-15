# Solution : Erreur Render.com "failed to read dockerfile: is a directory"

## 🔴 Problème

Même avec "Dockerfile Path" = `.` (point), l'erreur persiste :
```
error: failed to solve: failed to read dockerfile: read /home/user/.local/tmp/buildkit-mount940701381/src: is a directory
```

## ✅ Solutions à Essayer

### Solution 1 : Laisser "Dockerfile Path" COMPLÈTEMENT VIDE ⭐

1. Dans Render, allez dans **Settings** > **Build & Deploy**
2. Trouvez le champ **"Dockerfile Path"**
3. **EFFACEZ complètement** la valeur (laissez le champ vide, pas même un point)
4. Cliquez sur **"Save Changes"**
5. Redéployez

**Note :** Render devrait détecter automatiquement le Dockerfile à la racine si le champ est vide.

---

### Solution 2 : Vérifier que "Root Directory" est VIDE

1. Dans **Settings** > **Build & Deploy**
2. Trouvez le champ **"Root Directory"**
3. **Assurez-vous qu'il est complètement vide** (pas de valeur)
4. Si quelque chose est dedans, effacez-le
5. Cliquez sur **"Save Changes"**
6. Redéployez

---

### Solution 3 : Spécifier Explicitement le Chemin "Dockerfile"

1. Dans **Settings** > **Build & Deploy**
2. Dans **"Dockerfile Path"**, entrez explicitement : `./Dockerfile`
3. Cliquez sur **"Save Changes"**
4. Redéployez

---

### Solution 4 : Vérifier sur GitHub

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

### Solution 5 : Créer un render.yaml pour Forcer la Configuration

Créons un fichier `render.yaml` à la racine pour forcer la configuration.

