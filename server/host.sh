#!/bin/bash

#Configurando Hostname
echo "Informe o Hostname do servidor:"
read host
hostnamectl set-hostname $host

#Configurando TimeZone
timedatectl set-timezone America/Sao_Paulo
hwclock -w

#Configurando Firewall
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload

echo "Hostname Configurado"
echo "Timezone Configurado"
echo "Firewall Configurado"




