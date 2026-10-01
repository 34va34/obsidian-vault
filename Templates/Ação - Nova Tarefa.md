<%*
const taskName = await tp.system.prompt("Descrição da Tarefa");
const project = await tp.system.prompt("Obra/Projeto");
const lote = await tp.system.prompt("Lote (opcional)");
const piso = await tp.system.prompt("Piso (opcional)");
const date = tp.date.now("YYYY-MM-DD");
const folder = "Tarefas";
const fileName = `Tarefa - ${taskName}`;

const content = `---
tags: tarefa, trabalho
estado: Pendente
data_criacao: ${date}
data_limite:
obra: ${project}
lote: ${lote || ""}
piso: ${piso || ""}
responsavel: 
origem: manual
---
# 📝 Tarefa: ${taskName}

## Descrição
${taskName}

## Detalhes
- **Data de Criação**: ${date}
- **Data Limite**: 
- **Prioridade**: Média
- **Estado**: Pendente

## Obra/Projeto
- **Obra**: ${project}
- **Lote**: ${lote || ""}
- **Piso**: ${piso || ""}

## Responsável
- **Pessoa**: 

## Notas
`;

const targetFolder = app.vault.getAbstractFileByPath(folder);
await tp.file.create_new(content, fileName, false, targetFolder);
new Notice(`Tarefa criada: ${taskName}`, 5000);
%>
