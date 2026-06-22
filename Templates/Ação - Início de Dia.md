<%*
const obra = await tp.system.prompt("Nome da Obra");
if (!obra) {
    new Notice("Nome da Obra não fornecido. Script abortado.", 5000);
    return;
}

const tarefasInput = await tp.system.prompt("Tarefas para hoje (ex: Pintar sala @Afonso, Limpar entulho @Yuri)");
const date = tp.date.now("YYYY-MM-DD");

// --- Função auxiliar para garantir que uma pasta existe ---
async function ensureFolderExists(folderPath) {
    const folder = app.vault.getAbstractFileByPath(folderPath);
    if (!folder || !(folder instanceof tp.obsidian.TFolder)) {
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

if (peopleFolder && peopleFolder instanceof tp.obsidian.TFolder) {
    // Ordenar funcionários por nome
    const peopleFiles = peopleFolder.children
        .filter(f => f instanceof tp.obsidian.TFile && f.extension === "md")
        .sort((a, b) => a.basename.localeCompare(b.basename));

    for (const file of peopleFiles) {
        const personName = file.basename;
        // Formato: | Funcionário | Presença | Horas Normais | Horas Extras | Sábado? | Observações |
        tableRows += `| [[${personName}]] | [x] | 8 | 0 | [ ] | |\n`;
    }
} else {
    new Notice("Aviso: Pasta 'Equipa/Pessoas' não encontrada. Tabela de presenças estará vazia.", 5000);
}

const presencaContent = `---
tags: equipa, presencas
data: ${date}
obra: "${obra}"
---
# 📅 Registo de Presenças — ${obra} — ${date}

## 👷 Tabela de Presenças
| Funcionário | Presença | Horas Normais | Horas Extras | Sábado? | Observações |
|-------------|----------|---------------|--------------|---------|-------------|
${tableRows}

> [!TIP] Instruções
> - **Presença**: [x] para presente, [ ] para falta.
> - **Sábado**: Marcar [x] se o trabalho for realizado ao sábado.
`;

// Criar ficheiro de presenças
const existingPresencaFile = app.vault.getAbstractFileByPath(`${presencaFolder}/${presencaFileName}.md`);
if (!existingPresencaFile) {
    await tp.file.create_new(presencaContent, presencaFileName, false, presencaTargetFolder);
}

// --- 2. Processar Tarefas e Atribuições ---
let listaTarefasMarkdown = "";
if (tarefasInput) {
    const tarefasArray = tarefasInput.split(',').map(t => t.trim());
    listaTarefasMarkdown = tarefasArray.map(t => {
        // Regex para encontrar @Nome ou #Nome
        const match = t.match(/[@#]([^\s,]+)/);
        if (match) {
            const nome = match[1];
            const tarefaLimpa = t.replace(match[0], "").trim();
            return `- [ ] ${tarefaLimpa} 👤 [[${nome}]]`;
        }
        return `- [ ] ${t}`;
    }).join('\n');
} else {
    listaTarefasMarkdown = "- [ ] Nenhuma tarefa definida.";
}

// --- 3. Criar Diário de Obra ---
const diarioFolder = "Diário/Diários Diários";
const diarioFileName = `Diário - ${obra} - ${date}`;
const diarioTargetFolder = await ensureFolderExists(diarioFolder);

const diarioContent = `---
tags: diario, obra
data: ${date}
obra: "${obra}"
---
# 📅 Diário de Obra — ${obra} — ${date}

## 📝 Planeamento do Dia
${listaTarefasMarkdown}

## 👷 Equipa em Obra
Ver registo detalhado em: [[${presencaFileName}|Registo de Presenças]]

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
    new Notice(`O diário de obra para '${obra}' em ${date} já existe.`, 5000);
} else {
    await tp.file.create_new(diarioContent, diarioFileName, false, diarioTargetFolder);
    new Notice(`Diário de Obra e Presenças criados para ${obra}!`, 3000);
}
%>
