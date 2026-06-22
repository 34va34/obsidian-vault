<%*
const obra = await tp.system.prompt("Obra");
const lote = await tp.system.prompt("Lote/Local");
const descricao = await tp.system.prompt("Descrição da Falha/Problema");
const gravidade = await tp.system.suggester(["Baixa", "Média", "Alta", "Crítica"], ["Baixa", "Média", "Alta", "Crítica"]);
const date = tp.date.now("YYYY-MM-DD");
const fileName = `Falha - ${obra} - ${lote} - ${date}`;

const content = `---
tags: falha, gestao, obra
data: ${date}
obra: "${obra}"
lote: "${lote}"
gravidade: "${gravidade}"
status: Pendente
---
# ⚠️ Falha: ${obra} - ${lote}

## 📝 Descrição
${descricao}

## 🛠️ Plano de Correção
- [ ] Definir responsável
- [ ] Executar correção
- [ ] Validar correção

## 📸 Evidências (Fotos)
- 
`;

await tp.file.create_new(content, fileName, false, app.vault.getAbstractFileByPath("Gestão/Falhas"));
new Notice(`Falha registada para ${obra} - ${lote}`, 5000);
%>
