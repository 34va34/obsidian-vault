---
epoch: 1791534993993
mode: agent
backendId: opencode
sessionId: "ses_ee03512d8ffeb63r7LjxhEGiKn"
agentLabel: "Estrutura de lotes e blocos da Lavandeira"
usage: '{"usedTokens":161325,"contextWindow":200000,"updatedAt":1791551562312}'
tags:
  - copilot-conversation
---

**user**: nao alteres nada para ja.
quero esclarecer uma informacao, a obra lavandeira são dois lotes, um é o lote 1A e o outro é o lote 3A.
cada lote esta dividido em dois blocos, bloco A e bloco B.
[Timestamp: 2026/10/09 09:36:33]

**ai**: Entendido — não vou alterar nada por agora. Registei a correção e confrontei-a com o que está escrito atualmente no vault:

**A informação correta (a que acabou de dar):**
- A obra **Lavandeira** tem dois lotes: **Lote 1A** e **Lote 3A**
- Cada lote está dividido em dois blocos: **Bloco A** e **Bloco B**

**O que está registado atualmente (e não coincide):**

| Onde | Diz atualmente |
|---|---|
| [[Lavandeira - Geral]] (frontmatter `lotes: 1A, 1B`) | Lotes **1A e 1B** |
| [[Lavandeira - Geral]] (citação e tabela) | Lotes 1A e 1B |
| [[Lavandeira - Lote 1B]] (ficheiro, tag `lote-1b`, `lote: 1B`) | Segundo lote chamado **1B**, com 78 casas |
| [[Lavandeira - Lote 1B]] (tabela) | Usa "**Parte A / Parte B**" em vez de "Bloco A / Bloco B" |
| Pastas `Obras/Lavandeira/Lotes/Lote 1B/` + 7 notas de pisos | Estrutura de pastas chamada "Lote 1B" |

**Pontos que ficam por esclarecer antes de eu mexer em algo (quando der ordem):**

1. O conteúdo que hoje está em **[[Lavandeira - Lote 1B]]** (as 78 casas, distribuição por pisos, notas de piso) corresponde na verdade ao **Lote 3A**? Ou seja, é só um erro de nome, ou os dados também mudam?
2. O **Lote 3A** também está dividido em **Bloco A e Bloco B** ( hoje usa "Parte A/Parte B")? E a distribuição por blocos dele é a mesma que está registada?
3. Quando for para corrigir, quer que eu renomeie também as **pastas e ficheiros** (`Lote 1B` → `Lote 3A`, incluindo as notas de pisos e os links/wikilinks), ou apenas o texto e o frontmatter?

Assim que confirmar, digo-lhe exatamente que alterações seriam necessárias — ou executo-as.
[Timestamp: 2026/10/09 09:36:34]

**user**: 1para ja so erro de nome. e sao no total 77 casas. sao 20 t3, 56 t2, e 1 t1.
2 sim tmb esta dividido.
3 sim podes corrigir
no lote 1a o piso -1 tem 6 casas, 5 t2, 1 t3, e 1 t1.
no piso 1 tem 8 t2, 4 t3, que por sua vez esta distribuído 7 casas no bloco A e 5 casas no bloco B
[Timestamp: 2026/10/09 09:46:54]

**ai**: Percebi. Antes de mexer, vou primeiro mapear **todas** as ocorrências de "Lote 1B"/"1B" e "Parte A/B" no vault para não deixar nada para trás.Mapeei as ocorrências principais. Antes de executar, duas verificações rápidas (tarefas reutilizadas e outros links):Mapeamento completo. Vou agora executar a correção de nome (conteúdo + ficheiros/pastas):Conteúdo atualizado. Agora os nomes de pasta e ficheiros:Verificação de resíduos:A substituição automática deixou alguns erros de gramática ("na Bloco", "as Blocos"). Vou detetar e corrigir:Renomeação concluída e verificada (0 resíduos de "1B"/"Parte"). Vou agora registar no [[Lavandeira - Geral]] e no [[Lavandeira - Lote 3A]] que o Lote 3A também está dividido em Blocos A e B (confirmado por si):Está feito. Resumo do que foi corrigido (apenas nome, como indicado):

