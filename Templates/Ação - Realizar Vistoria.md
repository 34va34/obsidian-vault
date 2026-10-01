<%*
const catalogPath = "Scripts/catalogo_trabalhos.json";
const catalogFile = app.vault.getAbstractFileByPath(catalogPath);
if (!catalogFile) {
    new Notice(`Não encontrei ${catalogPath}.`, 6000);
    return;
}

const catalogo = JSON.parse(await app.vault.read(catalogFile));
const obra = await tp.system.prompt("Obra");
if (!obra) return;
const lote = await tp.system.prompt("Lote / piso a vistoriar", "ex.: Lote 4 — Piso -1");
if (!lote) return;
const date = tp.date.now("YYYY-MM-DD");

const modo = await tp.system.suggester(
    ["Todos os trabalhos da biblioteca", "Escolher categorias de trabalhos"],
    ["todos", "categorias"],
    false,
    "Que trabalhos quer verificar nesta vistoria?"
);
if (!modo) return;

let trabalhos = catalogo;
if (modo === "categorias") {
    const categorias = [...new Set(catalogo.map(t => t.categoria))];
    const escolhidas = [];
    let escolherMais = true;
    while (escolherMais) {
        const disponiveis = categorias.filter(c => !escolhidas.includes(c));
        if (!disponiveis.length) break;
        const categoria = await tp.system.suggester(
            disponiveis,
            disponiveis,
            false,
            "Escolha uma categoria (Cancelar termina)"
        );
        if (!categoria) break;
        escolhidas.push(categoria);
        escolherMais = await tp.system.suggester(
            ["Sim — escolher outra categoria", "Não — criar vistoria"],
            [true, false],
            false,
            "Quer incluir outra categoria?"
        );
        if (escolherMais === undefined) escolherMais = false;
    }
    if (!escolhidas.length) {
        new Notice("Nenhuma categoria selecionada.", 4000);
        return;
    }
    trabalhos = catalogo.filter(t => escolhidas.includes(t.categoria));
}

const linhasTrabalhos = trabalhos.map(t =>
    `| ${t.categoria} | ${t.nome} | ☐ | ☐ | ☐ | ☐ | |
`
).join("");
const fileName = `Vistoria - ${obra} - ${lote} - ${date}`;

const content = `---
tags: vistoria, qualidade, obra
tipo: vistoria-de-trabalhos
data: ${date}
obra: "${obra}"
lote: "${lote}"
resultado:
trabalhos_biblioteca: true
---
# ✅ Vistoria de Qualidade: ${obra} — ${lote}

> Marque **apenas uma opção por trabalho**. Use as observações para indicar a fração, a casa ou o problema encontrado.

## 🔧 Trabalhos da Biblioteca — verificar neste piso

| Categoria | Trabalho | Feito | Em falta | Com erro | N/A | Observações |
|---|---|:---:|:---:|:---:|:---:|---|
${linhasTrabalhos}

## 📋 Check-list geral
- [ ] Limpeza do local
- [ ] Teste de esgotos / fugas
- [ ] Confirmar medidas dos esgotos
- [ ] Confirmar medidas das águas
- [ ] Confirmar caimento dos esgotos
- [ ] Confirmar kombifixo bem fixo
- [ ] Teste de pressão das águas

## ❌ Não conformidades / correções

| Trabalho relacionado | Problema encontrado | Correção necessária | Responsável | Prazo | Estado |
|---|---|---|---|---|---|
| | | | | | Pendente |

## 💬 Observações do Chefe
- 

## ⚖️ Resultado Final
- [ ] Aprovado
- [ ] Aprovado com observações
- [ ] Reprovado — necessita correção
`;

await tp.file.create_new(content, fileName, false, app.vault.getAbstractFileByPath("Gestão/Vistorias"));
new Notice(`Vistoria criada com ${trabalhos.length} trabalhos para verificar.`, 6000);
%>
