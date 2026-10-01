#!/usr/bin/env bash
set -euo pipefail

VAULT_DIR="/home/ubuntu/obsidian-vault"
DATE=$(date +%Y-%m-%d)
cd "$VAULT_DIR"

echo "A iniciar manutenção diária do Obsidian - $DATE"

git pull origin main --rebase
mkdir -p "Diário/Diários Diários" "Equipa/Presenças"

# Processar apenas notas gerais de obras que estejam explicitamente em andamento.
while IFS= read -r -d '' PROJECT_FILE; do
    if ! grep -q '^estado: Em andamento$' "$PROJECT_FILE"; then
        continue
    fi

    OBRA=$(basename "$(dirname "$PROJECT_FILE")")
    echo "A processar obra: $OBRA"

    DIARIO_FILE="Diário/Diários Diários/Diário - $OBRA - $DATE.md"
    if [ ! -f "$DIARIO_FILE" ]; then
        sed -e "s/{{date}}/$DATE/g" \
            -e "s/{{obra}}/$OBRA/g" \
            -e 's/{{lote}}//g' \
            -e 's/{{piso}}//g' \
            "Templates/Template - Diário de Obra.md" > "$DIARIO_FILE"
        echo "  Diário criado: $DIARIO_FILE"
    fi

    PRESENCA_FILE="Equipa/Presenças/Presenças - $OBRA - $DATE.md"
    if [ ! -f "$PRESENCA_FILE" ]; then
        sed -e "s/{{date}}/$DATE/g" \
            -e "s/{{obra}}/$OBRA/g" \
            -e 's/{{lote}}//g' \
            "Templates/Template - Registo de Presenças.md" > "$PRESENCA_FILE"
        echo "  Presenças criadas para confirmação: $PRESENCA_FILE"
    fi
done < <(find Obras -mindepth 2 -maxdepth 2 -type f -name '* - Geral.md' -print0 | sort -z)

if [ -f Dashboard.md ]; then
    sed -i "s/^> Última atualização: .*/> Última atualização: $DATE/" Dashboard.md
fi

if git diff --quiet; then
    echo "Nenhuma alteração para sincronizar."
    exit 0
fi

git add .
git commit -m "Manutenção diária automática - $DATE"
git push origin main
echo "Manutenção concluída com sucesso."
