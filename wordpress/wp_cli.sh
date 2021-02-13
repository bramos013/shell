#!/bin/bash
#Mostrar Programa Iniciando
echo "Iniciando WP-cli..."
echo ""
sleep 1
#Banner
menu ()
{
while true $x != "teste"
do
echo "==================================================="
echo -e "\e[32;1m
 ____  ____  ____  ____  ____  ____ 
||W ||||P ||||- ||||C ||||L ||||I ||
||__||||__||||__||||__||||__||||__||
|/__\||/__\||/__\||/__\||/__\||/__\|  
\e[m"
echo "==================================================="

#Autor
echo -e "|Criado por \e[33;1mBruno Ramos\e[m|"

#Mostrar Menu
echo "=============================="
echo -e "\e[36;1m1\e[m)Reinstalar Wordpress"
echo -e "\e[36;1m2\e[m)Reinstalar Plugins"
echo -e "\e[36;1m3\e[m)Fazer Backup Mysql"
echo -e "\e[36;1m4\e[m)Criar Usuário Suporte"
echo -e "\e[36;1m5\e[m)Alterar Url Base"
echo -e "\e[36;1m6\e[m)Inserir Regra do Varnish+SSL"
echo -e "\e[31;1m0\e[m)Encerrar Programa!"
echo "=============================="

echo "Digite a opção desejada:"
read x
echo "Opção informada ($x)"
echo "================================================"

case "$x" in

    1)
      echo "Atualizando Core Wordpress"
      wp core download --version=$(wp core version) --locale=pt_BR --force 
      sleep 3

echo "================================================"
;;
    2)
      echo "Reinstalando plugins"
      wp plugin install $(wp plugin list --field=name) --force
      sleep 3
echo "================================================"
;;
   3)
      echo "Fazendo Backup do Mysql"
      wp db export
      sleep 3
echo "================================================"
;;
    4)
       echo "Informe o nome do usuário"
       read user
       echo "Informe o seu e-mail"
       read email
       echo "Informe a Senha"
       read senha
       wp user create $user $email --role=administrator --user_pass=$senha

       echo "
	     Usuário $user Criado
       	     Usuario = $user
       	     Senha = $senha
       "

       sleep 3
echo "================================================"
;;
    5)
       echo "Informe a url atual:"
       read url_atual
       echo "Informe a nova url:"
       read url_nova
       wp search-replace $url_atual $url_nova --all-tables
       sleep 3
echo "================================================"
;;
    6)
       sed -i "2i\ // SSL + Varnish" wp-config.php
       sed -i "3i\ define('FORCE_SSL_LOGIN', true);" wp-config.php	
       sed -i "4i\ define('FORCE_SSL_ADMIN', true);" wp-config.php
       sed -i "5i\ define('CONCATENATE_SCRIPTS', false);" wp-config.php
       sed -i "6i\ if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && strpos($_SERVER['HTTP_X_FORWARDED_PROTO'], 'https') !== false) {" wp-config.php
       sed -i "7i\ $_SERVER['HTTPS'] = 'on';" wp-config.php
       sed -i "8i\ }" wp-config.php
       echo "Regra inserida com sucesso!"
       sleep 3     
echo "================================================"
;;
     0)
        
	echo ""
	echo "Encerrando, Obrigado jovem Padawan!"
	sleep 3
clear
	exit
;;
*)
        echo "Opção inválida!"
esac
done

}
menu

