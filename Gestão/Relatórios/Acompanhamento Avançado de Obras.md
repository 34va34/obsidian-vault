---
tags: relatorio, acompanhamento, obras, gestao
tipo: acompanhamento-avancado
atualizacao: hoje
---
# 📊 Acompanhamento Avançado de Obras

> Painel operacional em tempo real. Os números são calculados a partir das notas existentes. Quando um campo não estiver preenchido, o painel mostra o registo como **Por preencher** em vez de inventar valores.

## 🚦 Resumo executivo

```dataviewjs
const current = p => p.responsabilidade_atual !== 'Outra pessoa' && (!p.obra || String(p.obra).toLowerCase().includes('lavandeira'));
const obras = dv.pages('"Obras"').where(p => p.estado).where(current);
const tarefas = dv.pages('"Tarefas"').where(p => p.estado).where(current);
const falhas = dv.pages('"Gestão/Falhas"').where(current);
const vistorias = dv.pages('"Gestão/Vistorias"').where(current);
const encomendas = dv.pages('"Material/Encomendas"').where(p => p.estado).where(current);
const ativos = tarefas.where(p => !['Concluído', 'Cancelado'].includes(String(p.estado)));
const falhasAbertas = falhas.where(p => !['Concluído', 'Resolvida'].includes(String(p.estado)));
const encomendasPendentes = encomendas.where(p => ['Pendente', 'Pedido'].includes(String(p.estado)));
const vistoriasProblema = vistorias.where(p => ['Reprovado', 'Aprovado com observações'].includes(String(p.resultado)) || !p.resultado);

dv.table(['Indicador', 'Valor', 'Ação'], [
  ['Obras/lotes/pisos com estado', obras.length, 'Rever estados por local'],
  ['Tarefas não concluídas', ativos.length, 'Acompanhar execução'],
  ['Falhas abertas', falhasAbertas.length, 'Definir correção e prazo'],
  ['Vistorias por fechar ou com problema', vistoriasProblema.length, 'Completar resultado e correções'],
  ['Encomendas pendentes/pedidas', encomendasPendentes.length, 'Confirmar entrega'],
]);
```

## 🏗️ Estado por obra, lote e piso

### Obras e lotes

```dataview
TABLE obra as "Obra", lote as "Lote", estado as "Estado", data_inicio as "Início", data_conclusao as "Conclusão", tempo_total as "Tempo"
FROM "Obras"
WHERE obra AND lote AND responsabilidade_atual != "Outra pessoa" AND contains(lower(obra), "lavandeira")
SORT obra ASC, lote ASC
```

### Pisos por estado

```dataview
TABLE obra as "Obra", lote as "Lote", piso as "Piso", estado as "Estado", tempo_total as "Tempo", data_inicio as "Início"
FROM "Obras"
WHERE obra AND lote AND responsabilidade_atual != "Outra pessoa" AND contains(lower(obra), "lavandeira") AND piso
SORT obra ASC, lote ASC, piso ASC
```

### Locais sem data de início

```dataview
TABLE obra as "Obra", lote as "Lote", piso as "Piso", estado as "Estado"
FROM "Obras"
WHERE obra AND estado != "Concluído" AND !data_inicio AND responsabilidade_atual != "Outra pessoa" AND contains(lower(obra), "lavandeira")
SORT obra ASC, lote ASC, piso ASC
```

## 🔧 Execução e trabalhos reutilizados

### Tarefas por estado

```dataview
TABLE obra as "Obra", lote as "Lote", piso as "Piso", trabalho_modelo as "Trabalho reutilizado", estado as "Estado", responsavel as "Responsável", data_limite as "Prazo"
FROM "Tarefas"
WHERE estado != "Concluído" AND responsabilidade_atual != "Outra pessoa" AND contains(lower(obra), "lavandeira")
SORT obra ASC, lote ASC, estado ASC, data_limite ASC
```

### Tarefas atrasadas

```dataviewjs
const hoje = dv.date('today');
const paginas = dv.pages('"Tarefas"').where(p => p.estado && p.responsabilidade_atual !== 'Outra pessoa' && String(p.obra ?? '').toLowerCase().includes('lavandeira') && !['Concluído', 'Cancelado'].includes(String(p.estado)) && p.data_limite);
const atrasadas = paginas.where(p => {
  const prazo = dv.date(p.data_limite);
  return prazo && prazo < hoje;
});
dv.table(['Tarefa', 'Obra', 'Lote', 'Piso', 'Prazo', 'Estado', 'Responsável'], atrasadas.sort(p => dv.date(p.data_limite)).map(p => [p.file.link, p.obra ?? 'Por preencher', p.lote ?? '', p.piso ?? '', p.data_limite, p.estado, p.responsavel ?? 'Por preencher']));
```

### Tarefas reutilizadas por modelo

