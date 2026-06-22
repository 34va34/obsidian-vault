<%*
const obra = await tp.system.prompt("Nome da Obra");
const date = tp.date.now("YYYY-MM-DD");
const fileName = `Presenças - ${obra} - ${date}`;
const folderPath = "Equipa/Presenças";

const peopleFolder = app.vault.getAbstractFileByPath("Equipa/Pessoas");
let tableRows = "";

if (peopleFolder && peopleFolder instanceof tp.obsidian.TFolder) {
    const peopleFiles = peopleFolder.children
        .filter(f => f instanceof tp.obsidian.TFile && f.extension === "md")
        .sort((a, b) => a.basename.localeCompare(b.basename));

    for (const file of peopleFiles) {
        tableRows += `| [[${file.basename}]] | [x] | 8 | 0 | [ ] | |\n`;
    }
}

const content = `---
tags: equipa, presencas
data: ${date}
obra: "${obra}"
---
# 📅 Registo de Presenças — ${obra} — ${date}

## 👷 Tabela de Presenças
| Funcionário | Presença | Horas Normais | Horas Extras | Sábado? | Observações |
|-------------|----------|---------------|--------------|---------|-------------|
${tableRows}

## 📊 Resumo do Dia
- **Total de Funcionários**: 
- **Total Horas Extras**: 
- **Trabalho Especial**: 

## 📝 Notas Gerais
`;

const targetFolder = app.vault.getAbstractFileByPath(folderPath);
await tp.file.create_new(content, fileName, false, targetFolder);
new Notice(`Registo de presenças criado para ${obra}`, 5000);
%>
