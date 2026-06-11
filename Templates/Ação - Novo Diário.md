<%*
const obra = await tp.system.prompt("Nome da Obra (ex: Ouro Valley)");
const lote = await tp.system.prompt("Lote (opcional)");
const date = tp.date.now("YYYY-MM-DD");
const fileName = `Diário - ${obra}${lote ? ' - ' + lote : ''} - ${date}`;
const folder = "Diário/Diários Diários";

const content = `---
tags: diario, obra
data: ${date}
obra: ${obra}
lote: ${lote || ""}
responsavel: 
---
# 📅 Diário de Obra — ${obra} ${lote ? '(' + lote + ')' : ''} — ${date}

## ☀️ Condições Climáticas
- **Temperatura**: 
- **Tempo**: 

## 👷 Equipa Presente
- 

## 📝 Atividades do Dia
- 

## 🚧 Problemas/Ocorrências
- 

## ✅ Tarefas Concluídas
- 

## 🔜 Próximas Atividades
- 

## 📸 Fotos/Anexos
- 

## ✍️ Observações Gerais
`;

await tp.file.create_new(content, fileName, false, app.vault.getAbstractFileByPath(folder));
new Notice(`Diário criado: ${fileName}`, 5000);
%>
