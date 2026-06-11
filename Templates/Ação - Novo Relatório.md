<%*
const obra = await tp.system.prompt("Obra para o Relatório");
const date = tp.date.now("YYYY-MM-DD");
const fileName = `Relatório 20-20 - ${obra} - ${date}`;

const content = `---
tags: relatorio, obra
data_inicio: 
data_fim: 
obra: ${obra}
responsavel: 
---
# 📊 Relatório 20-20 — ${obra} — ${date}

## 🗓️ Período do Relatório
- **Início**: 
- **Fim**: 

## 🏗️ Obra
- **Nome**: ${obra}
- **Lotes Abrangidos**: 

## 👤 Responsável
- **Nome**: 

## 📈 Progresso Geral
- **Percentagem de Conclusão**: 
- **Observações**: 

## 🚧 Marcos Alcançados
- 

## ⚠️ Problemas e Desafios
- 

## 💰 Custos e Orçamento
- **Orçamento Previsto**: 
- **Custos Atuais**: 
- **Desvio**: 

## 🔜 Próximos Passos
- 

## 📝 Anexos
- 
`;

await tp.file.create_new(content, fileName, false);
new Notice(`Relatório criado para ${obra}`, 5000);
%>
