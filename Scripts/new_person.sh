#!/bin/bash

NAME=$1
ROLE=$2

if [ -z "$NAME" ] || [ -z "$ROLE" ]; then
  echo "Uso: ./new_person.sh \"Nome da Pessoa\" \"Cargo/Função\""
  exit 1
fi

PERSON_FILE="/home/ubuntu/obsidian-vault/Equipa/Pessoas/$NAME.md"
TEMPLATE_PATH="/home/ubuntu/obsidian-vault/Templates/Template - Pessoa.md"

if [ -f "$PERSON_FILE" ]; then
  echo "Erro: A nota para [31m$NAME[0m já existe."
  exit 1
fi

cp "$TEMPLATE_PATH" "$PERSON_FILE"

sed -i "s/{{name}}/$NAME/g" "$PERSON_FILE"
sed -i "s/{{role}}/$ROLE/g" "$PERSON_FILE"

echo "Nota para [32m$NAME[0m ([34m$ROLE[0m) criada com sucesso em [34m$PERSON_FILE[0m"