**Feito:**
- **Renomeados** `Lavandeira - Lote 1B.md` → [[Lavandeira - Lote 3A]], a pasta `Lote 1B/` → `Lote 3A/` e as 7 notas de piso (`Lote 3A - Piso -1` … `Piso 6`)
- **Todo o conteúdo** atualizado: links wikilink, frontmatter (`lotes: 1A, 3A`, `lote: 3A`, tags `lote-3a`), títulos — verificado que nenhum ficou resíduo de "1B"
- **"Parte A/B" → "Bloco A/B"** no [[Lavandeira - Lote 3A]] e nas 7 notas de piso (inclui chaves `casas_bloco_a/b`, tabelas e frases), com gramática corrigida
- **Registado que o Lote 3A também está dividido em Bloco A e Bloco B** (citação, tabela e configuração no [[Lavandeira - Geral]] e configuração no [[Lavandeira - Lote 3A]])
- Sem impacto nas consultas Dataview (não existem tarefas com `lote: 1B`)

**Não alterei números** — os dados que me deu contêm duas contradições que prefiso confirmar antes de escrever:

**1. Os 77 casas (20 T3 + 56 T2 + 1 T1) são de que lote?**
- Essa composição soma exatamente 77, e o **Lote 1A já tem 77 registados** — logo podia ser confirmação do 1A.
- Mas se se referirem ao **Lote 3A**, então o total correto é 77 e não 78 → teria de mudar `total_casas: 78` → 77, a tabela por pisos (que soma 78: 7+13+13+13+13+13+6 — indicar em que piso falta uma casa) e o total da obra 155 → 154.

**2. Piso -1 do Lote 1A: 6 ou 7 casas?**
- Diz "6 casas", mas a composição que segue soma 7: 5 T2 + 1 T3 + 1 T1 = **7**.
- O registado atual é 7, e com 7 o lote fecha em 77 e o T1 bate certo (1 no total). Com 6, o lote daria 76.
- **Suspeito que seja 7 casas e o "6" foi deslize** — confirma?

**3. Piso 1 do Lote 1A** (8 T2 + 4 T3 = 12, com 7 no Bloco A e 5 no Bloco B) — está **exatamente conforme** o registado ✓.

Assim que confirme o ponto 1 e o 2, aplico os números e posso acrescentar a composição por tipologia (T1/T2/T3) às notas dos lotes/pisos, se quiser.
[Timestamp: 2026/10/09 09:46:54]

**user**: 1 lote 1A
o lote 3A tem 77 casas tmb.
2 tem 7 casas.
posso dizer quais sao as tipologias por piso e por bloco
confirmo


3 certo

as tipologias se me irao fazer diferença quando for fazer fiscalização nas casas.

do piso 2 a 5 sao 7 casas no bloco a e 6 no bloco B
e o piso 6 tem 6 casas
[Timestamp: 2026/10/09 10:20:29]

**ai**: Perfeito, tudo esclarecido. Deixem-me ver as notas do Lote 1A para aplicar os dados confirmados:Agora aplico os números confirmados. Primeiro o **Lote 3A → 77 casas** e o **total da obra → 154**:Agora as **tipologias do Lote 1A** (20 T3 + 56 T2 + 1 T1 = 77):Está tudo aplicado. Resumo:

**✅ Alterações feitas:**

