---
tags: auditoria, vault, melhoria, obras
data: 2026-10-01
tipo: auditoria-operacional
---
# 🔎 Auditoria do Vault de Obras

## Resumo executivo

O Vault já tem uma boa base para gerir obras: notas por obra/lote/piso, registos de equipa, presenças, encomendas, vistorias, tarefas, templates e scripts. O principal problema não é falta de informação; é a existência de **várias formas diferentes de registar a mesma coisa**.

Isso faz com que algumas automações funcionem apenas parcialmente e que os dashboards mostrem dados incompletos. A maior melhoria possível no dia a dia é criar uma fonte única para cada tipo de registo e fazer os templates escreverem sempre nas mesmas pastas e com os mesmos campos.

## O que já está bem

- A estrutura por `Obras`, `Lotes` e `Pisos` é adequada para acompanhar a execução.
- A obra **Lavandeira** já tem acompanhamento por piso com tempo, execução, pendentes e diário.
- A biblioteca de trabalhos reutilizáveis já permite repetir trabalhos noutras obras.
- A nova vistoria já pode ser gerada com trabalhos da biblioteca e estados **Feito**, **Em falta**, **Com erro** e **N/A**.
- Existem ações úteis para iniciar o dia, registar presenças, criar encomendas, criar obras, registar falhas e fazer vistorias.
- O uso de GitHub é uma boa proteção contra perda de histórico e permite recuperar alterações.

## Principais problemas encontrados

### 1. Pastas com nomes diferentes para a mesma informação — prioridade muito alta

Existem referências a `Diário/Diários Diários`, mas a pasta real encontrada é `diário/Diários Diários` com inicial minúscula. O mesmo acontece com tarefas:

- há notas em `tarefas/`;
- há tarefas na raiz do Vault;
- algumas consultas procuram a pasta `Tarefa`, que não existe.

Também há uma ação que tenta criar falhas em `Gestão/Falhas`, mas essa pasta não existe atualmente.

**Impacto:** diários, falhas e tarefas podem ser criados ou consultados em locais diferentes, ficando invisíveis nos dashboards.

**Recomendação:** escolher uma estrutura definitiva e corrigir todas as ações e consultas para a respeitar. Sugestão:

```text
Obras/
Equipa/Pessoas/
Equipa/Presenças/
Gestão/Falhas/
Gestão/Vistorias/
Gestão/Relatórios/
Tarefas/
Diários/
Material/Encomendas/
Templates/
Scripts/
``` 

### 2. Campos de estado inconsistentes — prioridade muito alta

Há notas que usam `estado` e outras que usam `status`. Os valores também variam:

- `Em andamento`
- `Planeado`
- `Por iniciar`
- `parado`
- `Pendente`
- `andamento`
- `realizado`

**Impacto:** os filtros Dataview não conseguem agrupar tudo de forma fiável e a manutenção diária só procura exatamente `estado: Em andamento`.

**Recomendação:** usar sempre:

```yaml
estado: Por iniciar | Em andamento | Pendente | Concluído | Parado
```

Para tarefas, usar o mesmo campo `estado`, em vez de alternar entre `status`, caixas de seleção e texto livre.

### 3. Existem templates com conteúdo errado ou placeholders antigos — prioridade muito alta

Foram encontrados exemplos concretos:

- `Templates/Template - Diário de Obra.md` contém estrutura de uma nota de pessoa, com campos como `nome`, `cargo` e `estado: Ativo`.
- `Templates/Template - Encomenda de Material.md` tem campos duplicados e uma estrutura de data inválida.
- `Templates/Template - Registo de Presenças.md` está fixo para `ouro valley`, tem pessoas pré-preenchidas e caixas com formatos como `[x ]` e `[ x]`.
- `Templates/Template - Tarefa de Trabalho.md` ainda contém texto específico de `lote 6`.
- `Obras/Next Yard 2/Next Yard 2 - Bloco A.md` ainda contém `{{Bloco A}}` e `{{date}}`.
- Existem notas `Sem título`, `Diário - null` e ficheiros de revisão/teste que deveriam ser arquivados ou eliminados.

**Impacto:** risco de criar notas com dados de outra obra, dados falsos ou campos que não são reconhecidos.

### 4. Ações com risco de erro ou de registar informação errada — prioridade muito alta

