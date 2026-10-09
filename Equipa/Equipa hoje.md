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

| Observações | Funcionário          | Presença | Horas Normais | Horas Extras | Sábado? |
| ----------- | -------------------- | -------- | ------------- | ------------ | ------- |
|             | [[António Manuel]]   | [Ativo]  | 0             | 0            | [ ]     |
|             | [[Afonso.md]]        | [Ativo]  | 0             | 0            | [ ]     |
|             | [[Diogo nunes.md]]   | [Ativo]  | 0             | 0            | [ ]     |
|             | [[Yuri.md]]          | [Ativo]  | 0             | 0            | [ ]     |
|             | [[Moisés kalandula]] |          | 0             | 0            |         |
|             | [[venacio]]          |          | 0             | 0            |         |

## 📊 Resumo do Dia
- **Total de Funcionários**: 
- **Total Horas Extras**: 
- **Trabalho Especial**: 

## 📝 Notas Gerais
TABLE cargo as "Função", estado as "Status"
FROM "Equipa/Pessoas"
WHERE estado = "Ativo"
