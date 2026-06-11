<%*
const taskName = await tp.system.prompt("Descrição da Tarefa");
const project = await tp.system.prompt("Obra/Projeto");
const date = tp.date.now("YYYY-MM-DD");
const fileName = `Tarefa - ${taskName}`;

const content = `---
tags: tarefa, trabalho
status: Pendente
due: 
project: ${project}
responsavel: 
---
# 📝 Tarefa: ${taskName}

## Descrição
${taskName}

## Detalhes
- **Data de Criação**: ${date}
- **Data Limite**: 
- **Prioridade**: Média
- **Status**: Pendente

## Obra/Projeto
- **Obra**: ${project}
- **Lote**: 

## Responsável
- **Pessoa**: 

## Notas
`;

// As tarefas ficam na raiz ou numa pasta de tarefas se existir, por agora na raiz do vault para visibilidade
await tp.file.create_new(content, fileName, false);
new Notice(`Tarefa criada: ${taskName}`, 5000);
%>