- `Ação - Ponto de Situação.md` usa `${data_inicio}` no JavaScript, mas a variável criada chama-se `dataInicio`.
- `Ação - Início de Dia.md` cria todos os trabalhadores como presentes e com 8 horas por defeito.
- `Ação - Novo Mapa Semanal.md` também começa por marcar praticamente toda a equipa como presente.
- A manutenção diária cria presenças com esse mesmo princípio de presença pré-marcada.
- `Ação - Nova Tarefa.md` cria a nota na raiz, enquanto as consultas de pessoas procuram outra localização.
- `Ação - Nova Obra.md` cria apenas a nota geral; não cria lotes, pisos nem ligações.

**Recomendação:** presenças devem começar vazias ou como `Por confirmar`, nunca como presentes. O utilizador deve confirmar presença e horas.

### 5. O Dashboard ainda contém muita informação manual e antiga — prioridade alta

O Dashboard tem valores fixos, por exemplo:

- percentagens de progresso escritas manualmente;
- lista fixa de pessoas;
- reuniões e tarefas com datas antigas;
- `Tarefas Totais: 24` e `Taxa Conclusão: 45%` escritos manualmente;
- obra Ouro Valley apresentada como foco principal, mesmo existindo Lavandeira e Next Yard.

**Recomendação:** transformar o Dashboard numa página automática, baseada nos campos das notas:

- lotes ativos por estado;
- tarefas pendentes e atrasadas;
- vistorias reprovadas ou com erros;
- falhas pendentes;
- materiais por receber;
- presença do dia;
- progresso por lote/piso.

### 6. Consultas automáticas precisam de uma fonte de dados mais consistente — prioridade alta

As consultas atuais assumem campos que nem sempre existem ou estão preenchidos, como `funcionario`, `horas_extras`, `sabado`, `valor_total` e `progresso`. Por isso, o centro de relatórios pode aparecer vazio ou incompleto mesmo quando há notas.

**Recomendação:** definir um pequeno esquema de campos obrigatório por tipo de nota e fazer os templates preenchê-los sempre:

| Tipo | Campos mínimos |
|---|---|
| Obra/lote/piso | `obra`, `lote`, `piso`, `estado`, `data_inicio` |
| Tarefa | `obra`, `lote`, `piso`, `estado`, `responsavel`, `data_inicio`, `data_fim` |
| Diário | `data`, `obra`, `lote`, `piso`, `responsavel` |
| Presença | `data`, `obra`, `funcionario`, `presente`, `horas_normais`, `horas_extras` |
| Vistoria | `data`, `obra`, `lote`, `piso`, `resultado` |
| Encomenda | `data_pedido`, `obra`, `lote`, `status`, `valor_total` |

### 7. Ligações internas precisam de uma limpeza controlada — prioridade média

A auditoria encontrou muitos candidatos a links quebrados. Alguns são exemplos dentro de documentação ou código, mas há problemas reais, como:

- `[[Tiago rocha]]`, sem nota correspondente encontrada;
- `[[Abel]]`, enquanto a nota existente é `abel mande.md`;
- `[[antonio]]`, sem pessoa correspondente;
- várias ligações com `.md` e outras sem `.md`;
- links dentro de templates que são placeholders e não devem ser tratados como links finais.

**Recomendação:** adotar uma regra única: links sem `.md`, preferencialmente com o caminho relativo apenas quando houver nomes ambíguos. Depois, criar uma revisão mensal de links.

### 8. Confirmar datas planeadas — prioridade média

A nota geral da **Lavandeira** tem início em `2026-10-28`, que é posterior à data desta auditoria (`2026-10-01`). Pode ser uma data planeada correta; convém apenas confirmar e distinguir no campo se é `data_inicio_planeada` ou `data_inicio_real`.

## Melhorias práticas para o dia a dia

### Fluxo diário recomendado

1. **Início de Dia**
   - escolher a obra, lote e piso;
   - confirmar quem está presente;
   - selecionar trabalhos da biblioteca ou tarefas pendentes;
   - atribuir cada trabalho a uma pessoa.

2. **Durante o trabalho**
   - atualizar a tarefa para `Em andamento`;
   - registar fotos, materiais em falta e problemas na mesma nota;
   - evitar criar tarefas soltas no Dashboard ou em notas sem obra/lote.