| O quê | Onde |
|---|---|
| Lote 3A: **78 → 77 casas** (frontmatter, tabela, notas) | [[Lavandeira - Lote 3A]] |
| Total da obra: **155 → 154 casas** (77 + 77) | [[Lavandeira - Geral]] |
| Tabela de tipologias do 1A: **1 T1 + 56 T2 + 20 T3 = 77** + distribuição por piso confirmada | [[Lavandeira - Lote 1A]] |
| "Tipologias: 5 T2 + 1 T3 + 1 T1" | [[Lote 1A - Piso -1]] |
| "Tipologias: 8 T2 + 4 T3" | [[Lote 1A - Piso 1]] |
| Pisos 2-5 (7A/6B) e piso 6 (6 casas) | já estavam conformes ✓ |

**⚠️ Fica um ponto por confirmar:** no Lote 3A, a somatória por pisos dá **78** mas o total é **77** — falta 1 casa. Deixei uma nota de aviso na tabela. Pode ser uma de duas:
- o **piso 1 do 3A** é igual ao do 1A (7 Bloco A + **5** Bloco B = 12, e não 13), ou
- o **piso -1 do 3A** tem **6** casas (e não 7)

Qual das duas?

---

**Sobre a sua pergunta — as tipologias fazem diferença na fiscalização?**

Sim, e bastante:

1. **Checklist por tipologia** — um T3 tem mais pontos de água, tomadas e prumadas que um T1/T2; o que se verifica numa casa não é igual noutra. Sabendo a tipologia de cada casa, sabe à partida o que deve lá estar.
2. **Conferência de trabalhos** — com o mapa (20 T3, 56 T2, 1 T1) valida se o executado/entregue bate certo com o contrato, casa a casa.
3. **Testes** — carga e esgotos dimensionam-se pelo número de pontos; um T3 exige mais que um T1.
4. **Planeamento e tempos** — as tarefas reutilizadas podem ser estimadas por tipologia (um T3 demora mais a ligar que um T1).

**A estrutura mais útil para fiscalização** seria, por piso, uma tabela assim: `casa | bloco | tipologia`. Se me indicar as tipologias **por piso e por bloco** (do jeito que lhe for mais fácil, ex.: *"piso 2 — Bloco A: 4 T3, 3 T2; Bloco B: 3 T3, 3 T2"*), eu:
- completo a secção de tipologias do [[Lavandeira - Lote 1A]] (pisos 2-6) e do [[Lavandeira - Lote 3A]],
- e, se quiser, crio a tabela `casa | bloco | tipologia` em cada nota de piso.

Pode enviar quando quiser — até lá, fica registado o que já está confirmado.
[Timestamp: 2026/10/09 10:20:29]

**user**: o piso -1 do 3A tem 6 casas
[Timestamp: 2026/10/09 10:32:41]

**ai**: Feito. Verificação da conta no [[Lavandeira - Lote 3A]]:

**6 (piso -1) + 13+13+13+13+13 (pisos 1 a 5) + 6 (piso 6) = 77 ✓**

**Alterações:**

| O quê | Onde |
|---|---|
| Piso -1: **7 → 6 casas** (frontmatter, tabela e total do piso) | [[Lote 3A - Piso -1]] |
| Tabela do lote: piso -1 = 6 (total fecha em 77), nota de aviso substituída por nota de confirmação | [[Lavandeira - Lote 3A]] |
| Nota: "exceção do piso -1: tem 6 casas (no Lote 1A são 7)" | [[Lavandeira - Lote 3A]] |

**Uma hipótese que assumi — corrija-me se estiver errado:** pus as 6 casas do piso -1 do 3A **todas no Bloco A** (Bloco B = 0), por analogia com o Lote 1A. Se estiverem divididas de outra forma, diga-me as de cada bloco que eu corrijo.

**Estado atual dos dois lotes:**

| | Lote 1A | Lote 3A |
|---|---|---|
| Piso -1 | 7 (5A… 7A/0B) | 6 (6A/0B) |
| Piso 1 | 12 — 7A/5B ✓ | 13 — 7A/6B |
| Pisos 2-5 | 13 — 7A/6B ✓ | 13 — 7A/6B |
| Piso 6 | 6 (blocos por confirmar) | 6 (blocos por confirmar) |
| **Total** | **77** ✓ | **77** ✓ |
| Tipologias | 1 T1 + 56 T2 + 20 T3 ✓ | por registar |

