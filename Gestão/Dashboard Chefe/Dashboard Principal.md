---
tags: dashboard, gestao
---
# 🏗️ Dashboard do Chefe de Equipa

> [!INFO] Atalhos Rápidos
> [[Templates/Ação - Registar Falha|⚠️ Registar Falha]] | [[Templates/Ação - Realizar Vistoria|✅ Realizar Vistoria]] | [[Templates/Ação - Ponto de Situação|📈 Ponto de Situação]] | [[Templates/Ação - Início de Dia|📅 Início de Dia]]

---

## 🚩 Alertas e Falhas Pendentes
\`\`\`dataview
TABLE gravidade as "Gravidade", status as "Estado", data as "Data"
FROM "Gestão/Falhas"
WHERE status != "Concluído"
SORT data DESC
\`\`\`

---

## 🔍 Vistorias Recentes
\`\`\`dataview
TABLE resultado as "Resultado", data as "Data"
FROM "Gestão/Vistorias"
SORT data DESC
LIMIT 5
\`\`\`

---

## 📊 Progresso e Estimativas de Lotes
\`\`\`dataview
TABLE progresso + "%" as "Progresso", data_inicio as "Início", data as "Última Alt."
FROM "Gestão/Dashboard Chefe"
WHERE tags = "ponto-situacao"
SORT data DESC
\`\`\`

---

## 📅 Lembretes e Tarefas do Chefe
- [ ] Rever relatórios de ontem
- [ ] Validar presenças da equipa
- [ ] Encomendar materiais para amanhã

---

## 👷 Resumo de Obras Ativas
\`\`\`dataview
TABLE rows.file.link as "Registos"
FROM "Diário/Diários Diários"
WHERE data = date(today)
GROUP BY obra
\`\`\`
