#!/bin/bash

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
  echo "Uso: ./new_project.sh \"Nome do Projeto\""
  exit 1
fi

PROJECT_DIR="/home/ubuntu/obsidian-vault/Obras/$PROJECT_NAME"
TEMPLATE_PATH="/home/ubuntu/obsidian-vault/Templates/Template - Obra Geral.md"

mkdir -p "$PROJECT_DIR"
mkdir -p "$PROJECT_DIR/Lotes"

cp "$TEMPLATE_PATH" "$PROJECT_DIR/$PROJECT_NAME - Geral.md"

sed -i "s/{{project_name}}/$PROJECT_NAME/g" "$PROJECT_DIR/$PROJECT_NAME - Geral.md"

echo "Projeto [32m$PROJECT_NAME[0m criado com sucesso em [34m$PROJECT_DIR[0m"
echo "Pode adicionar lotes em [34m$PROJECT_DIR/Lotes[0m"
