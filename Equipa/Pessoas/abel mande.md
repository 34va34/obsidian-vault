---
tags: pessoa, equipa
nome: abel mande
cargo: canalizador
estado: inativo
observação:
  - mudou de obra
início:
saída: 2026-07-28
---
# 👤 Abel mande

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
