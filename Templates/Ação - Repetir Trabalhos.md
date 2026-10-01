<%*
// Aplicar modelos de trabalhos a um lote ou piso, criando tarefas rastreáveis.
const catalogPath = "Scripts/catalogo_trabalhos.json";
const catalogFile = app.vault.getAbstractFileByPath(catalogPath);
if (!catalogFile) {
    new Notice(`Não encontrei ${catalogPath}.`, 6000);
    return;
}

const catalogo = JSON.parse(await app.vault.read(catalogFile));
const targets = app.vault.getMarkdownFiles()
    .filter(f => f.path.startsWith("Obras/") && !f.path.includes(" - Geral.md"))
    .sort((a, b) => a.path.localeCompare(b.path, "pt"));

if (!targets.length) {
    new Notice("Não encontrei notas de lotes ou pisos dentro de Obras/.", 6000);
    return;
}

function metadata(file) {
    return app.metadataCache.getFileCache(file)?.frontmatter || {};
}
function label(file) {
    const fm = metadata(file);
    const parts = [fm.obra, fm.lote, fm.piso ? `Piso ${fm.piso}` : ""].filter(Boolean);
    return `${parts.length ? parts.join(" — ") : file.basename}  ·  ${file.path}`;
}
function yaml(value) {
    return JSON.stringify(value ?? "");
}
function slug(value) {
    return String(value || "geral")
        .normalize("NFD").replace(/[\u0300-\u036f]/g, "")
        .toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "");
}
async function ensureFolder(path) {
    let folder = app.vault.getAbstractFileByPath(path);
    if (!folder) {
        await app.vault.createFolder(path);
        folder = app.vault.getAbstractFileByPath(path);
    }
    return folder;
}

const target = await tp.system.suggester(
    targets.map(label),
    targets,
    false,
    "Escolha o lote ou piso onde quer reutilizar trabalhos"
);
if (!target) return;

const targetMeta = metadata(target);
const obra = targetMeta.obra || await tp.system.prompt("Obra", "");
if (!obra) return;
const lote = targetMeta.lote || await tp.system.prompt("Lote (opcional)", "");
const piso = targetMeta.piso ?? await tp.system.prompt("Piso (opcional)", "");
const responsavel = await tp.system.prompt("Responsável comum (opcional)", "");
const data = tp.date.now("YYYY-MM-DD");

const categorias = [...new Set(catalogo.map(t => t.categoria))];
const escolhidos = [];
while (true) {
    const categoria = await tp.system.suggester(
        ["Todas as categorias", ...categorias],
        ["__todas__", ...categorias],
        false,
        "Filtre os trabalhos (Cancelar termina)"
    );
    if (!categoria) break;

    const disponiveis = catalogo.filter(t =>
        (categoria === "__todas__" || t.categoria === categoria) &&
        !escolhidos.some(escolhido => escolhido.id === t.id)
    );
    if (!disponiveis.length) {
        new Notice("Já escolheu todos os trabalhos desta categoria.", 3000);
        continue;
    }

    const trabalho = await tp.system.suggester(
        disponiveis.map(t => `${t.nome} — ${t.categoria}`),
        disponiveis,
        false,
        "Escolha um trabalho (Cancelar termina)"
    );
    if (!trabalho) break;

    const detalhe = await tp.system.prompt(
        `Detalhe de «${trabalho.nome}» (ex.: 9 casas, frações A e B)`,
        ""
    );
    escolhidos.push({ ...trabalho, detalhe: (detalhe || "").trim() });

    const continuar = await tp.system.suggester(
        ["Sim — escolher outro", "Não — criar as tarefas"],
        [true, false],
        false,
        "Quer reutilizar outro trabalho?"
    );
    if (continuar !== true) break;
}

if (!escolhidos.length) {
    new Notice("Nenhum trabalho selecionado.", 4000);
    return;
}

const taskFolderPath = "Tarefas/Reutilizadas";
const taskFolder = await ensureFolder(taskFolderPath);
const taskLinks = [];
let conteudoAlvo = await app.vault.read(target);