**Por registar, quando quiser enviar:**
1. Tipologias do **Lote 1A** — pisos 2 a 6 (por bloco)
2. Tipologias do **Lote 3A** — todos os pisos (por bloco)
3. Divisão do **piso 6** entre os Blocos A e B (nos dois lotes)
[Timestamp: 2026/10/09 10:32:41]

**user**: no piso 6 sao 6 casas no bloco B nos dois lotes
[Timestamp: 2026/10/09 10:38:21]

**ai**: Piso 6: 6 casas, todas no Bloco B — nos dois lotes. Vou ler as duas notas de piso 6 e a nota do Lote 1A para atualizar tudo:✅ **Piso 6 resolvido nos dois lotes — 6 casas, todas no Bloco B.** Não resta nenhuma "por confirmar" no vault.

**Alterações:**

| O quê | Onde |
|---|---|
| Tabela: Bloco A = 0, Bloco B = 6, nota "todas no Bloco B" | [[Lote 1A - Piso 6]] e [[Lote 3A - Piso 6]] (frontmatter incluído) |
| Totais por bloco finalizados: **42 A / 35 B = 77** | [[Lavandeira - Lote 1A]] |
| Totais por bloco finalizados: **41 A / 36 B = 77** | [[Lavandeira - Lote 3A]] |
| Distribuição dos dois lotes completa + nota das diferenças | [[Lavandeira - Geral]] |

**Contas fechadas:**

| | Bloco A | Bloco B | Total |
|---|---:|---:|---:|
| **Lote 1A** | 7+7+7+7+7+7+0 = **42** | 0+5+6+6+6+6+6 = **35** | **77** ✓ |
| **Lote 3A** | 6+7+7+7+7+7+0 = **41** | 0+6+6+6+6+6+6 = **36** | **77** ✓ |

A única diferença entre os lotes: **piso -1** (7 no 1A, 6 no 3A) e **piso 1** (12 no 1A, 13 no 3A).

**Falta apenas (quando quiser enviar):**
1. **Tipologias do Lote 1A** — pisos 2 a 6, por bloco
2. **Tipologias do Lote 3A** — todos os pisos, por bloco
3. (Opcional) montar a tabela `casa | bloco | tipologia` em cada nota de piso, que é o mais útil para a fiscalização
[Timestamp: 2026/10/09 10:38:21]

**user**: 1. tenho 6 t2 e 1 t3 no bloco A 
e no bloco B tenho 3 t2 e 3 t3
[Timestamp: 2026/10/09 10:52:19]

**ai**: Registado como dado — mas bate certo com **um único piso**, e preciso de saber qual. Veja a verificação:

**Distribuição que indicou:**
- Bloco A: 6 T2 + 1 T3 = **7 casas** ✓
- Bloco B: 3 T2 + 3 T3 = **6 casas** ✓
- Total: **13 casas** — corresponde a um piso com 7A/6B, ou seja, aos **pisos 2 a 5** do Lote 1A (não ao piso 6, que tem 6 casas todas no Bloco B)

**O problema é a contagem global do Lote 1A** (1 T1 + 56 T2 + 20 T3 = 77, que confirmou):

| | T1 | T2 | T3 | Casas |
|---|---:|---:|---:|---:|
| Piso -1 | 1 | 5 | 1 | 7 |
| Piso 1 | 0 | 8 | 4 | 12 |
| 4× (6T2+1T3 / 3T2+3T3) | 0 | **36** | **16** | 52 |
| Piso 6 | 0 | ? | ? | 6 |
| **Soma parcial** | 1 | **49+** | **22+** | 77 |

