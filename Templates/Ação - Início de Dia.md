<%*
// ============================================================================
// 🌅 AÇÃO — INÍCIO DE DIA
// Cria, para a obra e a data de hoje:
//    1) Registo de Presenças   2) Diário de Obra   3) Tarefas do dia
//
// Executar: Ctrl/Cmd + P → "Templater: Create new note from template"
//           → escolher "Ação - Início de Dia"
// (Clicar na ligação do Dashboard só abre este código.)
// ============================================================================

const date = tp.date.now("YYYY-MM-DD");

const obraInput = await tp.system.prompt("Nome da Obra (ex: Ouro Valley)");
if (!obraInput || !obraInput.trim()) {
    new Notice("Ação cancelada: falta o nome da obra.", 5000);
    return;
}
const obra = obraInput.trim();

const tarefasInput = await tp.system.prompt(
    "Tarefas para hoje, separadas por vírgulas (ex: Executar águas interiores piso -1 @José, Ligar esgotos @Afonso)"
);
if (tarefasInput === null || tarefasInput === undefined) {
    new Notice("Ação cancelada pelo utilizador.", 5000);
    return;
}

const soAtivosInput = await tp.system.prompt(
    "Listar só pessoas com estado Ativo? (s = só ativos, n = todas)",
    "s"
);
const soAtivos = String(soAtivosInput ?? "s").trim().toLowerCase() !== "n";

// --- Pastas ---------------------------------------------------------------
// Procura ignore-case: o vault tem 'diário' e 'Diário' (e 'tarefas'/'Tarefas')
// misturados, e uma diferença de maiúsculas fazia o script abortar.
async function getFolder(folderPath) {
    const parts = String(folderPath).split("/").filter(Boolean);
    let current = app.vault.getRoot();
    for (let i = 0; i < parts.length; i++) {
        if (!current || !Array.isArray(current.children)) return null;
        const part = parts[i];
        let next = current.children.find(c => c.name.toLowerCase() === part.toLowerCase());
        if (!next) {
            try {
                next = await app.vault.createFolder(parts.slice(0, i + 1).join("/"));
            } catch (e) {
                next = current.children.find(c => c.name.toLowerCase() === part.toLowerCase());
                if (!next) {
                    new Notice(`Erro ao criar a pasta '${folderPath}': ${e.message}`, 5000);
                    return null;
                }
            }
        }
        current = next;
    }
    return current;
}

// --- 1. Registo de Presenças ---------------------------------------------
const presFolder = await getFolder("Equipa/Presenças");
if (!presFolder) {
    new Notice("Abortado: não foi possível abrir 'Equipa/Presenças'.", 5000);
    return;
}

const presFileName = `Presenças - ${obra} - ${date}`;
const presPath = `${presFolder.path}/${presFileName}.md`;

const peopleFolder = await getFolder("Equipa/Pessoas");
let tableRows = "";
let nPessoas = 0;

if (peopleFolder && Array.isArray(peopleFolder.children)) {
    const pessoas = peopleFolder.children
        .filter(f => f.extension === "md")
        .map(f => ({
            file: f,
            estado: String(app.metadataCache.getFileCache(f)?.frontmatter?.estado ?? "").trim().toLowerCase()
        }))
        // Sem estado definido conta como ativo (não escondemos ninguém por engano)
        .filter(p => !soAtivos || p.estado === "ativo" || p.estado === "")
        .sort((a, b) => a.file.basename.localeCompare(b.file.basename, "pt"));

    for (const p of pessoas) {
        tableRows += `| [[${p.file.basename}]] | [ ] | 8 | 0 | [ ] | Por confirmar |\n`;
        nPessoas++;
    }
} else {
    new Notice("Aviso: pasta 'Equipa/Pessoas' não encontrada — tabela de presenças vazia.", 5000);
}

if (nPessoas === 0) {
    new Notice("Aviso: nenhuma pessoa incluída. Reveja o campo 'estado:' nas fichas de Equipa/Pessoas.", 6000);
}

const presContent = `---
tags: equipa, presencas
data: ${date}
obra: "${obra}"
estado: Por confirmar
---
# 📅 Registo de Presenças — ${obra} — ${date}

## 👷 Tabela de Presenças
| Funcionário | Presença | Horas Normais | Horas Extras | Sábado? | Observações |
|-------------|----------|---------------|--------------|---------|-------------|
${tableRows}
${nPessoas > 0 ? "" : "> [!WARNING] Sem pessoas listadas\n> Reveja as fichas em \`Equipa/Pessoas\`.\n"}
> [!TIP] Instruções
> - **Presença**: \`[x]\` para presente, \`[ ]\` para falta — confirme cada pessoa.
> - **Horas**: 8 é o valor por omissão; corrija para quem faltou ou para as horas reais.
> - **Sábado**: marque \`[x]\` se o trabalho foi feito ao sábado.
> - No fim do dia, passe \`estado:\` para \`Confirmado\`.
`;

if (app.vault.getAbstractFileByPath(presPath)) {
    new Notice(`As presenças de ${obra} em ${date} já existem — a manter o ficheiro atual.`, 5000);
} else {
    await tp.file.create_new(presContent, presFileName, false, presFolder);
}

// --- 2. Tarefas do dia ----------------------------------------------------
let listaTarefasMarkdown = "";
if (tarefasInput.trim()) {
    const tarefasArray = tarefasInput.split(",").map(t => t.trim()).filter(Boolean);
    listaTarefasMarkdown = tarefasArray.map(t => {
        const match = t.match(/[@#]([^\s,]+)/);
        if (match) {
            const nome = match[1];
            const tarefaLimpa = t.replace(match[0], "").trim();
            return `- [ ] ${tarefaLimpa} 👤 [[${nome}]]`;
        }
        return `- [ ] ${t}`;
    }).join("\n");
} else {
    listaTarefasMarkdown = "- [ ] Nenhuma tarefa definida.";
}

// --- 3. Diário de Obra ----------------------------------------------------
const diarioFolder = await getFolder("Diário/Diários Diários");
if (!diarioFolder) {
    new Notice("Abortado: não foi possível abrir a pasta do diário.", 5000);
    return;
}

const diarioFileName = `Diário - ${obra} - ${date}`;
const diarioPath = `${diarioFolder.path}/${diarioFileName}.md`;

const diarioContent = `---
tags: diario, obra
data: ${date}
obra: "${obra}"
---
# 📅 Diário de Obra — ${obra} — ${date}

## 📝 Planeamento do Dia
${listaTarefasMarkdown}

## 👷 Equipa em Obra
Ver registo detalhado em: [[${presFileName}|Registo de Presenças]]

## ☀️ Condições Climáticas
- **Temperatura**:
- **Tempo**:

## ✅ Trabalho Concluído
-

## 🚧 Ocorrências / Progresso
-

## 📦 Materiais em Falta
-

## 🔜 Prioridades de Amanhã
-

## 📸 Fotos
-
`;

if (app.vault.getAbstractFileByPath(diarioPath)) {
    new Notice(`O diário de ${obra} em ${date} já existe — a manter o ficheiro atual.`, 5000);
} else {
    await tp.file.create_new(diarioContent, diarioFileName, false, diarioFolder);
}

new Notice(`🌅 Início de Dia criado para ${obra} (${date}): presenças com ${nPessoas} pessoa(s) + diário.`, 6000);
%>
