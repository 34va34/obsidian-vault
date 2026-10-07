# Plano de Correções — Registo de Presenças

> Estado: **plano — nada foi alterado no vault.**
> Data da revisão: 2026-10-07
> Fonte: análise de [[Equipa hoje]], 4 registos em `Equipa/Presenças/`, modelos em `Templates/`, [[Guia Rápido - Chefe de Equipa]].

---

## Fase 1 — Reparar ligações e estrutura (rápido, sem risco)

| # | Ação | Detalhe |
|---|------|---------|
| 1.1 | Resolver `[[Tiago rocha]]` | Não existe nota. **Decisão do utilizador**: (a) criar `Equipa/Pessoas/Tiago rocha.md` se for pessoa real, ou (b) remover as 4 referências ([[Equipa hoje]], [[Presenças - ouro valley - 2026-07-16]], [[Dashboard]], `Ouro Valley - Lote 6`). |
| 1.2 | Mover [[Equipa/José Magalhães]] para `Equipa/Pessoas/` | Mover com atualização automática de ligações (Obsidian CLI / move link-aware). Corrige a exclusão dele da lista gerada de 2026-10-01 e das consultas `FROM "Equipa/Pessoas"`. |
| 1.3 | Corrigir frontmatter do José | `tags: - pessoa, equipa` está como item único; passar a lista correta (`pessoa`, `equipa`, `#nextyard`). |
| 1.4 | Remover espaços finais nos nomes | `andre Magalhães ` e `Henriques ` → renomear ficheiro, frontmatter `nome:` e ligações. |
| 1.5 | Uniformizar capitalização de pastas | `diário/` → `Diário/` e `tarefas/` → `Tarefas/` (ou ao contrário — decidir um canónico). Crucial se sincronizar fora do Windows. |
| 1.6 | Normalizar estilo de ligações | Passar tudo a `[[Nome]]` sem `.md` (ou tudo com — decidir; recomendo sem). |

## Fase 2 — Corrigir [[Equipa hoje]]

| # | Ação | Detalhe |
|---|------|---------|
| 2.1 | Resolver placeholders | Título `{{date}}` → data real; frontmatter `"{ date }"`, `"{ name }"`, `"{ role }"` → campos `data:`, `nome:`, `cargo:` reais (ou transformar noutra coisa — ver decisão em aberto). |
| 2.2 | Pôr a consulta Dataview em bloco | Envolver em ` ```dataview `; hoje é texto corrido e não executa. |
| 2.3 | Corrigir âmbito da consulta | `FROM "Equipa/Pessoas" WHERE estado = "Ativo"` passa a incluir o José depois do 1.2. |
| 2.4 | Trocar `[Ativo]` por `[x]`/`[ ]` | Uniformizar com a convenção do guia/TIP. |
| 2.5 | Completar a tabela | 7 linhas → 13 ativos (faltam andre Magalhães, Henriques, el houcine, domingos felix, Paulo Nadais, João tiago nvudi, Mario sousa, José Magalhães). |
| 2.6 | Preencher `## 🏗️ Obra:` e resolver horas ambíguas | António Manuel: 9 normais + 1 extra = 10h? Clarificar convenção (recomendo: `Horas Normais` = total, extras destacadas nas observações, ou explicitar). |

## Fase 3 — Tornar os registos consultáveis

| # | Ação | Detalhe |
|---|------|---------|
| 3.1 | Corrigir histórico por pessoa | Na ficha de cada pessoa, trocar `contains(funcionario, this.file.link)` → `contains(file.outlinks, this.file.link)` — as wikilinks da tabela já são *outlinks*; funciona sem reestruturar dados. |
| 3.2 | Preencher `Resumo do Dia` | Nos 4 registos (quando os dados existirem): total de funcionários, total horas extras, trabalho especial. |
| 3.3 | Adicionar `estado:` em falta | Padronizar: `Por confirmar` → `Confirmado` (e talvez `Incompleto`). Falta em 2026-06-22, 07-16, 07-29. |
| 3.4 | Acrescentar `lote:` | Campo existe no modelo mas nunca chega aos registos (ex.: lavandeira lote 1a). |
| 3.5 | (Opcional) Soma automática de horas | Dataview não lê células de tabelas markdown. Se for essencial, migrar horas para campos *inline* nas células (`8::horas`) ou para frontmatter por pessoa — implica mudar o modelo. Decidir se compensa. |