```dataview
TABLE rows.length as "Nº", rows.obra as "Obras", rows.estado as "Estados"
FROM "Tarefas/Reutilizadas"
WHERE responsabilidade_atual != "Outra pessoa" AND contains(lower(obra), "lavandeira")
GROUP BY trabalho_modelo
SORT rows.length DESC
```

## ✅ Qualidade, vistorias e falhas

### Vistorias recentes e por fechar

```dataview
TABLE obra as "Obra", lote as "Lote/Piso", data as "Data", resultado as "Resultado", trabalhos_ids as "Modelos verificados"
FROM "Gestão/Vistorias"
WHERE responsabilidade_atual != "Outra pessoa" AND contains(lower(obra), "lavandeira")
SORT data DESC
```

### Vistorias sem resultado final

```dataview
TABLE obra as "Obra", lote as "Lote/Piso", data as "Data", file.link as "Abrir vistoria"
FROM "Gestão/Vistorias"
WHERE responsabilidade_atual != "Outra pessoa" AND contains(lower(obra), "lavandeira") AND (!resultado OR resultado = "")
SORT data ASC
```

### Falhas abertas por gravidade

```dataview
TABLE obra as "Obra", lote as "Lote", gravidade as "Gravidade", estado as "Estado", data as "Data", file.link as "Abrir falha"
FROM "Gestão/Falhas"
WHERE responsabilidade_atual != "Outra pessoa" AND contains(lower(obra), "lavandeira") AND estado != "Concluído"
SORT gravidade DESC, data ASC
```

## 📦 Materiais e custos

### Fechos de cobrança 20–20

```dataview
TABLE obra as "Obra", periodo_inicio as "Início", periodo_fim as "Fim", linhas_com_valor as "Linhas", valor_total as "Total", estado as "Estado", file.link as "Fecho"
FROM "Gestão/Relatórios/Cobrança 20-20"
SORT periodo_fim DESC
LIMIT 10
```

### Trabalhos concluídos com medição para cobrança

```dataview
TABLE obra as "Obra", lote as "Lote", piso as "Piso", trabalho_modelo as "Trabalho", data_fim as "Concluído", quantidade_executada as "Qtd.", unidade as "Unidade", valor_a_cobrar as "Valor"
FROM "Tarefas"
WHERE estado = "Concluído" AND data_fim
SORT data_fim DESC
LIMIT 30
```

### Encomendas pendentes

```dataview
TABLE obra as "Obra", lote as "Lote", estado as "Estado", data_pedido as "Pedido", data_entrega_prevista as "Entrega", valor_total as "Total"
FROM "Material/Encomendas"
WHERE (estado = "Pendente" OR estado = "Pedido") AND contains(lower(obra), "lavandeira")
SORT data_entrega_prevista ASC, data_pedido ASC
```

### Encomendas com valor por preencher

```dataview
TABLE obra as "Obra", lote as "Lote", estado as "Estado", file.link as "Encomenda"
FROM "Material/Encomendas"
WHERE contains(lower(obra), "lavandeira") AND (!valor_total OR valor_total = "")
SORT obra ASC, data_pedido ASC
```

## 👷 Equipa e registos do dia

### Presenças recentes

```dataview
TABLE data as "Data", obra as "Obra", estado as "Estado", file.link as "Registo"
FROM "Equipa/Presenças"
WHERE responsabilidade_atual != "Outra pessoa" AND contains(lower(obra), "lavandeira")
SORT data DESC
LIMIT 15
```

### Diários recentes

```dataview
TABLE data as "Data", obra as "Obra", lote as "Lote", piso as "Piso", estado as "Estado", file.link as "Diário"
FROM "Diário/Diários Diários"
WHERE responsabilidade_atual != "Outra pessoa" AND contains(lower(obra), "lavandeira")
SORT data DESC
LIMIT 15
```

## 🧭 Checklist de gestão

- [ ] Rever tarefas atrasadas.
- [ ] Fechar ou atualizar vistorias sem resultado.
- [ ] Atribuir responsável a todas as tarefas em andamento.
- [ ] Definir prazo para todas as falhas abertas.
- [ ] Confirmar encomendas pedidas e datas de entrega.
- [ ] Confirmar presenças e horas do último dia trabalhado.
- [ ] Registar ponto de situação dos lotes ativos.

## 🔗 Ações e relatórios relacionados

- [[Relatórios Automáticos|Centro de Relatórios Automáticos]]
- [[Gestão/Relatórios/Relatório Semanal de Obras|Relatório Semanal de Obras]]
- [[Gestão/Dashboard Chefe/Dashboard Principal|Dashboard do Chefe de Equipa]]
- [[Templates/Ação - Ponto de Situação|Criar Ponto de Situação]]
- [[Templates/Ação - Realizar Vistoria|Realizar Vistoria]]
- [[Templates/Ação - Registar Falha|Registar Falha]]
- [[Templates/Ação - Fecho de Cobrança 20-20|Criar Fecho de Cobrança 20–20]]
