---
tags: obra, lavandeira, lote-3a, piso-1
obra: Lavandeira
lote: 3A
piso: "1"
estado: Por iniciar
tempo_total: 0h
data_inicio:
data_conclusao:
casas_bloco_a: 7
casas_bloco_b: 6
total_casas: 13
---

# 🏗️ Lavandeira — Lote 3A — Piso 1

## 🏠 Distribuição de casas por bloco

| Bloco | Casas |
|---|---:|
| Bloco A | 7 |
| Bloco B | 6 |
| **Total do piso** | **13** |

- **Tipologias**: Bloco A = 6 T2 + 1 T3; Bloco B = 2 T2 + 1 T1 + 3 T3 (total 8 T2 + 4 T3 + 1 T1).


- **Obra**: [[Lavandeira - Geral]]
- **Lote**: [[Lavandeira - Lote 3A]]
- **Estado**: Por iniciar
- **Tempo total de execução**: 0h

## 🏷️ Casas (nº por preencher)

Preencher a coluna **Nº** com a numeração da casa. A ordem das linhas ainda não corresponde à ordem física — se me der os números, eu reordeno.

| Nº | Bloco | Tipologia |
|---|---|---|
|  | A | T2 |
|  | A | T2 |
|  | A | T2 |
|  | A | T2 |
|  | A | T2 |
|  | A | T2 |
|  | A | T3 |
|  | B | T2 |
|  | B | T2 |
|  | B | T1 |
|  | B | T3 |
|  | B | T3 |
|  | B | T3 |

## ✅ O que já foi feito

-

## 🔨 O que está por fazer

- terminar aguas no teto
- iniciar esgotos 
- aguas interiores
- teste de carga
- teste de esgotos
- 

## ⏳ O que está pendente

-

## ⏱️ Registo de execução

| Atividade   | Data de início | Data de fim | Tempo gasto | Responsável | Estado |
| ----------- | -------------- | ----------- | ----------: | ----------- | ------ |
| aguas tecto | 07/10/26       |             |           8 |             |        |
|             |                |             |             |             |        |

## 📝 Diário e observações

| Data | Registo | Tempo gasto |
|---|---|---:|
|  |  |  |

## 🔗 Ligações

- [[Lavandeira - Geral]]
- [[Lavandeira - Lote 3A]]

## 🔁 Trabalhos reutilizados neste local

```dataview
TABLE WITHOUT ID file.link AS "Tarefa", trabalho_modelo AS "Trabalho", estado AS "Estado", responsavel AS "Responsável"
FROM "Tarefas/Reutilizadas"
WHERE obra = this.obra AND lote = this.lote AND piso = this.piso
SORT estado ASC, trabalho_modelo ASC
```
