---
tags: ponto-situacao, progresso, obra
estado: Em andamento
data: 2026-10-02
obra: "lavandeira"
lote: "null"
progresso: 1
data_inicio: 2026-10-02
---
# 📈 Ponto de Situação: lavandeira - null

## 📊 Estado Atual
- **Progresso**: 1%
- **Data de Início**: 2026-10-02
- **Data da Atualização**: 2026-10-02

## 📝 Notas de Progresso
- 

## ⏳ Estimativa de Término
```dataviewjs
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
```
