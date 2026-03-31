#!/bin/bash
# script_ruim.sh
# Objetivo: Adicionar um aviso ao MOTD (Message of the Day)

TARGET_FILE="/etc/motd"

# Verifica se precisa de sudo (se não for root)
if [ "$EUID" -ne 0 ]; then
  SUDO="sudo"
else
  SUDO=""
fi

echo "--- ATUALIZANDO MOTD (MODO MANUAL) ---"

# Cria o arquivo se não existir (comum em containers minimais)
if [ ! -f "$TARGET_FILE" ]; then
  $SUDO touch "$TARGET_FILE"
fi

# O Problema: Append cego (>>)
echo "BEM-VINDO AO CURSO DE ANSIBLE" | $SUDO tee -a "$TARGET_FILE" > /dev/null

echo "FIM DA ATUALIZACAO"
echo "Conteúdo atual de $TARGET_FILE:"
cat "$TARGET_FILE"