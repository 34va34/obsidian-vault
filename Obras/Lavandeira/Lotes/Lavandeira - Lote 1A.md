---
tags: obra, lavandeira, lote-1a
obra: Lavandeira
lote: 1A
estado: Em andamento
data_inicio: 2026-10-28
total_casas: 77
casas_bloco_a: 42
casas_bloco_b: 35
---

# 🏗️ Lavandeira — Lote 1A

## 📋 Informações Gerais

- **Obra**: [[Lavandeira - Geral]]
- **Estado**: Em andamento
- **Data de início**: 28/10/2026
- **Morada**: Em frente à Lavandeira

## 🏢 Configuração

- 5 pisos principais
- Piso -1 parcial
- Piso 6 parcial
- Configuração igual ao [[Lavandeira - Lote 3A]]

## 🗂️ Acompanhamento por Piso

- [[Lote 1A - Piso -1]]
- [[Lote 1A - Piso 1]]
- [[Lote 1A - Piso 2]]
- [[Lote 1A - Piso 3]]
- [[Lote 1A - Piso 4]]
- [[Lote 1A - Piso 5]]
- [[Lote 1A - Piso 6]]

## 🏠 Distribuição de casas por bloco e piso

| Piso              |           Bloco A |           Bloco B |  Total |
| ----------------- | ----------------: | ----------------: | -----: |
| Piso -1           |                 7 |                 0 |      7 |
| Piso 1            |                 7 |                 5 |     12 |
| Piso 2            |                 7 |                 6 |     13 |
| Piso 3            |                 7 |                 6 |     13 |
| Piso 4            |                 7 |                 6 |     13 |
| Piso 5            |                 7 |                 6 |     13 |
| Piso 6            |                 0 |                 6 |      6 |
| **Total Lote 1A** | **42** | **35** | **77** |

> O piso 6 tem 6 casas, todas no Bloco B.

## 🧩 Tipologias (T1/T2/T3)

| Tipologia | Casas |
|---|---:|
| T1 | 1 |
| T2 | 52 |
| T3 | 24 |
| **Total Lote 1A** | **77** |

- **Piso -1**: 5 T2 + 1 T3 + 1 T1 (7 casas, todas no Bloco A).
- **Piso 1**: 8 T2 + 4 T3 (12 casas; 7 no Bloco A e 5 no Bloco B).
- **Pisos 2 a 5** (idênticos): Bloco A = 6 T2 + 1 T3; Bloco B = 3 T2 + 3 T3 → 9 T2 + 4 T3 por piso (13 casas).
- **Piso 6**: 6 casas, todas no Bloco B: 3 T2 + 3 T3.
- Tipologias registadas em todos os pisos.

## 📝 Notas

- Total atualizado: **77 casas**.
- Distribuição conhecida: piso -1 com 7 casas no Bloco A e nenhuma no Bloco B; piso 1 com 7 casas no Bloco A e 5 no Bloco B; pisos 2 a 5 com 7 casas no Bloco A e 6 no Bloco B; piso 6 com 6 casas, todas no Bloco B.
- O Lote 1A está dividido nos Blocos A e B. O Lote 3A mantém a sua configuração registada separadamente.

## 🔁 Trabalhos reutilizados neste local

```dataview
TABLE WITHOUT ID file.link AS "Tarefa", trabalho_modelo AS "Trabalho", estado AS "Estado", responsavel AS "Responsável"
FROM "Tarefas/Reutilizadas"
WHERE obra = this.obra AND lote = this.lote
SORT estado ASC, trabalho_modelo ASC
```
