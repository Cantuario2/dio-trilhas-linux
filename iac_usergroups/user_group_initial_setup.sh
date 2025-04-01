#!/bin/bash

directories=(publico adm com prod almox)
groups=(ADM COM PROD ALMOX)
users_administracao=(Dirceu Carlos Humberto)
users_comercial=(Jackson Edson Fredson)
users_producao=(Paulo Claudio Nivaldo)
users_almoxarifado=(Roberto Antonio)

echo "Empresa X - Criação de Diretórios, Grupos e Usuários"

echo "1. Criando diretórios:"
for d in ${directories[@]}; do
    mkdir /$d
    echo "- Diretório $d criado."
done
echo "----------------------------------------------------"

echo "2. Criando grupos de usuários:"
for g in ${groups[@]}; do
    groupadd GRP_$g
    echo "- Grupo $g criado."
done
echo "----------------------------------------------------"

echo "3. Criando usuários em seus grupos específicos:"
echo ":: Grupo 1 - ADM ::"
for u in ${users_administracao[@]}; do
    useradd $u -m -s /bin/bash -p $(openssl passwd -crypt Senha@1234) -G GRP_ADM
    echo "- Usuário $u criado no Grupo ADM."
done
echo "."

echo ":: Grupo 2 - COM ::"
for u in ${users_comercial[@]}; do
    useradd $u -m -s /bin/bash -p $(openssl passwd -crypt Senha@1234) -G GRP_COM
    echo "- Usuário $u criado no Grupo COM."
done
echo "."

echo ":: Grupo 3 - PROD ::"
for u in ${users_producao[@]}; do
    useradd $u -m -s /bin/bash -p $(openssl passwd -crypt Senha@1234) -G GRP_PROD
    echo "- Usuário $u criado no Grupo PROD."
done
echo "."

echo ":: Grupo 4 - ALMOX ::"
for u in ${users_almoxarifado[@]}; do
    useradd $u -m -s /bin/bash -p $(openssl passwd -crypt Senha@1234) -G GRP_ALMOX
    echo "- Usuário $u criado no Grupo ALMOX."
done
echo "----------------------------------------------------"

echo "4. Definindo grupos proprietários dos diretórios:"
for d in ${directories[@]}; do
    chown root:GRP_${d^^} /$d
    echo "- Propriedade do diretório $d definida para GRP_${d^^}."
done
echo "----------------------------------------------------"

echo "5. Definindo permissões nos diretórios:"
for d in ${directories[@]}; do
    chmod 770 /$d
    echo "- Permissões definidas para o diretório $d."
done
chmod 777 /publico
echo "- Permissões redefinidas para o diretório /publico."
echo "----------------------------------------------------"

echo "----------------- FIM DO SCRIPT --------------------"
