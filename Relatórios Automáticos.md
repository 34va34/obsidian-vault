---
tags: relatorio, automacao, dashboard
---
# 📊 Centro de Relatórios Automáticos

Este painel utiliza o **Dataview** para calcular dados em tempo real com base nas suas notas de obras, encomendas e presenças.

> Para acompanhamento diário completo, use [[Gestão/Relatórios/Acompanhamento Avançado de Obras]]. Para a reunião de fim de semana, use [[Gestão/Relatórios/Relatório Semanal de Obras]].

---

## 💰 GESTÃO FINANCEIRA (MATERIAIS)

### Gastos Totais por Obra
```dataview
TABLE sum(rows.valor_total) as "Total Gasto", count(rows) as "Nº Encomendas"
FROM "Material/Encomendas"
WHERE responsabilidade_atual != "Outra pessoa" AND (obra = "Lavandeira" OR !obra)
GROUP BY obra
```

### Encomendas por Receber
```dataview
TABLE data_entrega_prevista as "Entrega Prevista", responsavel_recepcao as "Responsável"
FROM "Material/Encomendas"
WHERE (estado = "Pendente" OR estado = "Pedido") AND responsabilidade_atual != "Outra pessoa" AND (obra = "Lavandeira" OR !obra)
SORT data_entrega_prevista ASC
```

---

## 👷 GESTÃO DE EQUIPA (HORAS EXTRAS)

> **Nota**: Para que estes dados apareçam, deve usar o sistema de "Registar Presenças" que criámos.

### Resumo de Horas Extras (Este Mês)
```dataview
TABLE sum(rows.horas_extras) as "Total Horas Extras", count(rows) as "Dias Trabalhados"
FROM "Equipa/Presenças"
WHERE data.month = date(today).month
GROUP BY funcionario
```

### Registo de Sábados Trabalhados
```dataview
LIST rows.data
FROM "Equipa/Presenças"
WHERE sabado = true
GROUP BY funcionario
```

---

## 🏗️ PROGRESSO DAS OBRAS

### Status de Lotes Ativos
```dataview
TABLE estado as "Estado", data_inicio as "Início", morada as "Localização"
FROM "Obras"
WHERE tags = "obra" AND estado != "Concluído" AND responsabilidade_atual != "Outra pessoa" AND (obra = "Lavandeira" OR !obra)
SORT estado DESC
```

### Trabalhos Reutilizados Pendentes
```dataview
TABLE obra as "Obra", lote as "Lote", piso as "Piso", trabalho_modelo as "Trabalho", estado as "Estado", responsavel as "Responsável"
FROM "Tarefas/Reutilizadas"
WHERE estado != "Concluído" AND responsabilidade_atual != "Outra pessoa" AND contains(lower(obra), "lavandeira")
SORT obra ASC, lote ASC, piso ASC, estado ASC
```

---

## 🎯 ATALHOS DE APOIO
- [[Dashboard|⬅️ Voltar ao Dashboard]]
- [[Templates/Ação - Registar Presenças|✅ Registar Nova Presença]]
- [[Templates/Ação - Nova Encomenda|📦 Nova Encomenda]]
- [[Gestão/Relatórios/Acompanhamento Avançado de Obras|📈 Acompanhamento Avançado]]
- [[Templates/Ação - Criar Relatório Semanal|📅 Criar Relatório Semanal]]
- [[Templates/Ação - Fecho de Cobrança 20-20|💰 Fecho de Cobrança 20–20]]

---
> **Dica**: Se as tabelas estiverem vazias, certifique-se de que preencheu os campos `obra`, `valor_total` e `horas_extras` nas respetivas notas.
