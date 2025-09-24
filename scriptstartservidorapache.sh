#!/bin/bash

echo "Atualizando o servidor..."
apt update
apt upgrade -y
echo "Finalizado a atualização do servidor..."

echo "Instalando Apache..."
apt install apache2 -v -y
echo "Restart do serviço de apache..."
systemctl restart apache2
echo "Finalizando a instalação do apache..."

echo "Instalando o unzip..."
apt install unzip -v -y
echo "Finalizado a instalação do unzip..."

echo "Download do site a ser alocado no servidor apache..."
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
echo "Copiando os arquivos que foram retirados do zip para dentro do diretório padrão do  servidor apache..."
cp -r /tmp/linux-site-dio-main/* /var/www/html/
echo "Finalizado o processo..."

echo "Obrigado!"
