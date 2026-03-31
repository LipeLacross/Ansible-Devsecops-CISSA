#!/bin/bash
# install_nginx_bad.sh

# Verifica se precisa de sudo
if [ "$EUID" -ne 0 ]; then
  SUDO="sudo -E"
else
  SUDO=""
fi

echo "Iniciando instalacao..."
# Exporta para garantir que o apt pegue o noninteractive
export DEBIAN_FRONTEND=noninteractive

if [ -n "$SUDO" ]; then
  $SUDO apt-get update
  $SUDO apt-get install nginx -y
else
  apt-get update
  apt-get install nginx -y
fi

echo "Configurando index.html..."
# Garante diretório
mkdir -p /var/www/html
# Simples tee (funciona com ou sem sudo se estruturado assim, mas vamos simplificar)
if [ -n "$SUDO" ]; then
   echo "<h1>Servidor configurado MANUALMENTE</h1>" | sudo tee /var/www/html/index.html > /dev/null
else
   echo "<h1>Servidor configurado MANUALMENTE</h1>" > /var/www/html/index.html
fi

echo "Reiniciando Nginx..."
if [ -n "$SUDO" ]; then
  $SUDO service nginx restart
else
  service nginx restart
fi

echo "Concluido."