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

| Funcionário                | Presença | Horas Normais | Horas Extras | Sábado? | Observações |
| -------------------------- | -------- | ------------- | ------------ | ------- | ----------- |
| [[Equipa/Pessoas/António]] | [sim ]   | 8             | 1            | [ ]     |             |
| [[Equipa/Pessoas/Afonso]]  | [nao]    | 0             | 0            | [ ]     |             |
| [[Equipa/Pessoas/Diogo]]   | [ sim]   | 8             | 0            | [ ]     |             |
| [[Equipa/Pessoas/Tiago]]   | [sim]    | 8             | 0            | [ ]     |             |
| [[Equipa/Pessoas/Yuri]]    | [ nao]   | 0             | 0            | [ ]     |             |
|                            |          |               |              |         |             |

## 📊 Resumo do Dia
- **Total de Funcionários**: 
- **Total Horas Extras**: 
- **Trabalho Especial**: 

## 📝 Notas Gerais
TABLE cargo as "Função", estado as "Status"
FROM "Equipa/Pessoas"
WHERE estado = "Ativo"
