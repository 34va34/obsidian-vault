---
tags: biblioteca, trabalhos, obra
tipo: biblioteca-de-modelos
---
# 🧰 Biblioteca de Trabalhos Repetíveis

Esta biblioteca reúne trabalhos que já foram realizados ou planeados nas obras anteriores, sobretudo em **Ouro Valley**. Serve para reutilizar a experiência sem copiar datas, responsáveis, estados ou problemas de uma obra antiga.

## Como acrescentar trabalhos a uma obra nova

1. Crie a obra e a nota do lote em `Obras/`.
2. Abra o template [[Templates/Ação - Repetir Trabalhos]] no Obsidian e execute-o com o **Templater**.
3. Escolha a nota do lote ou do piso de destino.
4. Confirme o responsável comum, se existir.
5. Filtre por categoria e escolha um trabalho de cada vez.
6. Acrescente um detalhe quando necessário, por exemplo `piso 2 — 9 casas`.
7. Escolha **Não — criar as tarefas**.

Para cada trabalho escolhido, a ação agora:

- cria uma nota própria em `Tarefas/Reutilizadas/`;
- atribui `obra`, `lote`, `piso`, `estado: Por iniciar` e `trabalho_id`;
- guarda as fontes de experiência e os critérios de conclusão;
- liga a tarefa à nota do lote/piso com uma checkbox clicável;
- mantém a tarefa separada do histórico das obras anteriores.

> A ação nunca copia datas de conclusão, prioridades, equipas ou resultados de vistorias das obras anteriores.

## Como usar os trabalhos numa vistoria

Para verificar um piso, abra [[Templates/Ação - Realizar Vistoria]]. A ação pergunta a obra, o lote/piso e se quer verificar todos os trabalhos ou apenas algumas categorias.

Na vistoria é criada uma tabela ligada à mesma biblioteca, com quatro opções por trabalho:

- **Feito** — o trabalho foi realizado corretamente;
- **Em falta** — ainda não foi realizado;
- **Com erro** — foi realizado, mas precisa de correção;
- **N/A** — não se aplica a esse piso.

Existe ainda uma tabela de **Não conformidades / correções** para registar o problema, a correção, o responsável, o prazo e o estado.

## Catálogo atual

### Preparação
- Furação / abrir carotes
- Partir chão

### Águas / PPR
- Executar prumadas de cozinha e WC
- Executar prumadas de lavandaria
- Executar águas interiores
- Soldar tubos e uniões de PPR
- Fazer transição de PEX para PPR
- Colocar abraçadeiras e suportes
- Colocar curvas de PPR à entrada das casas
- Montar válvula geral

### Esgotos
- Executar esgotos finos
- Executar prumadas de esgotos
- Ligar esgotos às caixas
- Ligar WC fora do sítio

### Testes e acabamento
- Testar esgotos das casas de banho
- Testar instalações do piso
- Executar aranhas / distribuição por fração

### Pluviais
- Iniciar pluviais
- Colocar ralos para desviar água da chuva

### Gestão
- Encomendar materiais

## Origem da biblioteca

Os nomes foram consolidados a partir dos trabalhos encontrados em:

- [[Ouro Valley - Lote 2]]
- [[Ouro Valley - Lote 4]]
- [[Ouro Valley - Lote 5]]
- [[Ouro Valley - Lote 6]]
- [[Next Yard 2 - Geral]]

O catálogo técnico editável está em `Scripts/catalogo_trabalhos.json`. Cada modelo tem um `id` estável, fontes de experiência e critérios de conclusão. Para acrescentar um novo tipo de trabalho, atualize esse ficheiro e a lista acima.

## Regra de utilização

A biblioteca contém **modelos de trabalho**, não o histórico de execução. O histórico continua nas notas dos lotes antigos; cada nova obra recebe uma tarefa nova em `Tarefas/Reutilizadas/`, com o seu próprio piso, detalhe, responsável, datas e estado.