- **T3 = 1 + 4 + 16 = 21**, mas o lote só tem **20 T3** — excede 1.
- E ainda sobravam 43 T2 para os pisos 2-6, mas este padrão já gastaria 36 nos quatro pisos.

**Então, perguntas:**

1. Esta distribuição (6T2+1T3 no A / 3T2+3T3 no B) aplica-se a **qual piso**? (piso 2? 3? 4? 5?)
2. Os **outros pisos 2-5 são iguais ou diferentes**? Se forem todos iguais, algum dos números está desencontrado — provavelmente os **20 T3** seriam 21, ou então a composição de um dos pisos é outra.

Assim que me diga o piso (e os restantes), completo a secção de tipologias do [[Lavandeira - Lote 1A]] e fecho a conta dos 77.
[Timestamp: 2026/10/09 10:52:19]

**user**: piso 2,3,4,5 sao completamente iguais. piso 6 tem 3 t3 e 3 t2
[Timestamp: 2026/10/09 10:59:49]

**ai**: Piso 2, 3, 4 e 5 idênticos e piso 6 = 3 T3 + 3 T2. Vou ver a estrutura de uma nota de piso para aplicar em todas:Sem correspondência exata — vou fazer edições mais pequenas com o texto exato:Registado em todas as notas. Mas os números não fecham — veja:

**✅ Escrito agora:**
- [[Lote 1A - Piso 2]], [[Lote 1A - Piso 3]], [[Lote 1A - Piso 4]], [[Lote 1A - Piso 5]]: "Bloco A = 6 T2 + 1 T3; Bloco B = 3 T2 + 3 T3"
- [[Lote 1A - Piso 6]]: "3 T2 + 3 T3, todas no Bloco B"
- [[Lavandeira - Lote 1A]]: secção de tipologias por piso completa

**⚠️ Conflito nos totais do Lote 1A:**

| Piso | T1 | T2 | T3 |
|---|---:|---:|---:|
| -1 | 1 | 5 | 1 |
| 1 | 0 | 8 | 4 |
| 2 (igual ao 3, 4, 5) | 0 | 9 | 4 |
| 3 | 0 | 9 | 4 |
| 4 | 0 | 9 | 4 |
| 5 | 0 | 9 | 4 |
| 6 | 0 | 3 | 3 |
| **Soma por pisos** | **1** | **52** | **24** |
| **Registado (que confirmou)** | **1** | **56** | **20** |

Ambos dão 77 casas, mas **diferem em 4 casas**: por piso há **4 T3 a mais** (ou 4 T2 a menos) face ao total de 20 T3 / 56 T2.

**Qual dos valores está correto?**
- **Opção A**: os totais por pisos estão certos → o lote tem **1 T1 + 52 T2 + 24 T3** (corrijo a tabela).
- **Opção B**: o registo de **20 T3 + 56 T2** está certo → então em algum piso 4 das casas contadas como T3 são na verdade T2 (ex.: se o piso 1 fosse 12 T2 e 0 T3, ou se os "4 T3" de um dos pisos 2-5 fossem T2...). Diga-me qual.

Enquanto não confirmar, deixei um aviso ⚠️ na tabela do [[Lavandeira - Lote 1A]].

**E falta ainda:** as tipologias do **Lote 3A** (7 pisos) — quando tiver, envie.
[Timestamp: 2026/10/09 10:59:49]

**user**: estamos a falar só do lote 1A. é a opção A.
[Timestamp: 2026/10/09 11:05:01]

**ai**: Opção A confirmada — corrijo a tabela do [[Lavandeira - Lote 1A]] para **1 T1 + 52 T2 + 24 T3**:✅ **Corrigido** — [[Lavandeira - Lote 1A]]:

| Tipologia | Casas |
|---|---:|
| T1 | 1 |
| T2 | **52** |
| T3 | **24** |
| **Total** | **77** ✓ |

