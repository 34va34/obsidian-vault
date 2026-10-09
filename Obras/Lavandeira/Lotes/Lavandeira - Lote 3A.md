---
tags: obra, lavandeira, lote-3a
obra: Lavandeira
lote: 3A
estado: Parado
data_inicio: 2026-10-28
total_casas: 77
casas_bloco_a: 41
casas_bloco_b: 36
---

# 🏗️ Lavandeira — Lote 3A

## 📋 Informações Gerais

- **Obra**: [[Lavandeira - Geral]]
- **Estado**: Parado
- **Data de início**: 28/10/2026
- **Morada**: Em frente à Lavandeira

## 🏢 Configuração

- Dividido em dois blocos: Bloco A e Bloco B
- 5 pisos principais
- Piso -1 parcial
- Piso 6 parcial
- Configuração igual ao [[Lavandeira - Lote 1A]]

## 🗂️ Acompanhamento por Piso e Bloco

- **Piso -1**: [[Lote 3A - Piso -1 - Bloco A|Bloco A]]
- **Piso 1**: [[Lote 3A - Piso 1 - Bloco A|Bloco A]] · [[Lote 3A - Piso 1 - Bloco B|Bloco B]]
- **Piso 2**: [[Lote 3A - Piso 2 - Bloco A|Bloco A]] · [[Lote 3A - Piso 2 - Bloco B|Bloco B]]
- **Piso 3**: [[Lote 3A - Piso 3 - Bloco A|Bloco A]] · [[Lote 3A - Piso 3 - Bloco B|Bloco B]]
- **Piso 4**: [[Lote 3A - Piso 4 - Bloco A|Bloco A]] · [[Lote 3A - Piso 4 - Bloco B|Bloco B]]
- **Piso 5**: [[Lote 3A - Piso 5 - Bloco A|Bloco A]] · [[Lote 3A - Piso 5 - Bloco B|Bloco B]]
- **Piso 6**: [[Lote 3A - Piso 6 - Bloco B|Bloco B]]

## 🏠 Distribuição de casas por bloco e piso

| Piso | Bloco A | Bloco B | Total |
|---|---:|---:|---:|
| Piso -1 | 6 | 0 | 6 |
| Piso 1 | 7 | 6 | 13 |
| Piso 2 | 7 | 6 | 13 |
| Piso 3 | 7 | 6 | 13 |
| Piso 4 | 7 | 6 | 13 |
| Piso 5 | 7 | 6 | 13 |
| Piso 6 | 0 | 6 | 6 |
| **Total Lote 3A** | **41** | **36** | **77** |

> O piso -1 do Lote 3A tem **6 casas** (o do Lote 1A tem 7). A somatória por pisos fecha em 77.

> O piso 6 tem 6 casas, todas no Bloco B.

## 🧩 Tipologias (T1/T2/T3)

| Tipologia | Casas |
|---|---:|
| T1 | 1 |
| T2 | 52 |
| T3 | 24 |
| **Total Lote 3A** | **77** |

- **Piso -1**: 5 T2 + 1 T3 (6 casas, todas no Bloco A).
- **Piso 1**: 8 T2 + 4 T3 + 1 T1 (13 casas; Bloco A = 6 T2 + 1 T3, Bloco B = 2 T2 + 1 T1 + 3 T3).
- **Pisos 2 a 5** (idênticos): Bloco A = 6 T2 + 1 T3; Bloco B = 3 T2 + 3 T3 → 9 T2 + 4 T3 por piso (13 casas).
- **Piso 6**: 6 casas, todas no Bloco B: 3 T2 + 3 T3.

## 📝 Notas

- Total atualizado: **77 casas**.
- O lote 3A segue a mesma configuração do lote 1A, com a exceção do piso -1: este tem **6 casas no Bloco A** e nenhuma no Bloco B (no Lote 1A são 7); pisos 1 a 5 com 7 casas no Bloco A e 6 no Bloco B; piso 6 com 6 casas no total.
- A divisão do piso 6 está confirmada: as 6 casas estão todas no Bloco B.

## 🔁 Trabalhos reutilizados neste local

```dataview
TABLE WITHOUT ID file.link AS "Tarefa", trabalho_modelo AS "Trabalho", estado AS "Estado", responsavel AS "Responsável"
FROM "Tarefas/Reutilizadas"
WHERE obra = this.obra AND lote = this.lote
SORT estado ASC, trabalho_modelo ASC
```
