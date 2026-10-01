<%*
// Gera um fecho de cobrança do ciclo do dia 20 ao dia 20.
function pad(n) { return String(n).padStart(2, "0"); }
function localIso(date) {
    return `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())}`;
}
function text(value) {
    if (value === undefined || value === null) return "";
    if (Array.isArray(value)) return value.join(", ");
    return String(value);
}
function cell(value) {
    return text(value).replace(/\|/g, "\\|").replace(/\n/g, " ");
}
function amount(value) {
    let raw = text(value).trim().replace(/[^0-9,.-]/g, "");
    if (!raw) return null;
    if (raw.includes(",")) raw = raw.replace(/\./g, "").replace(",", ".");
    const parsed = Number(raw);
    return Number.isFinite(parsed) ? parsed : null;
}
function money(value) {
    if (value === null || value === undefined || value === "") return "por confirmar";
    const n = amount(value);
    return n === null ? text(value) : `${n.toFixed(2).replace(".", ",")} €`;
}

const hoje = new Date();
let fim = new Date(hoje.getFullYear(), hoje.getMonth(), 20);
let inicio;
if (hoje.getDate() >= 20) {
    inicio = new Date(fim.getFullYear(), fim.getMonth(), 20);
    fim = new Date(fim.getFullYear(), fim.getMonth() + 1, 20);
} else {
    inicio = new Date(fim.getFullYear(), fim.getMonth() - 1, 20);
}
const periodoInicio = localIso(inicio);
const periodoFim = localIso(fim);

const files = app.vault.getMarkdownFiles().filter(file => file.path.startsWith("Tarefas/"));
const records = files.map(file => ({ file, fm: app.metadataCache.getFileCache(file)?.frontmatter || {} }));
const obras = [...new Set(records.map(r => text(r.fm.obra).trim()).filter(Boolean))].sort((a, b) => a.localeCompare(b, "pt"));
const obraEscolhida = await tp.system.suggester(
    ["Todas as obras", ...obras],
    ["", ...obras],
    false,
    "Escolha a obra para o fecho 20–20"
);
if (obraEscolhida === undefined) return;

const responsavel = await tp.system.prompt("Responsável pelo levantamento", "");
const selecionados = records.filter(record => {
    const fm = record.fm;
    const estado = text(fm.estado).trim().toLowerCase();
    const dataFim = text(fm.data_fim || fm.data_conclusao).slice(0, 10);
    const obra = text(fm.obra).trim();
    const concluida = ["concluído", "concluido", "feito", "executado"].includes(estado);
    const dentroDoPeriodo = dataFim >= periodoInicio && dataFim <= periodoFim;
    const mesmaObra = !obraEscolhida || obra.toLowerCase() === obraEscolhida.toLowerCase();
    return concluida && dentroDoPeriodo && mesmaObra;
});

const semData = records.filter(record => {
    const estado = text(record.fm.estado).trim().toLowerCase();
    const obra = text(record.fm.obra).trim();
    const concluida = ["concluído", "concluido", "feito", "executado"].includes(estado);
    const mesmaObra = !obraEscolhida || obra.toLowerCase() === obraEscolhida.toLowerCase();
    return concluida && !text(record.fm.data_fim || record.fm.data_conclusao) && mesmaObra;
});

const linhas = selecionados.map(record => {
    const fm = record.fm;
    const valor = amount(fm.valor_a_cobrar);
    return {
        obra: text(fm.obra) || "Por preencher",
        lote: text(fm.lote),
        piso: text(fm.piso),
        trabalho: text(fm.trabalho_modelo) || record.file.basename,
        quantidade: text(fm.quantidade_executada),
        unidade: text(fm.unidade),
        data: text(fm.data_fim || fm.data_conclusao),
        valor,
        valorTexto: money(fm.valor_a_cobrar),
        link: `[[${record.file.path}|${record.file.basename}]]`
    };
});
const total = linhas.reduce((sum, row) => sum + (row.valor || 0), 0);
const valoresPorConfirmar = linhas.filter(row => row.valor === null).length;
const locais = [...new Set(linhas.map(row => [row.lote, row.piso ? `Piso ${row.piso}` : ""].filter(Boolean).join(" — ")).filter(Boolean))];
const nomeObra = obraEscolhida || "Todas as obras";
const nomeSeguro = nomeObra.normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/[^a-zA-Z0-9]+/g, "-").replace(/^-|-$/g, "").toLowerCase() || "todas-as-obras";
const folderPath = "Gestão/Relatórios/Cobrança 20-20";
let folder = app.vault.getAbstractFileByPath(folderPath);
if (!folder) {
    await app.vault.createFolder(folderPath);
    folder = app.vault.getAbstractFileByPath(folderPath);
}
let fileName = `Fecho de Cobrança 20-20 - ${nomeSeguro} - ${periodoFim}`;
let contador = 2;
while (app.vault.getAbstractFileByPath(`${folderPath}/${fileName}.md`)) {
    fileName = `Fecho de Cobrança 20-20 - ${nomeSeguro} - ${periodoFim} (${contador++})`;
}

