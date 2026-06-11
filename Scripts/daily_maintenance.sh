#!/bin/bash

# Configurações
VAULT_DIR="/home/ubuntu/obsidian-vault"
DATE=$(date +%Y-%m-%d)

echo "🚀 A iniciar manutenção diária do Obsidian - $DATE"

# 1. Sincronização Git
cd "$VAULT_DIR"
echo "📥 A sincronizar com o GitHub..."
git pull origin main --rebase

# 2. Identificar Obras Ativas
# Procura por notas de obra que não estejam concluídas
ACTIVE_WORKS=$(grep -l "estado: Em andamento" Obras/*/*.md | xargs -n 1 basename | sed 's/ - Geral.md//')

for OBRA in $ACTIVE_WORKS; do
    echo "🏗️ A processar obra: $OBRA"
    
    # Criar Diário de Obra se não existir
    DIARIO_FILE="Diário/Diários Diários/Diário - $OBRA - $DATE.md"
    if [ ! -f "$DIARIO_FILE" ]; then
        echo "  📅 A criar Diário de Obra..."
        cp "Templates/Template - Diário de Obra.md" "$DIARIO_FILE"
        sed -i "s/{{date}}/$DATE/g" "$DIARIO_FILE"
        sed -i "s/obra: /obra: $OBRA/g" "$DIARIO_FILE"
    fi
    
    # Criar Registo de Presenças se não existir
    PRESENCA_FILE="Equipa/Presenças/Presenças - $OBRA - $DATE.md"
    if [ ! -f "$PRESENCA_FILE" ]; then
        echo "  ✅ A criar Registo de Presenças..."
        cp "Templates/Template - Registo de Presenças.md" "$PRESENCA_FILE"
        sed -i "s/{{date}}/$DATE/g" "$PRESENCA_FILE"
        sed -i "s/obra: /obra: $OBRA/g" "$PRESENCA_FILE"
    fi
done

# 3. Atualizar Data no Dashboard
echo "📊 A atualizar Dashboard..."
sed -i "s/> Última atualização: .*/> Última atualização: $DATE/" Dashboard.md

# 4. Push Final
echo "📤 A enviar atualizações para o GitHub..."
git add .
git commit -m "Manutenção diária automática - $DATE"
git push origin main

echo "✅ Manutenção concluída com sucesso!"
