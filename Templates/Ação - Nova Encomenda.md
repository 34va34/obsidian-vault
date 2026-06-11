<%*
const material = await tp.system.prompt("Material a encomendar");
const obra = await tp.system.prompt("Obra de destino");
const date = tp.date.now("YYYY-MM-DD");
const fileName = `${date} Encomenda ${material}`;
const folder = "Material/Encomendas";

const content = `---
tags: material, encomenda
data_pedido: ${date}
data_entrega_prevista: 
status: Pendente
obra: ${obra}
lote: 
responsavel_recepcao: 
---
# 📦 Encomenda — ${material}

## 📋 Info
- **Data Pedido**: ${date}
- **Data Entrega Prevista**: 
- **Status**: Pendente

## 🏢 Destino
- **Obra**: [[${obra}]]
- **Lote**: 
- **Responsável Receção**: 

## 📝 Detalhes do Material

| Material | Quantidade | Unidade | Valor Unit. | Valor Total | Fornecedor |
|----------|-----------|---------|-------------|-------------|------------|
| ${material} |           |         |             |             |            |

## 💰 Valores
- **Subtotal**: 
- **IVA (23%)**: 
- **Total**: 

## 📋 Referência
- **Fatura**: 
- **Guia Remessa**: 
- **Nota de Pedido**: 

## ✅ Receção
- [ ] Material recebido conforme pedido
- [ ] Qualidade verificada
- [ ] Quantidade correta
- [ ] Documentação conferida

## 📝 Notas
`;

await tp.file.create_new(content, fileName, false, app.vault.getAbstractFileByPath(folder));
new Notice(`Encomenda criada: ${material}`, 5000);
%>
