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

| Funcionário                              | Presença | Horas Normais | Horas Extras | Sábado? | Observações |
| ---------------------------------------- | -------- | ------------- | ------------ | ------- | ----------- |
| [[Equipa/Pessoas/António]]               | [Ativo]  | 9             | 1            | [ ]     |             |
| [[Equipa/Pessoas/Afonso]]                | [Ativo]  | 9             | 0            | [ ]     |             |
| [[Equipa/Pessoas/Diogo]]                 | [Ativo]  | 8             | 0            | [ ]     |             |
| [[Equipa/Pessoas/Tiago]]                 | [Ativo]  | 8             | 0            | [ ]     |             |
| [[Equipa/Pessoas/Yuri]]                  | [Ativo]  | 8             | 0            | [ ]     |             |
| [[Equipa/Presenças/${presencaFileName}]] |          |               |              |         |             |

## 📊 Resumo do Dia
- **Total de Funcionários**: 
- **Total Horas Extras**: 
- **Trabalho Especial**: 

## 📝 Notas Gerais
TABLE cargo as "Função", estado as "Status"
FROM "Equipa/Pessoas"
WHERE estado = "Ativo"
