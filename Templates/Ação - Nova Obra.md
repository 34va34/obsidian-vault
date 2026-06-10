<%*
const projectName = await tp.system.prompt("Nome da Nova Obra");

if (projectName) {
    const baseFolder = "Obras";
    const projectFolder = `${baseFolder}/${projectName}`;
    const lotesFolder = `${projectFolder}/Lotes`;
    
    // Criar as pastas (requer que o utilizador tenha o plugin Templater configurado para permitir criação de pastas ou usar a API do Obsidian)
    await app.vault.createFolder(projectFolder).catch(() => {});
    await app.vault.createFolder(lotesFolder).catch(() => {});

    const fileName = `${projectName} - Geral`;
    
    // Conteúdo da nota principal
    const content = `---
tags: obra, geral, projeto
data_inicio: ${tp.date.now("YYYY-MM-DD")}
status: Planeado
---
# 🏗️ Obra: ${projectName}

## 📋 Informações Gerais
- **Data de Início**: ${tp.date.now("YYYY-MM-DD")}
- **Status**: Planeado
- **Localização**: 
- **Cliente**: 

## 📝 Descrição do Projeto

## 👥 Equipa Envolvida
- 

## 📅 Cronograma
- **Fase 1**: 
- **Fase 2**: 

## 💰 Orçamento
- **Estimativa Inicial**: 
- **Custos Atuais**: 

## 🔗 Links Relevantes
- [[Dashboard]]

## 🚧 Notas
`;

    // Criar o ficheiro dentro da pasta do projeto
    await tp.file.create_new(content, fileName, false, app.vault.getAbstractFileByPath(projectFolder));
    
    new Notice(`Obra ${projectName} criada com sucesso!`, 5000);
} else {
    new Notice("Criação cancelada: Nome da obra em falta.", 5000);
}
%>
