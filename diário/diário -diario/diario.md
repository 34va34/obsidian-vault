// Busca todas as tarefas na nota atual
let tarefas = dv.current().file.tasks;

// Filtra apenas as tarefas que têm alguém atribuído
let pessoas = tarefas
    .map(t => t.atribuido)
    .filter(p => p !== undefined)
    .distinct(); // Remove nomes duplicados

// Exibe a lista de presenças
if (pessoas.length > 0) {
    dv.header(2, "Presenças do Dia");
    dv.list(pessoas);
} else {
    dv.paragraph("*Nenhuma presença registada ainda.*");
}