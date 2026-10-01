<%*
// Biblioteca de trabalhos reutilizáveis para acrescentar tarefas novas a um lote.
const catalogPath = "Scripts/catalogo_trabalhos.json";
const catalogFile = app.vault.getAbstractFileByPath(catalogPath);
if (!catalogFile) {
    new Notice(`Não encontrei ${catalogPath}.`, 6000);
    return;
}

const catalogo = JSON.parse(await app.vault.read(catalogFile));
const lotes = app.vault.getMarkdownFiles()
    .filter(f => f.path.startsWith("Obras/") && !f.path.includes(" - Geral.md") && !f.path.includes("/Lotes/") || f.path.startsWith("Obras/") && f.path.includes("/Lotes/") && !f.path.includes("/Pisos/"))
    .sort((a, b) => a.path.localeCompare(b.path, "pt"));

if (!lotes.length) {
    new Notice("Não encontrei notas de lotes dentro de Obras/.", 6000);
    return;
}

const lote = await tp.system.suggester(
    lotes.map(f => f.path.replace(/^Obras\//, "")),
    lotes,
    false,
    "Escolha o lote onde quer repetir trabalhos"
);
if (!lote) return;

const grupos = [...new Set(catalogo.map(t => t.categoria))];
const escolhidos = [];
let continuar = true;
while (continuar) {
    const categoria = await tp.system.suggester(
        ["Todas as categorias", ...grupos],
        ["__todas__", ...grupos],
        false,
        "Filtre os trabalhos por categoria"
    );
    if (!categoria) break;

    const disponiveis = catalogo.filter(t => categoria === "__todas__" || t.categoria === categoria);
    const trabalho = await tp.system.suggester(
        disponiveis.map(t => `${t.nome} — ${t.categoria}`),
        disponiveis,
        false,
        "Escolha um trabalho (Cancelar termina)"
    );
    if (!trabalho) break;

    const detalhe = await tp.system.prompt(
        `Detalhe opcional para «${trabalho.nome}» (ex.: piso 2, 9 casas; deixe vazio se não se aplicar)`
    );
    escolhidos.push({ ...trabalho, detalhe: (detalhe || "").trim() });

    continuar = await tp.system.suggester(
        ["Sim — escolher outro", "Não — acrescentar agora"],
        [true, false],
        false,
        "Quer repetir mais algum trabalho?"
    );
    if (continuar === undefined) continuar = false;
}

if (!escolhidos.length) {
    new Notice("Nenhum trabalho selecionado.", 4000);
    return;
}

let conteudo = await app.vault.read(lote);
const linhas = escolhidos.map(t => {
    const titulo = t.detalhe ? `${t.nome} — ${t.detalhe}` : t.nome;
    return `- [ ] ${titulo}`;
});

// Insere na secção existente, antes da próxima secção de segundo nível.
const inicio = conteudo.search(/^## 🔧 Trabalhos a Realizar\s*$/m);
if (inicio >= 0) {
    const depoisDoTitulo = inicio + conteudo.slice(inicio).indexOf("\n") + 1;
    const proximaSecaoRel = conteudo.slice(depoisDoTitulo).search(/^## /m);
    const fim = proximaSecaoRel >= 0 ? depoisDoTitulo + proximaSecaoRel : conteudo.length;
    const bloco = "\n" + linhas.join("\n") + "\n";
    conteudo = conteudo.slice(0, fim).replace(/\n*$/, "\n") + bloco + conteudo.slice(fim);
} else {
    conteudo = conteudo.replace(/\s*$/, "\n\n## 🔧 Trabalhos a Realizar\n" + linhas.join("\n") + "\n");
}

await app.vault.modify(lote, conteudo);
new Notice(`${linhas.length} trabalho(s) acrescentado(s) a ${lote.basename}.`, 6000);
%>
