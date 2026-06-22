<%*
const obra = await tp.system.prompt("Obra");
const lote = await tp.system.prompt("Lote/Tarefa");
const progresso = await tp.system.prompt("Progresso Atual (%)", "0");
const dataInicio = await tp.system.prompt("Data de Início (YYYY-MM-DD)", tp.date.now("YYYY-MM-DD"));
const date = tp.date.now("YYYY-MM-DD");

const content = `---
tags: ponto-situacao, progresso, obra
data: ${date}
obra: "${obra}"
lote: "${lote}"
progresso: ${progresso}
data_inicio: ${dataInicio}
---
# 📈 Ponto de Situação: ${obra} - ${lote}

## 📊 Estado Atual
- **Progresso**: ${progresso}%
- **Data de Início**: ${data_inicio}
- **Data da Atualização**: ${date}

## 📝 Notas de Progresso
- 

## ⏳ Estimativa de Término
\`\`\`dataviewjs
const p = dv.current().progresso;
const inicio = moment(dv.current().data_inicio);
const hoje = moment(dv.current().data);
const diasPassados = hoje.diff(inicio, 'days') + 1;

if (p > 0 && p < 100) {
    const diasTotaisEst = Math.round((diasPassados * 100) / p);
    const diasRestantes = diasTotaisEst - diasPassados;
    const dataFim = moment(hoje).add(diasRestantes, 'days').format('YYYY-MM-DD');
    dv.paragraph("🎯 **Estimativa de Conclusão**: " + dataFim + " (" + diasRestantes + " dias restantes)");
} else if (p == 100) {
    dv.paragraph("✅ **Tarefa Concluída!**");
} else {
    dv.paragraph("⚠️ Sem dados suficientes para calcular estimativa.");
}
\`\`\`
`;

await tp.file.create_new(content, `Situação - ${obra} - ${lote} - ${date}`, false, app.vault.getAbstractFileByPath("Gestão/Dashboard Chefe"));
new Notice(`Ponto de situação registado.`, 5000);
%>