O aviso ⚠️ foi removido e não há mais nenhuma referência aos valores antigos (56 T2 / 20 T3) no vault.

**Estado do Lote 1A — completo:**

| Dado | Estado |
|---|---|
| Distribuição por piso e bloco (42A + 35B) | ✅ |
| Piso 6: 6 casas todas no Bloco B | ✅ |
| Tipologias por piso e bloco (pisos -1, 1, 2-5, 6) | ✅ |
| Totais: 1 T1 + 52 T2 + 24 T3 = 77 | ✅ |

**Por fazer (só falta isto):**
- **Tipologias do Lote 3A** — os 7 pisos, por bloco (se forem iguais aos do 1A, diga-me apenas as diferenças, p.ex. *"igual ao 1A exceto piso -1"*).
[Timestamp: 2026/10/09 11:05:01]

**user**: piso -1 tem 5 t2 e 1 t3 bloco A
piso 1 tem 6 t2 e 1 t3 bloco A e bloco b tem 2 t2, 1 t1 e 3 t3
piso 2 a 5 tem tem 6 t2 e 1 t3 bloco A e blobo B tem 3 t2 e 3 t3.
piso 6 tem 3 t3, e 3 t2 bloco B
[Timestamp: 2026/10/09 13:36:07]

**ai**: Perfeito — fecha a conta! Vou verificar primeiro: **3A** → T1 = 1 (piso 1), T2 = 5+8+36+3 = **52**, T3 = 1+4+16+3 = **24** → **77** ✓ (e o piso -1 com 6 casas bate certo: 5 T2 + 1 T3). Aplicando:Agora a secção de tipologias no [[Lavandeira - Lote 3A]] e o resumo no [[Lavandeira - Geral]]:Verificação final de consistência no vault:✅ **Tudo concluído e verificado** — zero resíduos de "1B", "por confirmar", "78 casas" ou "155" no vault.

**Últimas alterações:**
- Secção de tipologias criada em [[Lavandeira - Lote 3A]] (1 T1 + 52 T2 + 24 T3 = 77)
- Linha de tipologias nas **7 notas de piso do 3A** (com o detalhe por bloco)
- Resumo por tipologia no [[Lavandeira - Geral]]

**Estado final dos dois lotes — tudo fechado:**

| | Lote 1A | Lote 3A |
|---|---|---|
| Total | 77 ✓ | 77 ✓ |
| Bloco A / Bloco B | 42 / 35 | 41 / 36 |
| Tipologias | 1 T1 + 52 T2 + 24 T3 | 1 T1 + 52 T2 + 24 T3 |
| Piso -1 | 7 (7A/0B) | 6 (6A/0B) |
| Piso 1 | 12 (7A/5B), T1 no piso -1 | 13 (7A/6B), **T1 no Bloco B** |
| Pisos 2-5 | 13 cada, idênticos | 13 cada, idênticos |
| Piso 6 | 6, todas no Bloco B | 6, todas no Bloco B |
| Tipologias por piso | ✅ todas | ✅ todas |

**Notas:** os dois lotes têm a mesma composição por tipologia — a única diferença entre eles está na **distribuição** (piso -1: 7 vs 6 casas; piso 1: 12 vs 13) e na localização do **único T1** (no 1A está no piso -1, no 3A está no piso 1, Bloco B).

Quando quiser, o passo seguinte natural para a fiscalização seria a tabela **`casa | bloco | tipologia`** em cada nota de piso — para isso só precisaria de saber a numeração das casas (ex.: A1, A2... B1, B2...). É só dizer.
[Timestamp: 2026/10/09 13:36:07]

**user**: é possivel fazaer isso e deixar a numeracao da casa para eu preencer no momento?
[Timestamp: 2026/10/09 13:59:03]

