<%*
const name = await tp.system.prompt("Nome da Pessoa");
const role = await tp.system.prompt("Cargo ou Função");

if (name && role) {
    const folder = "Equipa/Pessoas";
    const fileName = name;
    const filePath = `${folder}/${fileName}.md`;

    // Conteúdo da nota
    const content = `---
tags: pessoa, equipa
nome: ${name}
cargo: ${role}
estado: Ativo
---
# 👤 ${name}

## Contacto
- **Email**: 
- **Telefone**: 

## Funções
- ${role}

## Observações
- 
`;

    // Criar o ficheiro
    await tp.file.create_new(content, fileName, false, app.vault.getAbstractFileByPath(folder));
    
    new Notice(`Pessoa ${name} criada com sucesso!`, 5000);
} else {
    new Notice("Criação cancelada: Nome ou Cargo em falta.", 5000);
}
%>
