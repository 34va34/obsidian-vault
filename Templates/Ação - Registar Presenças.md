<%*
const obra = await tp.system.prompt("Nome da Obra");
const date = tp.date.now("YYYY-MM-DD");
const fileName = `Presenças - ${obra} - ${date}`;
const folder = "Equipa/Presenças";

// Obter lista de pessoas da pasta Equipa/Pessoas
const peopleFiles = app.vault.getAbstractFileByPath("Equipa/Pessoas").children;
let tableRows = "";

for (const file of peopleFiles) {
    if (file.name.endsWith(".md")) {
        const personName = file.name.replace(".md", "");
        tableRows += `| [[Equipa/Pessoas/${personName}]] | [x] | 8 | 0 | [ ] | |\n`;
    }
}

const content = `---
tags: equipa, presencas
data: ${date}
obra: ${obra}
---
# 📅 Registo de Presenças — ${obra} — ${date}

## 🏗️ Obra: ${obra}

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

await tp.file.create_new(content, fileName, false, app.vault.getAbstractFileByPath(folder));
new Notice(`Registo de presenças criado para ${obra}`, 5000);
%>
