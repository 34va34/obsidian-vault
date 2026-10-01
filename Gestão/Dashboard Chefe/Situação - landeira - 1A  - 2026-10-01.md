---
tags: ponto-situacao, progresso, obra
estado: Em andamento
data: 2026-10-01
obra: "landeira"
lote: "1A "
progresso: 1
data_inicio: 2026-10-01
---
# 📈 Ponto de Situação: landeira - 1A 

## 📊 Estado Atual
- **Progresso**: 1%
- **Data de Início**: 2026-10-01
- **Data da Atualização**: 2026-10-01

## 📝 Notas de Progresso
- ligacaoligação dos esgotos prumadas e agua no andar modelo

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
