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
		     echo "Voce escolheu atualizar o Sistema"
	     	     sudo apt-get update -y && sudo apt-get update -y	     	
		    ;;
		2) 
		     #notas: cria um usuário "falso", ou seja, não adiciona um diretorio home.
		     echo "Voce escolheu criar um novo Usuário"
		     echo "Qual o nome desse usuário?"
		     read newuser
		     sudo useradd --no-create-home -s /bin/false $newuser
		     if [ "$?" -eq 0 ]; then 
			     echo "Usuario criado com sucesso"
		     else
			     echo "Usuario não criado"
		     fi
		    ;;
		3) 
		     echo "Voce escolheu criar um novo grupo"
		     echo "Qual o nome do grupo?"
		     read newgrupo
		     sudo addgroup $newgrupo
		     if [ "$?" -eq 0 ]; then
			     echo "Grupo criado com sucesso"
		     else
			     echo "Grupo não criado"
		     fi
		    ;;
		4)
		     echo "Adicionar usuário ao samba e Colocar uma senha"
		     echo "Qual usuário?"
		     read nomeuser
		     sudo smbpasswd -a $nomeuser
		    ;;
		5)
		     #nota: pode ser substituido por systemctl 
			echo "O que deseja fazer [1]-Reiniciar [2]-Parar [3]-Iniciar"
		     read stat
		     echo "Qual serviço?"
		     read serv
	        
		     case $stat in
			     1) stat1=restart ;;
			     2) stat1=stop ;;     
			     3) stat1=start ;;
		     esac     
		     sudo /etc/init.d/$serv $stat1
		   ;;    
	        6)   
		     echo "Você escolheu adicionar um usuário a determinado grupo"
		     echo "Qual usuário"
		     read gpUser
		     echo "Em qual grupo?"
		     read usGroup
		     adduser $gpUser $usGroup
		     echo "O usuário $gpUser entrou no grupo $usGroup"
		    ;;
                9) exit  ;;
	    	*) "Opção invalida" ;; 
	esac


