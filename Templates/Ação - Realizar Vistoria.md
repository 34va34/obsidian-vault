<%*
const obra = await tp.system.prompt("Obra");
const lote = await tp.system.prompt("Lote/Local a Vistoriar");
const date = tp.date.now("YYYY-MM-DD");
const fileName = `Vistoria - ${obra} - ${lote} - ${date}`;

const content = `---
tags: vistoria, qualidade, obra
data: ${date}
obra: "${obra}"
lote: "${lote}"
resultado: 
---
# ✅ Vistoria de Qualidade: ${obra} - ${lote}

## 📋 Check-list de Verificação
- [ ] Limpeza do local
- [ ] Conformidade com o projeto
- [ ] Acabamentos
- [ ] Funcionamento de sistemas (se aplicável)

## 💬 Observações do Chefe
- 

## ⚖️ Resultado Final
- [ ] Aprovado
- [ ] Aprovado com Observações
- [ ] Reprovado (Necessita correção)
`;

await tp.file.create_new(content, fileName, false, app.vault.getAbstractFileByPath("Gestão/Vistorias"));
new Notice(`Vistoria iniciada para ${obra} - ${lote}`, 5000);
%>
