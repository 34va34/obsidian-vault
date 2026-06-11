<%*
const obra = await tp.system.prompt("Nome da Obra");
const week = tp.date.now("gggg-[W]ww");
const fileName = `Mapa Semanal - ${obra} - ${week}`;
const folder = "Equipa/Presenças";

// Obter lista de pessoas
const peopleFiles = app.vault.getAbstractFileByPath("Equipa/Pessoas").children;
let tableRows = "";

for (const file of peopleFiles) {
    if (file.name.endsWith(".md")) {
        const personName = file.name.replace(".md", "");
        tableRows += `| [[Equipa/Pessoas/${personName}|${personName}]] | [x] | [x] | [x] | [x] | [x] | [ ] | 40 | 0 |\n`;
    }
}

const content = `---
tags: equipa, presencas, semanal
semana: ${week}
obra: ${obra}
---
# 📅 Mapa de Presenças Semanal — ${obra} — ${week}

## 🏗️ Obra: ${obra}

## 👷 Registo de Presenças (Segunda a Sábado)

| Funcionário | Seg | Ter | Qua | Qui | Sex | Sáb | Total Horas | Extras |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
${tableRows}

---
## 📊 Resumo Semanal
- **Total Horas Equipa**: 
- **Total Horas Extras**: 

## 📝 Notas da Semana
- 
`;

await tp.file.create_new(content, fileName, false, app.vault.getAbstractFileByPath(folder));
new Notice(`✅ Mapa Semanal criado para ${obra}`, 5000);
%>
