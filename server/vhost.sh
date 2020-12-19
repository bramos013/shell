#!/bin/bash
#Criar Vhost
cd /etc/httpd/conf.d/
echo "Informe o nome do domínio:"
read dominio

echo >> ${dominio}.conf
echo " <VirtualHost *:80>" >>/${dominio}.conf
echo " DocumentRoot "/home/${dominio}/www"" >>/${dominio}.conf
echo " ServerName ${dominio}.tk" >>/${dominio}.conf
echo " ServerAlias www.${dominio}.tk" >>/${dominio}.conf
echo "</VirtualHost>" >>/${dominio}.conf

