#!/bin/bash

echo "Informe o domínio a ser testado:"
read dominio

status_http=$(curl --write-out %{http_code} --silent --output /dev/null ${dominio})
echo "Domínio $dominio retornando status $status_http"

if [ $status_http -ne 200 ]; then
	echo "Ocorreu uma falha no serviço, reiniciando $(date +%F\ %T)" >> logs/servidor.log
	#systemctl restart httpd

fi	
