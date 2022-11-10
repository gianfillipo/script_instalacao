#!/bin/bash

#Adicionar repositório
function adicionar_repositorio() {
    REPOSITORIO="./AXIA"

    echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Seja bem vindo, usuário. Sou o assistente da AXIA e vou te auxiliar no processo de instalação!"
    sleep 2
    echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Vamos colocar o repositório na sua máquina, ou atualizá-lo, caso ele já esteja aqui."
    sleep 2

    if [ -d $REPOSITORIO ]; then
        echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Você já tem o repositório no seu computador. Vamos atualizá-lo."
        git pull https://github.com/Rafa-Said/AXIA.git

    else
        echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Repositório não encontrado! Vamos cloná-lo."
        git clone https://github.com/Rafa-Said/AXIA.git
    fi
}

#Instalação MySql
function instalar_mysql() {
    
    echo  "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Vamos checar se o MySQL está instalado."
    sleep 2

    if [ -f /etc/init.d/mysql* ]; then
        echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Olhá só que bom! Parece que seu MySQL já está instalado! "
        sleep 2
    else 
        echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Não encontramos o MySQL na sua máquina, mas vamos resolver isso agora."
        sleep 2
        echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Você deseja instalar o MySQL? (S/N)?"
        sleep 2

        read instalar_mysql
        if [ "$instalar_mysql" = "s" ]; then 
            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Instalando o MySQL..."
            sudo apt-get install mysql-server -y
        else
            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15)  Atualizando! Estamos quase lá."
            sudo apt update -y
            clear
        fi

    fi
}

#Instalação Java
function instalar_java() {
    
    echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Agora, vamos checar se o Java já está instalado."

    java -version
    if [ $? -eq 0 ]; then
        echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) O Java já está instalado! Prosseguindo..."
        sleep 2
    else
        echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Parece que o Java não está instalado."
        sleep 2
        echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Você deseja instalá-lo? (S/N)?"
        sleep 2

        read instalar_java
        if [ "$instalar_java" = "s" ]; then 
            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Instalando o Java..."
            sleep 2
            sudo add-apt-repository ppa:webupd8team/java -y
            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15)  Atualizando! Estamos quase lá."
            sleep 2
            sudo apt update -y
            clear
            sleep 2
            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Instalando a versão 18 do Java!"
            sudo apt install default-jre ; apt install openjdk-18-jre-headless; -y
            clear
            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Java instalado com sucesso! Prosseguindo para a próxima etapa..."
            sleep 2
        else
            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Você escolheu não instalar o Java por enquanto (é recomendada sua instalação para o funcionamento das outras ferramentas)."
        sleep 2
        fi
    fi
}

#Instalação python
function instalar_python() {
    
    echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Agora, vamos checar se o python já está instalado."
        
    python3 --version
    if [ $? -eq 0 ]; then
        echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) O python já está instalado! Prosseguindo..."
        sleep 2
    else
        echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Parece que o python não está instalado."
        sleep 2
        echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Você deseja instalá-lo? (S/N)?"
        sleep 2

        read instalar_python
        if [ "$instalar_python" = "s" ]; then 
            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Instalando o Python3..."
                 
            sleep 2
            sudo apt install python-is-python3
            sleep 2
            clear
            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Atualizando..."
            sleep 2
            sudo apt update -y
            sleep 2
            clear
            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Python3 instalado com sucesso!"
        else
            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Você escolheu não instalar o python por enquanto (é recomendada sua instalação para o funcionamento das outras ferramentas)."
        sleep 2
        fi
    fi
}

function instalar_pip() {
   
    echo  "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Agora vamos verificar se o Pip já está instalado.;"
    sleep 2
   
    pip --version
    if [ $? -eq 0 ]; then
        echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) O Pip já está instalado!"
        sleep 2
    else
        echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) O Pip não está instalado. Deseja instalar o Pip e suas bibliotecas? (S/N)?"
        sleep 2
        
        read instalar_pip
        if [ "$instalar_pip" = "s" ]; then
            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Você escolheu instalar o Pip."
            sleep 2
            sudo apt install python3-pip
            clear

            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Atualizando! Quase lá."
            sleep 2
            sudo apt update -y
            clear
            
            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) O Pip foi instalado com sucesso! Agora vamos adicionar as bibliotecas."
            pip install psutil
            pip install -U textwrap3
            pip install pyMySQL
            sleep 2
            clear  
            
            echo "$(tput setaf 52)[AXIA Assistant]:$(tput setaf 15) Todas as bibliotecas do Pip foram instaladas com sucesso!"
            sleep 2
        else
            echo "Tchau"
        fi
     
    fi    
}


adicionar_repositorio
instalar_mysql
instalar_java
instalar_python
instalar_pip
