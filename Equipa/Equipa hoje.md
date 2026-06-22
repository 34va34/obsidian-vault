---
tags: pessoa, equipa
data:
  "{ date }":
obra:
nome:
  "{ name }":
cargo:
  "{ role }":
estado: Ativo
---
# 📅 Registo de Presenças — {{date}}

## 🏗️ Obra: 

## 👷 Tabela de Presenças

| Funcionário        | Presença | Horas Normais | Horas Extras | Sábado? | Observações |
| ------------------ | -------- | ------------- | ------------ | ------- | ----------- |
| [[António.md]]     | [Ativo]  | 9             | 1            | [ ]     |             |
| [[Afonso.md]]      | [Ativo]  | 9             | 0            | [ ]     |             |
| [[Diogo nunes.md]] | [Ativo]  | 8             | 0            | [ ]     |             |
| [[Tiago rocha.md]] | [Ativo]  | 8             | 0            | [ ]     |             |
| [[Yuri.md]]        | [Ativo]  | 8             | 0            | [ ]     |             |
| [[]]               |          |               |              |         |             |

## 📊 Resumo do Dia
- **Total de Funcionários**: 
- **Total Horas Extras**: 
- **Trabalho Especial**: 

## 📝 Notas Gerais
TABLE cargo as "Função", estado as "Status"
FROM "Equipa/Pessoas"
WHERE estado = "Ativo"
