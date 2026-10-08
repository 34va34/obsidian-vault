---
tags: guia, chefe-de-equipa, obras, inicio-rapido
tipo: manual-operacional
versao: 1.0
data: 2026-10-01
---
# 🧭 Guia Rápido — Chefe de Equipa

## Objetivo

Usar este guia para registar o trabalho real sem complicar. Para amanhã, basta seguir esta sequência:

> **1. Início de Dia → 2. Trabalhos → 3. Execução → 4. Vistoria → 5. Fecho do Dia → 6. Fecho 20–20**

## Antes de começar

Abra o [[Dashboard]] e confirme:

- a obra, lote e piso onde a equipa vai trabalhar;
- as tarefas pendentes ou atrasadas;
- os materiais que ainda estão por receber;
- as falhas e vistorias que possam bloquear o trabalho.

Atalho principal: [[Gestão/Relatórios/Acompanhamento Avançado de Obras]].

---

## 1. Início de Dia — 5 minutos

No Dashboard, abra:

[[Ação - Início de Dia|🌅 Início de Dia]]

> Para **executar** a ação, use `Ctrl/Cmd + P` → **Templater: Create new note from template** → escolha `Ação - Início de Dia`. Clicar diretamente no link abre o código do modelo; isso é normal no Obsidian e não executa o script.

Preencha:

1. **Nome da obra**;
2. **Tarefas para hoje**, separadas por vírgulas — escreva o responsável com `@Nome`;
3. **Só pessoas Ativas** — `s` (por omissão) lista apenas quem tem `estado: Ativo`; `n` lista toda a gente.

Exemplo:

```text
Executar águas interiores piso -1 @José, Ligar esgotos às caixas @Afonso, Testar instalações do piso
```

A ação cria:

- o registo de presenças;
- o diário da obra;
- as tarefas planeadas para o dia.

Corre sempre que as pastas de destino já existam (mesmo com maiúsculas diferentes) e não duplica ficheiros criados no mesmo dia.

### Atenção às presenças

As pessoas começam como **Por confirmar**. Marque `[x]` apenas para quem está realmente presente e preencha as horas no final ou durante o dia.

---

## 2. Reutilizar trabalhos de obras anteriores

Quando for necessário repetir trabalhos já realizados noutra obra:

[[Templates/Ação - Repetir Trabalhos|🔁 Aplicar Trabalhos a Lote/Piso]]

Passos:

1. escolha a nota do lote ou piso;
2. confirme o responsável comum, se existir;
3. escolha a categoria;
4. selecione cada trabalho necessário;
5. escreva um detalhe quando ajudar, por exemplo `9 casas` ou `frações A e B`;
6. escolha **Não — criar as tarefas**.

O sistema cria uma tarefa individual em `Tarefas/Reutilizadas/` e liga-a automaticamente à nota do lote ou piso.

### Regra importante

Não marque o trabalho como concluído só porque já foi feito numa obra antiga. A nova tarefa começa sempre em **Por iniciar**.

---

## 3. Durante a execução

Abra a tarefa correspondente e atualize:

- `estado: Por iniciar` → `Em andamento`;
- responsável;
- data de início;
- horas ou tempo gasto;
- notas, fotografias e problemas encontrados.

Quando terminar, confirme os critérios de conclusão e altere para:

```yaml
estado: Concluído
```

Se houver um problema, não esconda a tarefa. Registe o problema e use:

[[Templates/Ação - Registar Falha|⚠️ Registar Falha]]

Uma falha deve ter, sempre que possível:

- gravidade;
- responsável pela correção;
- correção necessária;
- prazo;
- validação final.

---

## 4. Fazer uma vistoria

Quando o trabalho de um piso estiver pronto para verificar:

[[Templates/Ação - Realizar Vistoria|✅ Realizar Vistoria]]

Escolha:

1. a obra;
2. o lote/piso;
3. todos os trabalhos ou apenas algumas categorias.

Para cada trabalho, marque apenas uma opção:

| Estado | Quando usar |
|---|---|
| **Feito** | Foi executado corretamente. |
| **Em falta** | Ainda não foi executado. |
| **Com erro** | Foi executado, mas precisa de correção. |
| **N/A** | Não se aplica ao local. |

Se marcar **Com erro**, registe a correção na tabela de não conformidades. No fim, preencha o resultado final:

- `Aprovado`;
- `Aprovado com observações`;
- `Reprovado — necessita correção`.

---

## 5. Fecho do Dia — 5 minutos

Antes de sair da obra:

- [ ] confirme as presenças;
- [ ] preencha horas normais e extras;
- [ ] marque as tarefas concluídas;
- [ ] deixe em `Em andamento` o que continua amanhã;
- [ ] registe materiais em falta;
- [ ] registe falhas encontradas;
- [ ] acrescente uma nota no diário da obra;
- [ ] deixe as prioridades do dia seguinte escritas.

Acompanhe o estado geral em:

[[Gestão/Relatórios/Acompanhamento Avançado de Obras|📈 Acompanhamento Avançado de Obras]]

---

## 6. Relatório semanal — fim da semana

Para a reunião ou revisão semanal, abra:

[[Templates/Ação - Criar Relatório Semanal|📅 Criar Relatório Semanal]]

O relatório ajuda a responder:

- o que foi concluído;
- o que ficou atrasado;
- que falhas continuam abertas;
- que vistorias precisam de fechar;
- que materiais estão a bloquear a obra;
- quais são as três prioridades da próxima semana.

Preencha manualmente as secções:

- **O que avançou**;
- **O que bloqueou**;
- **Decisões tomadas**;
- **Prioridades da próxima semana**;
- **Materiais a confirmar**;
- **Pessoas / equipas a coordenar**.

---

## 7. Fecho de cobrança 20–20

Do dia **20 de um mês ao dia 20 do mês seguinte**, prepare a informação para o patrão cobrar o que foi executado:

[[Templates/Ação - Fecho de Cobrança 20-20|💰 Criar Fecho de Cobrança 20–20]]

Passos:

1. escolha a obra ou **Todas as obras**;
2. indique quem fez o levantamento;
3. reveja os trabalhos concluídos encontrados no período;
4. preencha quantidade, unidade e valor a cobrar nas tarefas;
5. confirme datas, lotes, pisos e evidências;
6. copie a mensagem WhatsApp ou o modelo de e-mail;
7. só envie depois de o valor ser validado.

O sistema usa a `data_fim` da tarefa. Uma tarefa concluída sem data não entra automaticamente no total: fica listada como **registo a rever** para evitar cobranças incorretas.

Campos importantes numa tarefa:

- `data_fim` — quando o trabalho ficou concluído;
- `quantidade_executada` — quanto foi feito;
- `unidade` — m, un, fração, piso, serviço, etc.;
- `valor_a_cobrar` — valor a considerar;
- `incluido_cobranca` — confirmar se entra no fecho.

O fecho é criado em `Gestão/Relatórios/Cobrança 20-20/` e começa sempre como **Por validar**. O Vault prepara a mensagem, mas não envia WhatsApp nem e-mail automaticamente.

---

## Estados que deve usar

| Estado | Significado |
|---|---|
| `Por iniciar` | Ainda não começou. |
| `Em andamento` | Está a ser executado. |
| `Pendente` | Está bloqueado ou aguarda uma ação. |
| `Concluído` | Está terminado e confirmado. |
| `Parado` | A obra/lote está temporariamente parado. |

## Se tiver pouco tempo

Use apenas estes três atalhos:

1. [[Ação - Início de Dia|Início de Dia]];
2. [[Templates/Ação - Repetir Trabalhos|Aplicar Trabalhos a Lote/Piso]];
3. [[Templates/Ação - Realizar Vistoria|Realizar Vistoria]].

O mais importante é que cada trabalho fique associado à **obra, lote, piso, estado e responsável**.

## Problemas comuns

### Não encontro a tarefa

Abra o [[Gestão/Relatórios/Acompanhamento Avançado de Obras]] e procure na secção **Tarefas por estado** ou na pasta `Tarefas/Reutilizadas/`.

### Criei uma tarefa no local errado

Não crie outra imediatamente. Verifique a obra, lote e piso na tarefa e corrija os campos existentes.

### Não sei se o trabalho está concluído

Deixe em `Em andamento` e escreva a dúvida nas notas. Só use `Concluído` depois de confirmar os critérios e, quando aplicável, fazer a vistoria.

### Falta material

Registe-o no diário, abra uma encomenda em [[Templates/Ação - Nova Encomenda|Nova Encomenda]] e deixe a tarefa como `Pendente` se o material impedir o avanço.

---

## Atalhos principais

- [[Dashboard|🏠 Dashboard]]
- [[Gestão/Relatórios/Acompanhamento Avançado de Obras|📈 Acompanhamento Avançado]]
- [[Ação - Início de Dia|🌅 Início de Dia]]
- [[Templates/Ação - Repetir Trabalhos|🔁 Aplicar Trabalhos]]
- [[Templates/Ação - Realizar Vistoria|✅ Vistoria]]
- [[Templates/Ação - Registar Falha|⚠️ Registar Falha]]
- [[Templates/Ação - Criar Relatório Semanal|📅 Relatório Semanal]]
