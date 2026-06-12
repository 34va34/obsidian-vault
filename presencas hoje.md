<%*
const obra = await tp.system.prompt("ouro valley");
if (!obra) {
    new Notice("Nome da Obra não fornecido. Script abortado.", 5000);
    return;
}

const tarefasInput = await tp.system.prompt("Tarefas Principais para Hoje (separadas por vírgula)");
const date = tp.date.now("YYYY-MM-DD");

// --- Função auxiliar para garantir que uma pasta existe ---
async function ensureFolderExists(folderPath) {
    const folder = app.vault.getAbstractFileByPath(folderPath);
    if (!folder || !(folder instanceof TFolder)) {
        try {
            await app.vault.createFolder(folderPath);
            new Notice(`Pasta '${folderPath}' criada.`, 3000);
            return app.vault.getAbstractFileByPath(folderPath);
        } catch (e) {
            new Notice(`Erro ao criar pasta '${folderPath}': ${e.message}`, 5000);
            return null;
        }
    }
    return folder;
}

// --- 1. Criar/Atualizar Registo de Presenças ---
const presencaFolder = "Equipa/Presenças";
const presencaFileName = `Presenças - ${obra} - ${date}`;
const presencaTargetFolder = await ensureFolderExists(presencaFolder);

if (!presencaTargetFolder) {
    new Notice(`Erro: Não foi possível aceder ou criar a pasta '${presencaFolder}'. Script abortado.`, 5000);
    return;
}

const peopleFolder = app.vault.getAbstractFileByPath("Equipa/Pessoas");
let tableRows = "";

if (peopleFolder && peopleFolder instanceof TFolder) {
    for (const file of peopleFolder.children) {
        if (file instanceof TFile && file.extension === "md") {
            const personName = file.basename;
            // O link deve ser para o ficheiro do funcionário, usando o caminho completo
            tableRows += `| [[${file.path}|${personName}]] | [x] | 8 | 0 | [ ] | |\n`;
        }
    }
} else {
    new Notice("Aviso: Pasta 'Equipa/Pessoas' não encontrada ou não é uma pasta válida. Tabela de presenças pode estar vazia.", 5000);
}

const presencaContent = `---
tags: equipa, presencas
data: ${date}
obra: "${obra}" # Usar aspas para garantir que o Dataview interpreta corretamente se houver caracteres especiais
---
# 📅 Registo de Presenças — ${obra} — ${date}

## 👷 Tabela de Presenças
| Funcionário | Presença | Horas Normais | Horas Extras | Sábado? | Observações |
|-------------|----------|---------------|--------------|---------|-------------|
${tableRows}
`;

// Verifica se o ficheiro já existe para evitar sobrescrever
const existingPresencaFile = app.vault.getAbstractFileByPath(`${presencaFolder}/${presencaFileName}.md`);
if (existingPresencaFile) {
    new Notice(`O registo de presenças para '${obra}' em ${date} já existe. Não foi criado um novo.`, 5000);
} else {
    await tp.file.create_new(presencaContent, presencaFileName, false, presencaTargetFolder);
    new Notice(`Registo de Presenças para '${obra}' criado com sucesso!`, 3000);
}


// --- 2. Criar/Atualizar Diário de Obra ---
const diarioFolder = "Diário/Diários Diários";
const diarioFileName = `Diário - ${obra} - ${date}`;
const diarioTargetFolder = await ensureFolderExists(diarioFolder);

if (!diarioTargetFolder) {
    new Notice(`Erro: Não foi possível aceder ou criar a pasta '${diarioFolder}'. Script abortado.`, 5000);
    return;
}

const listaTarefas = tarefasInput ? tarefasInput.split(',').map(t => `- [ ] ${t.trim()}`).join('\n') : "- [ ] Nenhuma tarefa principal definida.";

const diarioContent = `---
tags: diario, obra
data: ${date}
obra: "${obra}"
---
# 📅 Diário de Obra — ${obra} — ${date}

## 📝 Planeamento do Dia
${listaTarefas}

## 👷 Equipa em Obra
Ver registo detalhado em: [[${presencaFolder}/${presencaFileName}|Registo de Presenças]]

## ☀️ Condições Climáticas
- **Temperatura**: 
- **Tempo**: 

## 🚧 Ocorrências / Progresso
- 

## 📸 Fotos
- 
`;

const existingDiarioFile = app.vault.getAbstractFileByPath(`${diarioFolder}/${diarioFileName}.md`);
if (existingDiarioFile) {
    new Notice(`O diário de obra para '${obra}' em ${date} já existe. Não foi criado um novo.`, 5000);
} else {
    await tp.file.create_new(diarioContent, diarioFileName, false, diarioTargetFolder);
    new Notice(`Diário de Obra para '${obra}' criado com sucesso!`, 3000);
}

new Notice(`✅ Início de Dia concluído para ${obra}!`, 5000);
%>