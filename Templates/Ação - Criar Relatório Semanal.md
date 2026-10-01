<%*
const templatePath = "Gestão/Relatórios/Relatório Semanal de Obras.md";
const template = app.vault.getAbstractFileByPath(templatePath);
if (!template) {
    new Notice(`Não encontrei ${templatePath}.`, 6000);
    return;
}

const semana = tp.date.now("gggg-[W]WW");
const data = tp.date.now("YYYY-MM-DD");
const folderPath = "Gestão/Relatórios/Semanais";
let folder = app.vault.getAbstractFileByPath(folderPath);
if (!folder) {
    await app.vault.createFolder(folderPath);
    folder = app.vault.getAbstractFileByPath(folderPath);
}

let nome = `Relatório Semanal de Obras - ${semana}`;
let contador = 2;
while (app.vault.getAbstractFileByPath(`${folderPath}/${nome}.md`)) {
    nome = `Relatório Semanal de Obras - ${semana} (${contador++})`;
}

let content = await app.vault.read(template);
content = content
    .replaceAll("{{date:gggg-[W]WW}}", semana)
    .replaceAll("{{date}}", data);

await tp.file.create_new(content, nome, false, folder);
new Notice(`Relatório semanal criado: ${nome}`, 6000);
%>
