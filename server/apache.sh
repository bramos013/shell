#!/bin/bash
#Instalando Apache
sudo yum install httpd -y

#Iniciando Apache habilitar boot automático
systemctl start httpd
systemctl enable httpd
