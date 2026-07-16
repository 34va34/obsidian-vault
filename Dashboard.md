---
tags: dashboard, home
---

# 🏗️ DASHBOARD — Gestão de Obras

[📊 Ver Relatórios Automáticos (Custos e Horas)]([[Relatórios Automáticos]])

> Última atualização: Hoje  
> Equipa Ativa: 6 pessoas

---

## 🚨 URGENTE — Próximas 24h

```tasks
not done
due before tomorrow
sort by due
limit 5
```

---

## 📊 STATUS GERAL DAS OBRAS

### Ouro Valley — Visão Geral

| Lote                                       | Progresso | Responsável              | Status          |
| ------------------------------------------ | --------- | ------------------------ | --------------- |
| [[Obras/Ouro Valley/Ouro Valley - Lote 6]] | 70%       | [[Diogo nunes.md]] | 🟢 Avançado     |
| [[Obras/Ouro Valley/Ouro Valley - Lote 4]] | 40%       |                          | 🔵 Em andamento |
| [[Obras/Ouro Valley/Ouro Valley - Lote 2]] | 20%       |                          | 🟡 Iniciando    |

---

## 👥 EQUIPA HOJE

```dataview
TABLE nome as "Pessoa", cargo as "Cargo", estado as "Estado"
FROM "Equipa/Pessoas"
WHERE estado = "Ativo"
SORT file.name ASC
```

---

## 📋 TAREFAS DO DIA

### 🟢 Completas
```tasks
done
due today
limit 10
```

### 🟡 Em Progresso
```tasks
```
not done
``` 
```

### 🔴 Atraso
```tasks
not done
due before today
limit 5
```

---

## 📦 MATERIAL — AÇÕES NECESSÁRIAS

### Encomendas Pendentes
```dataview
TABLE Data as "Data", Material as "Material", Status as "Status"
FROM "Material/Encomendas"
WHERE Status = "Pendente" OR Status = "Pedido"
SORT Data ASC
```

### Receções Hoje
```dataview
TABLE Material as "Material", Quantidade as "Qtd", Fornecedor as "Fornecedor"
FROM "Material/Encomendas"
WHERE date(Data) = today()
SORT Material ASC
```

### Inventário Crítico (< 5 unidades)
```dataview
TABLE Material as "Material", Saldo as "Stock", Lote as "Lote"
FROM "Material/Inventário"
WHERE Saldo < 5
SORT Material ASC
```

---

## 🔧 MÁQUINAS & FERRAMENTAS

Status:
- ✅ Operacional
- 🔄 Em manutenção
- 🔨 Em reparação

| Equipamento | Estado | Responsável | Observações |
|-------------|--------|-------------|-------------|
| Máquina PPR | ✅ Operacional | | |
| Furadeira | ✅ Operacional | | |
| Nível Laser | ✅ Operacional | | |

---

## 👤 PERFORMANCE DA EQUIPA

### Tarefas Hoje por Pessoa

| Pessoa                     | Tarefas | Horas | Status |
| -------------------------- | ------- | ----- | ------ |
| [[António.md]] |         |       |        |
| [[Afonso.md]]  |         |       |        |
| [[Diogo nunes.md]]   |         |       |        |
| [[Tiago rocha.md]]   |         |       |        |
| [[Yuri.md]]    |         |       |        |
| [[Equipa/Pessoas/Abel]]    |         |       |        |
|                            |         |       |        |
|                            |         |       |        |

---

## 📅 PRÓXIMAS ATIVIDADES

### Hoje
- [ ] Reunião com equipa (08:30)
- [x] Receção de material PPR ✅ 2026-07-16
- [ ] início carga lote 6 piso 1🛫 2026-07-16 
- [ ] inicio aguas lote 6 piso 2 atribuido:: [[Mario sousa]], e [[domingos felix]] 🛫 2026-07-16 

### Semana Que Vem
- [ ] 🔺 iniciar transição de pex para ppr
- [ ] contar peças de ppr casq 1/2 x dn25 e de 3/4 x dn25
- [ ] Relatório 20-20 (até 20/06)

---

## 📝 ÚLTIMOS DIÁRIOS

```dataview
LIST file.link
FROM "Diário/Diários Diários"
SORT file.ctime DESC
LIMIT 5
```

---

## ⚠️ ALERTAS E AVISOS

- ❌ Nenhum alerta crítico
- 🟡 3 tarefas em atraso
- 📦 Material crítico: Tubos PPR 25mm

---

## 🎯 ATALHOS RÁPIDOS (AÇÕES INTERATIVAS)

| Ação | Link |
|------|------|
| 🌅 **Início de Dia (Presenças + Tarefas)** | [[Templates/Ação - Início de Dia]] |
| 🚀 **Nova Obra** | [[Templates/Ação - Nova Obra]] |
| 👤 **Nova Pessoa** | [[Templates/Ação - Nova Pessoa]] |
| 📅 **Mapa de Presenças Semanal** | [[Templates/Ação - Novo Mapa Semanal]] |
| 📅 **Novo Diário** | [[Templates/Ação - Novo Diário]] |
| 📦 **Nova Encomenda** | [[Templates/Ação - Nova Encomenda]] |
| 📝 **Nova Tarefa** | [[Templates/Ação - Nova Tarefa]] |
| 📊 **Novo Relatório** | [[Templates/Ação - Novo Relatório]] |

---

## 📱 INFO RÁPIDA

- **Período Relatório**: 20/mês - 20/mês
- **Equipa**: 6 pessoas
- **Obras Ativas**: 3 lotes
- **Tarefas Totais**: 24
- **Taxa Conclusão**: 45%