const tableRows = linhas.length
    ? linhas.map(row => `| ${cell(row.obra)} | ${cell(row.lote)} | ${cell(row.piso)} | ${cell(row.trabalho)} | ${cell(row.quantidade)} | ${cell(row.unidade)} | ${row.data} | ${row.valorTexto} | ${row.link} |`).join("\n")
    : "| | | | Nenhum trabalho concluído com data neste período | | | | | |";
const messageRows = linhas.length
    ? linhas.map((row, index) => `${index + 1}. ${row.trabalho}${row.lote ? ` — ${row.lote}` : ""}${row.piso ? ` — Piso ${row.piso}` : ""} — ${row.quantidade || "quantidade por confirmar"}${row.unidade ? ` ${row.unidade}` : ""} — ${row.valorTexto}`).join("\n")
    : "- Não foram encontradas tarefas concluídas com data neste período; confirmar os registos.";
const localText = locais.length ? locais.join(", ") : "Por preencher";
const warning = semData.length ? `\n\n⚠️ Existem ${semData.length} tarefa(s) concluída(s) sem data de conclusão. Rever antes de enviar.` : "";

const content = `---
tags: relatorio, cobranca, obra
tipo: fecho-cobranca-20-20
periodo_inicio: ${periodoInicio}
periodo_fim: ${periodoFim}
obra: ${JSON.stringify(nomeObra)}
lotes: ${JSON.stringify(localText)}
responsavel: ${JSON.stringify(responsavel || "")}
estado: Por validar
valor_total: ${total.toFixed(2)}
linhas_com_valor: ${linhas.filter(row => row.valor !== null).length}
valores_por_confirmar: ${valoresPorConfirmar}
data_criacao: ${localIso(hoje)}
data_envio:
---
# 💰 Fecho de Cobrança 20–20 — ${nomeObra}

> **Período:** ${periodoInicio} a ${periodoFim}  
> **Estado:** Por validar — rever quantidades, valores e evidências antes de enviar.

## 📊 Resumo
- **Obra:** ${nomeObra}
- **Lotes / pisos encontrados:** ${localText}
- **Trabalhos concluídos encontrados:** ${linhas.length}
- **Valor total calculado:** ${total.toFixed(2).replace(".", ",")} €
- **Valores por confirmar:** ${valoresPorConfirmar}
- **Tarefas concluídas sem data:** ${semData.length}

## ✅ Trabalhos executados no período

| Obra | Lote | Piso | Trabalho executado | Quantidade | Unidade | Data de conclusão | Valor a cobrar | Tarefa / evidência |
|---|---|---|---|---:|---|---|---:|---|
${tableRows}

## 📱 Mensagem WhatsApp — copiar depois de validar

\`\`\`text
Bom dia,

Segue o resumo dos trabalhos executados no período de ${periodoInicio} a ${periodoFim}.

Obra: ${nomeObra}
Lotes / pisos: ${localText}

Trabalhos executados:
${messageRows}

Total a considerar para cobrança: ${total.toFixed(2).replace(".", ",")} €${warning}

As tarefas e evidências estão registadas no Vault. Aguardo validação para avançar com a cobrança.

Obrigado.
\`\`\`

## ✉️ Modelo de e-mail

**Assunto:** Fecho de obra 20–20 — ${nomeObra} — ${periodoInicio} a ${periodoFim}

\`\`\`text
Bom dia,

Envio o fecho dos trabalhos executados na obra ${nomeObra}, relativo ao período de ${periodoInicio} a ${periodoFim}.

Lotes / pisos abrangidos: ${localText}

Resumo dos trabalhos:
${messageRows}

Valor total proposto para cobrança: ${total.toFixed(2).replace(".", ",")} €

Valores ou quantidades ainda por confirmar: ${valoresPorConfirmar}

O detalhe dos trabalhos e respetivas evidências encontra-se registado no Vault.

Fico a aguardar a validação.

Cumprimentos,
${responsavel || "[Nome]"}
\`\`\`

## 🔎 Validação antes do envio

- [ ] O período é exatamente do dia 20 ao dia 20.
- [ ] Só estão incluídos trabalhos efetivamente executados.
- [ ] Cada linha tem obra, lote ou piso e data de conclusão.
- [ ] As quantidades estão confirmadas.
- [ ] As unidades estão preenchidas.
- [ ] Os valores foram revistos.
- [ ] Os trabalhos com problemas estão identificados.
- [ ] As fotografias, vistorias ou notas de suporte estão disponíveis.
- [ ] O patrão validou o valor final.

## ⚠️ Registos a rever antes do envio

${semData.length ? semData.map(record => "- " + record.file.path + " — concluído sem data_fim").join("\n") : "- Nenhuma tarefa concluída sem data foi encontrada."}

## 📝 Observações internas

- 
`;

await tp.file.create_new(content, fileName, false, folder);
new Notice(`Fecho 20–20 criado: ${fileName}`, 7000);
%>