for (const trabalho of escolhidos) {
    const titulo = trabalho.detalhe ? `${trabalho.nome} — ${trabalho.detalhe}` : trabalho.nome;
    const baseName = `Tarefa - ${trabalho.id} - ${slug(obra)} - ${slug(lote || "geral")}${piso !== "" ? ` - piso-${slug(piso)}` : ""}`;
    let fileName = baseName;
    let suffix = 2;
    while (app.vault.getAbstractFileByPath(`${taskFolderPath}/${fileName}.md`)) {
        fileName = `${baseName}-${suffix++}`;
    }

    const criterios = (trabalho.criterios_conclusao || ["Trabalho concluído no local indicado", "Resultado verificado"])
        .map(item => `- [ ] ${item}`).join("\n");
    const taskContent = `---
tags: tarefa, trabalho, trabalho-reutilizado
tipo: tarefa-trabalho
estado: Por iniciar
data_criacao: ${data}
data_limite:
obra: ${yaml(obra)}
lote: ${yaml(lote)}
piso: ${yaml(piso)}
responsavel: ${yaml(responsavel)}
trabalho_id: ${yaml(trabalho.id)}
trabalho_modelo: ${yaml(trabalho.nome)}
origem_modelo: Biblioteca de Trabalhos
fontes_modelo: ${JSON.stringify(trabalho.fontes || [])}
---
# 📝 ${titulo}

> Trabalho reutilizado da [[Biblioteca de Trabalhos]]. Esta é uma tarefa nova para esta obra.

## 📍 Local
- **Obra**: ${obra}
- **Lote**: ${lote || ""}
- **Piso**: ${piso || ""}

## 🔧 Trabalho
- **Modelo**: ${trabalho.nome}
- **Categoria**: ${trabalho.categoria}
- **Descrição**: ${trabalho.descricao}
- **Fontes de experiência**: ${(trabalho.fontes || []).join(", ")}

## ✅ Critérios de conclusão
${criterios}

## ⏱️ Execução
| Data de início | Data de fim | Tempo gasto | Responsável | Estado |
|---|---|---:|---|---|
| | | | ${responsavel || ""} | Por iniciar |

## 📝 Notas e evidências
-
`;

    await tp.file.create_new(taskContent, fileName, false, taskFolder);
    taskLinks.push(`- [ ] [[${taskFolderPath}/${fileName}|${titulo}]]`);
}

// Insere links para as tarefas na secção operacional da nota de lote/piso.
const headings = ["## 🔧 Trabalhos a Realizar", "## 🔨 O que está por fazer"];
let sectionStart = -1;
let sectionTitle = "## 🔧 Trabalhos reutilizados";
for (const heading of headings) {
    const candidate = conteudoAlvo.search(new RegExp(`^${heading.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")}\\s*$`, "m"));
    if (candidate >= 0) {
        sectionStart = candidate;
        sectionTitle = heading;
        break;
    }
}
if (sectionStart >= 0) {
    const afterTitle = sectionStart + conteudoAlvo.slice(sectionStart).indexOf("\n") + 1;
    const nextSection = conteudoAlvo.slice(afterTitle).search(/^## /m);
    const sectionEnd = nextSection >= 0 ? afterTitle + nextSection : conteudoAlvo.length;
    const insert = "\n" + taskLinks.join("\n") + "\n";
    conteudoAlvo = conteudoAlvo.slice(0, sectionEnd).replace(/\n*$/, "\n") + insert + conteudoAlvo.slice(sectionEnd);
} else {
    conteudoAlvo = conteudoAlvo.replace(/\s*$/, "\n\n") + `${sectionTitle}\n${taskLinks.join("\n")}\n`;
}
await app.vault.modify(target, conteudoAlvo);

new Notice(`${taskLinks.length} tarefa(s) criada(s) e ligada(s) a ${target.basename}.`, 7000);
%>
