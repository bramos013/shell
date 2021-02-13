#!/bin/bash

#Informações Site
echo "Informe a URL do Wordpress a ser instalado(Incluir http/https):"
	read wp_url
echo "Título do Site"
	read wp_title

#Conexão MySQL
echo "Host de conexão BD:"
	read wp_dbhost
echo "Base BD"
	read wp_dbbase
echo "Usuário BD"
	read wp_dbuser
echo "Senha BD"
	read wp_dbpass
echo "Prefixo table"
	read wp_dbprefix

#Informações User Admin
echo "Informe o nome de Usuário Admin"
read wp_user
echo "Informe e-mail Usuário"
read wp_email
echo "Informe a senha do Usuário"
read wp_pass
#Download WP versão BR
wp core download --locale=pt_BR
#Configuração arquivo wp-config.php
wp core config --dbhost=$wp_dbhost --dbname=$wp_dbbase --dbuser=$wp_dbuser --dbpass=$wp_dbpass --dbprefix=$wp_dbprefix
#Instalação WP
wp core install --url=$wp_url --title=$wp_title --admin_user=$wp_user --admin_password=$wp_pass --admin_email=$wp_email
#Instalar Thema padrão
wp theme install twentytwenty --activate

#Criar .htaccess padrão
echo >> .htaccess
echo "# BEGIN WordPress" >>/.htaccess
echo "RewriteEngine On" >>/.htaccess
echo "RewriteBase /" >>/.htaccess
echo "RewriteRule ^index\.php$ - [L]" >>/.htaccess
echo "RewriteCond %{REQUEST_FILENAME} !-f" >>/.htaccess
echo "RewriteCond %{REQUEST_FILENAME} !-d" >>/.htaccess
echo "RewriteRule . /index.php [L]" >>/.htaccess
echo "# END WordPress" >>/.htaccess

