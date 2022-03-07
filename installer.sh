#!/bin/bash

#verifica se tem o compilador shell 
pacote=$(dpkg --get-selections | grep "shc" ) 
if [ -n "$pacote" ] ;
then 
     echo -e "\n\n\n\033[01;32m O pacote compilador já foi encontrado \n aguarde... \033[01;00m"
else 
     pkg install shc -y
fi

#compila o shell
shc -f .installer/b.sh -r
clear
  echo -e "\n\n\n\033[01;32m Compilando código shell \n aguarde... \033[01;00m"
sleep 2

#compila o c
gcc .installer/*.c -o dt
 echo -e "\033[01;32m Compilando e movendo para o destino final... \033[01;00m"
 
#manda pra bin e remover o lixo
mv -v dt /data/data/com.termux/files/usr/bin
rm -r .intaller/

#autorizar
cd /data/data/com.termux/files/usr/bin
chmod +x dt
clear

# verifica se instalou e finaliza
AR=/data/data/com.termux/files/usr/bin/dt
if [ -e "$AR" ] ; then
echo -e '\n\n\n\033[01;36m Deu tudo certo, sempre que precisar apenas digite dt \n tecle enter para encerrar\033[01;31m'
else
echo -e '\n\n\n\033[01;31m algo deu errado, dê um feedback'
fi
read
clear

echo -e '\n\n\n\033[01;34m Agora basta digitar\033[01;33m dt\033[01;34m sempre que quiser ativar o DefaultTermux \n\n\n\033[01;00m'


#kamikaze desintalação BETA
#rm -r ~/../usr/bin/dt
#rm -r .installer/*
#rm -r oneshot/*
#rm -r ../*y
