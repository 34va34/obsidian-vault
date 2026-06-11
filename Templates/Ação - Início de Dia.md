<%*
const obra = await tp.system.prompt("Nome da Obra");
const tarefas = await tp.system.prompt("Tarefas Principais para Hoje (separadas por vírgula)");
const date = tp.date.now("YYYY-MM-DD");

// 1. Criar/Atualizar Registo de Presenças
const presencaFolder = "Equipa/Presenças";
const presencaFileName = `Presenças - ${obra} - ${date}`;

// Obter todos os ficheiros da pasta Equipa/Pessoas de forma robusta
const peopleFiles = app.vault.getAbstractFileByPath("Equipa/Pessoas").children;
let tableRows = "";

for (const file of peopleFiles) {
    if (file.name.endsWith(".md")) {
        const personName = file.name.replace(".md", "");
        // Criamos o link completo para garantir que o Dataview o reconhece
        tableRows += `| [[Equipa/Pessoas/${personName}\\|${personName}]] | [x] | 8 | 0 | [ ] | |\n`;
    }
}

const presencaContent = `---
tags: equipa, presencas
data: ${date}
obra: ${obra}
---
# 📅 Registo de Presenças — ${obra} — ${date}

## 👷 Tabela de Presenças
| Funcionário | Presença | Horas Normais | Horas Extras | Sábado? | Observações |
|-------------|----------|---------------|--------------|---------|-------------|
${tableRows}
`;

await tp.file.create_new(presencaContent, presencaFileName, false, app.vault.getAbstractFileByPath(presencaFolder));

// 2. Criar/Atualizar Diário de Obra
const diarioFolder = "Diário/Diários Diários";
const diarioFileName = `Diário - ${obra} - ${date}`;
const listaTarefas = tarefas.split(',').map(t => `- [ ] ${t.trim()}`).join('\n');

const diarioContent = `---
tags: diario, obra
data: ${date}
obra: ${obra}
---
# 📅 Diário de Obra — ${obra} — ${date}

## 📝 Planeamento do Dia
${listaTarefas}

## 👷 Equipa em Obra
Ver registo detalhado em: [[Equipa/Presenças/${presencaFileName}|Registo de Presenças]]

## ☀️ Condições Climáticas
- **Temperatura**: 
- **Tempo**: 

## 🚧 Ocorrências / Progresso
- 

## 📸 Fotos
- 
`;

await tp.file.create_new(diarioContent, diarioFileName, false, app.vault.getAbstractFileByPath(diarioFolder));

new Notice(`✅ Início de Dia concluído para ${obra}!`, 5000);
%>
