#!/bin/bash

#criador: Lord X
#data: 7/3/22
#descrição: vai instalar o nano, git, python, figlet e steghide, verificar e remover o motd, e direcionar para as config do PS1 

#=========================================================#

#pra acessar isso já terá feito isso: termux-setup-storage

#=====Atualização e instalação de pacotes padrão====
apt update
apt upgrade -y

clear

pacote=$(dpkg --get-selections | grep "git" ) 
if [ -n "$pacote" ] ;
then 
     echo -e "\033[01;32m O pacote git já foi instalado! \033[01;00m"
else 
     pkg install git -y
fi

pacote1=$(dpkg --get-selections | grep "nano" ) 
if [ -n "$pacote1" ] ;
then 
     echo -e "\033[01;32m O pacote nano já foi instalado! \033[01;00m"
else 
     pkg install nano
fi

pacote2=$(dpkg --get-selections | grep "figlet" ) 
if [ -n "$pacote2" ] ;
then 
     echo -e "\033[01;32m O pacote figlet já foi instalado! \033[01;00m"
else 
     apt install figlet -y
fi

pacote3=$(dpkg --get-selections | grep "toilet" ) 
if [ -n "$pacote3" ] ;
then 
     echo -e "\033[01;32m O pacote toilet já foi instalado! \033[01;00m"
else 
     pkg install toilet -y
fi

pacote4=$(dpkg --get-selections | grep "steghide" ) 
if [ -n "$pacote4" ] ;
then 
     echo -e "\033[01;32m O pacote steghide já foi instalado! \033[01;00m"
else 
     pkg install steghide -y
fi


#pkg install python -y
sleep 3.5

#==========Remover texto chato do topo=========
lc=/data/data/com.termux/files/usr/etc/motd

if [ -e "$lc" ]; then
rm -r "$lc"

else 
rm -r "$lc"
clear
echo -e "\n\n\n\n\n \033[01;32m O Aquivo motd já foi removido!\033[01;00m"
sleep 3.5

fi
 

#=======Configurar BashLine(PS1)==========
 if [ -e "/sdcard/cores.txt"] ; then
 nano /sdcard/cores.txt
 else
echo ' 

\[\e[Z;YY;XXm\]
Onde Z é o estilo dos caracteres, YY é a cor de fundo e XX a cor dos caracteres.

Cores	Caracteres	Fundo
Preto	      30	40
Vermelho	  31	41
Verde	      32	42
Amarelo	      33	43
Azul	       34	44
Roxo	       35  	45
Ciano	       36	46
Cinza	       37	47

vermelho         \[\e[01;31m\]
verde            \[\e[01;32m\]
amarelo          \[\e[01;33m\]
azul              \[\e[01;34m\]
roxo/rosa         \[\e[01;35m\]
azul claro         \[\e[01;36m\]
cinza/branco      \[\e[01;37m\]
ANULAR          \[\e[01;00m\]

=========LETRAS=============

diretório:   \w ou \W
data:       \d
usuário:     \u
hostname:   \h ou \H
nomePc:     \l

exemplo:

PS1="\[\e[01;31m\]Lord\[\e[01;36m\]@\[\e[01;31m\]Zero\[\e[01;33m\] [\w] \n\[\e[01;35m\]\$ \[\e[01;00m\]"

'
echo -e '\n \033[01;32m ...copie oque precisa e tecle enter para continuar...\033[01;00m \n'
read
fi

nano /data/data/com.termux/files/usr/etc/bash.bashrc
cd $HOME
clear
echo -e '\033[01;32m \n'
toilet -f future Instalado Atualizado!
echo -e '\033[01;00m \n'
figlet By Lord-X
