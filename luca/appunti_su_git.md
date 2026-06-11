# Git — Lavorare con le Branch

## Cos'è una branch

Una branch è un puntatore mobile a un commit specifico. Lavorare su branch separate permette di sviluppare feature, fix o esperimenti in isolamento rispetto al ramo principale (`main` o `master`), senza rischiare di introdurre modifiche instabili.

---

## Creare e spostarsi su una branch: `git checkout -b`

```bash
git checkout -b <nome-branch>
```

Questo comando fa **due cose in una**:

1. Crea la nuova branch a partire dal commit corrente
2. Sposta immediatamente HEAD su quella branch

È equivalente a:

```bash
git branch <nome-branch>   # crea la branch
git checkout <nome-branch> # ci si sposta
```

### Esempi

```bash
# Creare una branch per una nuova feature
git checkout -b feature/login

# Creare una branch per un bugfix
git checkout -b fix/header-crash

# Creare una branch a partire da un'altra (non da quella corrente)
git checkout -b hotfix/typo origin/main
```

> **Nota:** Con Git >= 2.23 esiste anche `git switch -c <nome-branch>`, che è il comando moderno equivalente. `checkout -b` resta comunque molto diffuso e funziona ovunque.

### Verificare su quale branch ci si trova

```bash
git branch          # lista branch locali, asterisco sulla corrente
git status          # mostra anche la branch attiva in cima all'output
```

---

## Pubblicare una branch su remoto: `git push` con `origin`

Una branch creata localmente **non esiste sul remoto** finché non viene esplicitamente pubblicata.

### Prima pubblicazione (upstream non ancora impostato)

```bash
git push -u origin <nome-branch>
```

Il flag `-u` (o `--set-upstream`) fa due cose:

1. Crea la branch sul remoto `origin`
2. Collega la branch locale a quella remota (tracking), così i push e pull successivi funzionano senza specificare destinazione

```bash
# Esempio pratico
git checkout -b feature/login
# ... lavoro, commit ...
git push -u origin feature/login
```

### Push successivi (upstream già impostato)

Dopo il primo `push -u`, basta:

```bash
git push
```

Git sa già dove mandare i commit grazie al tracking impostato.

### Push esplicito senza -u

Se si vuole pushare senza impostare il tracking:

```bash
git push origin <nome-branch>
```

Utile per push una-tantum o in script, ma richiede di specificare `origin <nome-branch>` ogni volta.

---

## Flusso di lavoro tipico

```bash
# 1. Partire sempre da main aggiornato
git checkout main
git pull

# 2. Creare la branch di lavoro
git checkout -b feature/nuova-funzione

# 3. Lavorare: modifiche, staging, commit
git add .
git commit -m "feat: aggiunta nuova funzione"

# 4. Pubblicare la branch sul remoto
git push -u origin feature/nuova-funzione

# 5. Ulteriori commit e push
git add .
git commit -m "fix: correzione bug nella nuova funzione"
git push
```

---

## Comandi utili correlati

| Comando | Descrizione |
|---|---|
| `git branch` | Lista branch locali |
| `git branch -a` | Lista branch locali e remote |
| `git branch -d <nome>` | Elimina branch locale (solo se merged) |
| `git branch -D <nome>` | Elimina branch locale forzato |
| `git push origin --delete <nome>` | Elimina branch sul remoto |
| `git fetch --prune` | Sincronizza i riferimenti remoti, rimuove branch cancellate |
| `git checkout <nome>` | Spostarsi su una branch esistente |

---

## Errori comuni

**`error: src refspec <nome> does not match any`**
→ La branch locale non esiste ancora oppure c'è un typo nel nome. Verificare con `git branch`.

**`fatal: The current branch has no upstream branch`**
→ È il primo push e manca `-u`. Usare `git push -u origin <nome-branch>`.

**Push rifiutato (`rejected`)**
→ Il remoto ha commit che non sono presenti in locale. Fare prima `git pull --rebase` per allinearsi, poi ripushare.
