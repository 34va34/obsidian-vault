ouro valley
next yard
# 🏗️ Obras Ativas

```dataview
TABLE Estado, "Data início"
FROM "Obras"
SORT file.name ASC
```

---

# 📋 Tarefas Pendentes

```tasks
not done
sort by due
limit 15
```

---

# ⚠️ Tarefas Urgentes

```tasks
not done
due before tomorrow
sort by due
```

---

# 📖 Últimos Diários

```dataview
LIST
FROM "Diário"
SORT file.ctime DESC
LIMIT 10
```

---

# 📦 Material

```dataview
LIST
FROM "Material"
SORT file.ctime DESC
LIMIT 10
```