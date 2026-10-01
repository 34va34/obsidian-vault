---
tags: biblioteca, trabalhos, obra
tipo: biblioteca-de-modelos
---
# 🧰 Biblioteca de Trabalhos Repetíveis

Esta biblioteca reúne trabalhos que já foram realizados ou planeados nas obras anteriores, sobretudo em **Ouro Valley**. Serve para reutilizar a experiência sem copiar datas, responsáveis, estados ou problemas de uma obra antiga.

## Como acrescentar trabalhos a uma obra nova

1. Crie a obra e a nota do lote em `Obras/`.
2. Abra o template [[Ação - Repetir Trabalhos]] no Obsidian e execute-o com o **Templater**.
3. Escolha a nota do lote de destino.
4. Filtre por categoria e escolha um trabalho de cada vez.
5. Acrescente um detalhe quando necessário, por exemplo `piso 2 — 9 casas`.
6. Escolha **Não — acrescentar agora**. Os trabalhos entram na secção `🔧 Trabalhos a Realizar` como tarefas novas e ficam por iniciar.

> A ação nunca copia datas de conclusão, prioridades, equipas ou responsáveis das obras anteriores.

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

O catálogo técnico editável está em `Scripts/catalogo_trabalhos.json`. Para acrescentar um novo tipo de trabalho, atualize esse ficheiro e a lista acima.

## Regra de utilização

A biblioteca contém **modelos de trabalho**, não o histórico de execução. O histórico continua nas notas dos lotes antigos; cada nova obra deve receber uma tarefa nova, com o seu próprio piso, detalhe, responsável, datas e estado.