3. **Fim do Dia**
   - marcar o que foi concluído;
   - registar horas por tarefa ou piso;
   - lançar pendentes para o dia seguinte;
   - registar materiais que precisam de encomenda.

4. **Vistoria**
   - gerar a vistoria para o piso;
   - marcar cada trabalho como `Feito`, `Em falta`, `Com erro` ou `N/A`;
   - criar uma linha de correção para cada erro;
   - só marcar `Aprovado` quando não existirem erros ou faltas.

5. **Fecho semanal**
   - rever tarefas atrasadas;
   - rever falhas e vistorias não aprovadas;
   - confirmar materiais pendentes;
   - fazer ponto de situação por lote.

### Melhorias que poupam mais tempo

#### A. Criar uma ação “Nova Nota de Piso”

A ação deveria perguntar obra, lote e piso e criar automaticamente:

- nota do piso;
- estado inicial;
- secção de trabalhos;
- checklist da biblioteca;
- ligações ao lote e à obra;
- espaço para vistoria.

Isto evita copiar notas de piso manualmente e reduz erros de nomes.

#### B. Ligar cada trabalho a obra, lote e piso

A biblioteca atual gera texto, mas as tarefas poderiam ter também propriedades:

```yaml
obra: Lavandeira
lote: 1A
piso: "-1"
trabalho_modelo: "Executar águas interiores"
estado: Por iniciar
responsavel:
```

Assim seria possível saber automaticamente o que falta num piso e quais os trabalhos com erro numa vistoria.

#### C. Transformar erros de vistoria em tarefas de correção

Ao encontrar `Com erro`, criar uma tarefa com:

```yaml
origem: vistoria
vistoria: [[Vistoria - ...]]
trabalho_modelo: ...
estado: Pendente
```

Depois da correção, a tarefa pode ser fechada e a vistoria atualizada.

#### D. Criar um registo de materiais ligado aos trabalhos

Por exemplo, quando se escolhe `Soldar tubos e uniões de PPR`, poder sugerir materiais como tubo, uniões, joelhos e isolamento. Não é preciso fazer uma lista perfeita no início; basta começar pelos materiais que mais se repetem.

#### E. Usar códigos curtos para obras, lotes e pisos

Exemplo:

```yaml
obra_id: LAV
lote_id: 1A
piso_id: -1
```

Os nomes continuam visíveis nas notas, mas os códigos tornam filtros e relatórios mais seguros.

## Plano de melhoria por prioridade

### Fase 1 — corrigir riscos imediatos

1. Corrigir `Template - Diário de Obra`.
2. Corrigir `Ação - Ponto de Situação`.
3. Alterar presenças para começarem por `Por confirmar`, nunca presentes automaticamente.
4. Criar `Gestão/Falhas` ou corrigir a ação para uma pasta existente.
5. Escolher `Diários` ou `diário` e atualizar todas as referências.
6. Escolher `Tarefas` ou `tarefas` e mover as tarefas para esse local.
7. Remover placeholders e notas claramente erradas (`null`, `Sem título`, testes).

### Fase 2 — normalizar e automatizar

1. Uniformizar `estado` e os seus valores.
2. Uniformizar campos obrigatórios por tipo de nota.
3. Corrigir as consultas Dataview.
4. Criar uma ação única de criação de obra, lote e piso.
5. Fazer o Dashboard depender dos dados reais, sem números manuais.
6. Ligar falhas, vistorias e tarefas de correção.

### Fase 3 — gestão avançada

1. Biblioteca de trabalhos com propriedades e materiais associados.
2. Relatório automático de produtividade por piso e pessoa.
3. Histórico de vistorias e reincidência de erros.
4. Relatório de materiais por obra/lote.
5. Rotina de fecho semanal e arquivo de obras concluídas.

## Decisão recomendada

A melhor próxima intervenção é **não acrescentar mais funcionalidades antes de normalizar as bases**. Recomendo começar por uma limpeza técnica curta e segura:

1. pastas;
2. estados;
3. templates;
4. presenças;
5. tarefas;
6. dashboards.

Depois disso, as automações de trabalhos repetíveis e vistorias terão muito mais valor e serão mais fiáveis.

> Esta auditoria é uma proposta de melhoria. Não foram alterados os registos históricos das obras nem corrigidos automaticamente os dados antigos.