## Fase 4 — Higienizar os 4 registos existentes

| # | Registo | Ação | Precisa de dados do utilizador? |
|---|---------|------|------|
| 4.1 | [[Presenças - ouro valley - 2026-06-22]] | Só tem 1 linha. Completar equipa **ou** marcar `estado: Incompleto`. | ✅ Sim — não inventar presenças |
| 4.2 | [[Presenças - ouro valley - 2026-07-16]] | O mais completo: adicionar `estado: Confirmado`, preencher resumo, corrigir ligação Tiago rocha. | ⚠️ Só o Tiago |
| 4.3 | [[Presenças - ouro valley - 2026-07-29]] | Resolver contradição: abel mande, dicor mendes, Moisés kalandula, Yuri = `[]` mas 8h. Normalizar `[]` → `[ ]`. | ✅ Sim — quem esteve presente? |
| 4.4 | [[Presenças - lavandeira - 2026-10-01]] | Normalizar `[x ]`/`[ x]` → `[x]`; limpar "Por confirmar" de quem já está marcado; preencher horas; atualizar `estado` do frontmatter. | ✅ Sim — horas do dia |
| 4.5 | Dias sem registo | 2026-06-11, 2026-09-29, 2026-10-02 têm diário mas zero presenças. Criar registos se houver dados. | ✅ Sim |

## Fase 5 — Modelos e guia (prevenir repetição)

| # | Ação | Detalhe |
|---|------|---------|
| 5.1 | Filtrar inativos na `Ação - Registar Presenças` | Hoje lista todos os ficheiros; adicionar `.filter(f => f.basename !== undefined && frontmatter estado === "Ativo")` (ler `cachedMetadata` ou frontmatter). Evita abel/António rocha/dicor em registos futuros. |
| 5.2 | Criar `Ação - Início de Dia` **ou** corrigir o guia | O [[Guia Rápido - Chefe de Equipa]] aponta para uma ação que não existe. |
| 5.3 | Corrigir `diário/diário -diario/diario.md` | Sem bloco ` ```dataviewjs ``` ` (não executa) e chama "Presenças" ao que são atribuições de tarefas — renomear ou apagar. |
| 5.4 | Decidir destino do `Template - Mapa Semanal` | Nunca usado — usar, manter como alternativa, ou remover. |
| 5.5 | Corrigir dados das pessoas | 6 pessoas sem `cargo`; typo `canalizado` → `canalizador` (venacio); uniformizar `estado: inativo` vs `Ativo`. |
| 5.6 | Checklist do Fecho do Dia | Acrescentar ao guia: "preencher Resumo do Dia" (hoje só diz preencher horas). |

---

## Decisões necessárias antes de avançar

1. **Tiago rocha** — é pessoa real (criar ficha) ou apagar referências?
2. **2026-07-29** — abel mande, dicor mendes, Moisés kalandula, Yuri: estiveram presentes ou não?
3. **2026-06-22 e dias sem registo** — há dados para preencher, ou marcar como incompletos?
4. **2026-10-01 (lavandeira)** — quais as horas reais do dia?
5. **Horas**: convenção para "Horas Normais" vs "Horas Extras" (9+1 = 10h?).
6. **Inativos**: sair das listas geradas por omissão? (recomendo sim)
7. **Ordem de execução**: fazer primeiro as Fases 1–2 (estrutura, 15 min) e depois tratar os dados com as tuas respostas?

## Prioridade sugerida

- **Alta**: Fase 1 inteira + 2.1/2.2/2.4 (repara ligações e a nota do dia) + 3.1 (histórico do José).
- **Média**: Fase 4 (só depois de ter os dados) + 5.1/5.2.
- **Baixa**: 3.5, 5.4, 5.5, limpezas cosméticas.
