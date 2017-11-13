#!/bin/bash
#menu.sh

#Shell Script com algumas opções para facilitar a criação, removoção de usuarios entre outras coisas
#Desenvolvido por Christian Weber - Data: 13/11/2017
#Em fase de desenvolvimento, há muitas coisas para alterar. Grato

	clear
	echo " --- MENU --- "
	echo " "
	echo "O que deseja fazer?"
	echo "1 - Atualizar Sistema"
	echo "2 - Criar Usuário"
	echo "3 - Criar grupo"
	echo "4 - Adiciona um usuário ao DADOS e uma senha"
	echo "6 - Coloca um usuário em um grupo"
	echo "5 - Serviços"
	echo "9 - Sair"
	echo -n "Opção:"
	read opcao
	case $opcao in
		1) 
		     echo "Você escolheu: Atualizar o Sistema e Lista de pacotes"
	     	     sudo apt-get update -y && sudo apt-get update -y	     	
		    ;;
		2) 
		     #notas: cria um usuário "falso", ou seja, não adiciona um diretorio home.
		     echo "Você escolheu: Criar um novo Usuário"
		     echo "Qual o nome desse usuário?"
		      read NEWUSER
		     sudo useradd --no-create-home -s /bin/false $NEWUSER
		     if [ "$?" -eq 0 ]; then 
			     echo "Usuário criado com sucesso"
		     else
			     echo "Usuário não criado"
		     fi
		    ;;
		3) 
		     echo "Você escolheu: Criar um novo grupo"
		     echo "Qual o nome do grupo?"
		      read NEWGROUP
		     sudo addgroup $NEWGROUP
		     if [ "$?" -eq 0 ]; then
			     echo "Grupo criado com sucesso"
		     else
			     echo "Grupo não criado"
		     fi
		    ;;
		4)
		     echo "Você escolheu: Adicionar usuário ao samba e colocar uma senha"
		     echo "Qual usuário?"
		      read USERSMB
		     sudo smbpasswd -a $USERSMB
		     if [ "$?" -eq 0 ]; then
			     echo "Usuário adicionado com Sucesso"
		     else
			     echo "Usuário não adicionado"
		     fi
		    ;;
		5)
		     #nota: pode ser substituído por systemctl 
		     echo "O que deseja fazer [1]-Reiniciar [2]-Parar [3]-Iniciar"
		      read STAT
		     echo "Qual serviço?"
		      read SERV
	        
		     case $STAT in
			     1) STAT1=restart ;;
			     2) STAT1=stop ;;     
			     3) STAT1=start ;;
		     esac     
		     sudo /etc/init.d/$SERV $STAT1
		   ;;    
	        6)   
		     echo "Você escolheu adicionar um usuário a determinado grupo"
		     echo "Qual usuário"
		     read GPUSER
		     echo "Em qual grupo?"
		     read USGROUP
		     adduser $GPUSER $USGROUP
		     echo "O usuário $GPUSER entrou no grupo $USGROUP"
		    ;;
                9) exit  ;;
	    	*) "Opção inválida" ;; 
	esac


