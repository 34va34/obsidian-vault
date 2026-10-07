---
tags: relatorio, semanal, obras, gestao
tipo: relatorio-semanal
semana: {{date:gggg-[W]WW}}
data_relatorio: {{date}}
---
# 📅 Relatório Semanal de Obras — {{date:gggg-[W]WW}}

> Usar este relatório no final da semana para transformar o acompanhamento diário em decisões para a semana seguinte.

## 1. Resumo da semana

### Obras e locais ativos

```dataview
TABLE obra as "Obra", lote as "Lote", piso as "Piso", estado as "Estado", data_inicio as "Início"
FROM "Obras"
WHERE obra AND estado = "Em andamento"
SORT obra ASC, lote ASC, piso ASC
```

### Indicadores de decisão

```dataviewjs
const tarefas = dv.pages('"Tarefas"').where(p => p.estado);
const falhas = dv.pages('"Gestão/Falhas"');
const vistorias = dv.pages('"Gestão/Vistorias"');
const materiais = dv.pages('"Material/Encomendas"').where(p => p.estado);
const tarefasAbertas = tarefas.where(p => !['Concluído', 'Cancelado'].includes(String(p.estado)));
const falhasAbertas = falhas.where(p => String(p.estado) !== 'Concluído');
const materiaisPendentes = materiais.where(p => ['Pendente', 'Pedido'].includes(String(p.estado)));
const semResultado = vistorias.where(p => !p.resultado || String(p.resultado).trim() === '');
dv.table(['Indicador', 'Total'], [
  ['Tarefas abertas', tarefasAbertas.length],
  ['Tarefas concluídas', tarefas.where(p => String(p.estado) === 'Concluído').length],
  ['Falhas abertas', falhasAbertas.length],
  ['Vistorias sem resultado', semResultado.length],
  ['Materiais pendentes/pedidos', materiaisPendentes.length],
]);
```

## 2. Tarefas concluídas e pendentes

### Trabalhos concluídos recentemente

```dataview
TABLE obra as "Obra", lote as "Lote", piso as "Piso", trabalho_modelo as "Trabalho", responsavel as "Responsável", data_fim as "Conclusão"
FROM "Tarefas"
WHERE estado = "Concluído"
SORT data_fim DESC
LIMIT 30
```

### Tarefas que transitam para a próxima semana

```dataview
TABLE file.link as "Tarefa", obra as "Obra", lote as "Lote", piso as "Piso", estado as "Estado", responsavel as "Responsável", data_limite as "Prazo"
FROM "Tarefas"
WHERE estado != "Concluído"
SORT obra ASC, lote ASC, data_limite ASC
```

## 3. Qualidade e correções

### Falhas ainda abertas

```dataview
TABLE obra as "Obra", lote as "Lote", gravidade as "Gravidade", estado as "Estado", data as "Aberta", file.link as "Falha"
FROM "Gestão/Falhas"
WHERE estado != "Concluído"
SORT gravidade DESC, data ASC
```

### Vistorias a fechar

```dataview
TABLE obra as "Obra", lote as "Lote/Piso", data as "Data", resultado as "Resultado", file.link as "Vistoria"
FROM "Gestão/Vistorias"
WHERE !resultado OR resultado = "" OR resultado = "Reprovado"
SORT data ASC
```

## 4. Materiais e bloqueios

```dataview
TABLE obra as "Obra", lote as "Lote", estado as "Estado", data_pedido as "Pedido", data_entrega_prevista as "Entrega", file.link as "Encomenda"
FROM "Material/Encomendas"
WHERE estado = "Pendente" OR estado = "Pedido"
SORT data_entrega_prevista ASC
```

## 5. Registo da semana pelo responsável

### O que avançou

- andar modelo com aguas quase prontas e esgotos ligados

### O que bloqueou

- 

### Decisões tomadas

- 

### Prioridades da próxima semana

1. aguas do corredor teto
2. iniciar esgotos do -1 bloco b
3. terminar de fazer aguas no teto do interior das casas

### Materiais a confirmar

- chegada dos tes dn110/50 e tes dn 125/110

### Pessoas / equipas a coordenar

- [[Equipa/José Magalhães]][[andre Magalhães ]][[el houcine]][[Henriques ]]

## 6. Fecho

- [ ] Todos os trabalhos concluídos foram marcados como `Concluído`.
- [ ] Todas as falhas têm responsável e prazo.
- [ ] Todas as vistorias têm resultado.
- [ ] Todas as encomendas pendentes foram confirmadas.
- [x] As prioridades da próxima semana foram definidas. ✅ 2026-10-02
