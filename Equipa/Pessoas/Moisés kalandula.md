---
tags: pessoa, equipa
nome: Moisés kalandula
cargo: canalizador
estado: inativo
---
# 👤 Moisés kalandula

---

## 📜 HISTÓRICO AUTOMÁTICO

### 📅 Presenças Recentes
```dataview
TABLE data as "Data", obra as "Obra", horas_extras as "Horas Extras", sabado as "Sábado"
FROM "Equipa/Presenças"
WHERE contains(file.outlinks, this.file.link)
SORT data DESC
LIMIT 10
```

### 📝 Tarefas Atribuídas
```dataview
TABLE estado as "Estado", data_limite as "Data Limite", obra as "Obra"
FROM "tarefas"
WHERE contains(responsavel, this.file.link)
SORT estado ASC, data_limite ASC
```

### 💬 Menções em Diários
```dataview
LIST rows.file.link
FROM "diário/Diários Diários"
WHERE contains(file.outlinks, this.file.link) OR contains(file.text, this.nome)
GROUP BY file.link
LIMIT 5
```

---
## 📝 Notas e Observações
- 