**ai**: Sim, perfeitamente. Vou criar em cada uma das 14 notas de piso a tabela `| Nº | Bloco | Tipologia |` com uma linha por casa (tipologia pré-preenchida) e a coluna **Nº** vazia para si preencher:14 notas criadas (77 linhas no 1A + 77 no 3A ✓). Verificação visual de duas — uma normal e o caso especial:✅ **Feito — tabela criada nas 14 notas de piso**, com uma linha por casa:

```
## 🏷️ Casas (nº por preencher)

| Nº | Bloco | Tipologia |
|---|---|---|
|  | A | T2 |
|  | A | T3 |
...
```

- **Coluna Nº** vazia — preenche diretamente na Obsidian
- **Bloco e Tipologia** pré-preenchidos (154 linhas no total: 77 + 77)
- Incluída a nota de que **a ordem das linhas ainda não é a ordem física** — se me der a numeração, eu reordeno as linhas

**Uma exceção:** no [[Lote 1A - Piso 1]] deixei as 12 linhas com **Tipologia vazia**, porque só temos o total (8 T2 + 4 T3) e a divisão por bloco (7 no A, 5 no B) — mas não que tipologias estão em cada bloco. Para fechar:

> **Piso 1 do Lote 1A** — como se dividem os 8 T2 e 4 T3 entre os blocos?
> Ex.: *"Bloco A: 4 T2 + 3 T3; Bloco B: 4 T2 + 1 T3"* (assim A = 7 ✓ e B = 5 ✓)

Assim que me diga, completo a coluna. E quando quiser numerar, pode fazer de duas formas:
1. **Preenche você** as células Nº diretamente na tabela, ou
2. **Dá-me os números** (ex.: *"piso 2: A1 a A4 são T3..."*) e eu reordeno/complete tudo, incluindo eventuais correções de tipologia.
[Timestamp: 2026/10/09 13:59:03]

**user**: eu preencho porque esta tudo misturado
[Timestamp: 2026/10/09 14:11:28]

**ai**: Perfeito — fica assim então. As 14 tabelas estão suas para preencher, na ordem física que quiser.

Só dois lembretes:

1. **[[Lote 1A - Piso 1]]** — além do **Nº**, tem de preencher também a coluna **Tipologia** (está vazia), pois só sei que o piso tem 8 T2 + 4 T3 no total, sem a divisão por bloco. Nos outros 13 pisos a tipologia já vem preenchida.

2. **Auto-verificação** — o número de linhas de cada tabela está certo por construção, caso queira confirmar enquanto preenche:
   - Piso -1: 7 linhas (1A) / 6 linhas (3A)
   - Piso 1: 12 (1A) / 13 (3A)
   - Pisos 2-5: 13 em cada
   - Piso 6: 6

E, se depois de preencher quiser, **dê uma olhadela e eu faço a conferência automática** — recconto T1/T2/T3 por piso e por lote e comparo com os totais (1 T1 + 52 T2 + 24 T3 = 77 em cada lote), para garantir que nada ficou trocado.
[Timestamp: 2026/10/09 14:11:28]

**user**: obrigada
[Timestamp: 2026/10/09 14:12:24]

**ai**: De nada! 😊

Fica então registado no vault, para resumir o que ficou fechado hoje:

- **Lavandeira = 2 lotes** (1A e 3A), cada um com **Bloco A e Bloco B** — renomeação completa do antigo "Lote 1B" para **Lote 3A** (ficheiros, pastas, links e frontmatter)
- **154 casas** no total — 77 + 77, com composição idêntica: **1 T1 + 52 T2 + 24 T3** por lote
- Distribuição por piso e bloco confirmada e fechada nos dois lotes
- Tipologias registadas por piso
- Tabelas `Nº | Bloco | Tipologia` em todas as notas de piso, para preencher

Quando preencher a numeração (e a tipologia do piso 1 do 1A), avisar que eu faço a conferência dos totais. Qualquer coisa sobre a obra, é só dizer. Bom trabalho! 🏗️
[Timestamp: 2026/10/09 14:12:24]