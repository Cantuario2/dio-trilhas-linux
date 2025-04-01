#!/bin/bash

echo "Empresa X - Provisionamento do Servidor Web Apache"
echo "ATENÇÃO: Super usuário necessário! Fazendo login como root:"
sudo -i

echo "1. Atualizando servidor:"
apt update -y
echo "----------------------------------------------------"

echo "2. Instalando o Apache 2 e dependências adicionais:"
apt install -y apache2 unzip
echo "----------------------------------------------------"

echo "3. Baixando a aplicação e fazendo a instalação:"
mkdir /tmp
cd /tmp
wget -cd https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
sudo cp -vur linux-site-dio-main/*.* /var/www/html/
cd ..
rm -fR /tmp
echo "----------------------------------------------------"
echo "Instalação concluída!"
echo "----------------- FIM DO SCRIPT --------------------"
