---
tags: pessoa, equipa
nome:
  "{ name }":
cargo:
  "{ role }":
estado: Ativo
obra: next yard 2
---
# 👤 {{jose maga 02}}

## 📋 Informações Gerais
- **Cargo**: {{canalizador}}
- **Contacto**: 
- **Estado**: Ativo

---

## 📜 HISTÓRICO AUTOMÁTICO

### 📅 Presenças Recentes
```dataview
TABLE data as "Data", obra as "Obra", horas_extras as "Horas Extras", sabado as "Sábado"
FROM "Equipa/Presenças"
WHERE contains(funcionario, this.file.link)
SORT data DESC
LIMIT 10
```

### 📝 Tarefas Atribuídas
```dataview
TABLE status as "Status", due as "Data Limite", project as "Obra"
FROM "Tarefa"
WHERE contains(responsavel, this.file.link)
SORT status ASC, due ASC
```

### 💬 Menções em Diários
```dataview
LIST rows.file.link
FROM "Diário/Diários Diários"
WHERE contains(file.outlinks, this.file.link) OR contains(file.text, this.nome)
GROUP BY file.link
LIMIT 5
```

---
## 📝 Notas e Observações
- 
