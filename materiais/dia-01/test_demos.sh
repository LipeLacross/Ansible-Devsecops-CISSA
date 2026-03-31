#!/bin/bash
# test_demos.sh
# Script de CI/CD para validar se as demos funcionam antes da aula.

CONTAINER_NAME="alvo-debian"
IMAGE_NAME="debian:latest"
INVENTORY="demos/hosts.ini"

function log() {
    echo -e "\n[TEST] $1"
}

function check_error() {
    if [ $? -ne 0 ]; then
        echo -e "\n[FAIL] $1"
        # Tenta limpar mesmo em caso de erro
        cleanup
        exit 1
    fi
}

function cleanup() {
    log "Limpando ambiente (Container e Imagem)..."
    docker rm -f $CONTAINER_NAME > /dev/null 2>&1
    docker rmi $IMAGE_NAME > /dev/null 2>&1
}

# --- SETUP ---
log "Preparando terreno..."
cleanup # Garante que não tem lixo anterior

log "Subindo container de teste ($CONTAINER_NAME)..."
docker run -d --name $CONTAINER_NAME $IMAGE_NAME tail -f /dev/null
check_error "Falha ao subir Docker"

log "Instalando pré-requisitos no container..."
docker exec $CONTAINER_NAME apt-get update
docker exec $CONTAINER_NAME apt-get install -y python3 sudo curl
check_error "Falha ao instalar python3"

# --- DIA 01 ---
log ">>> TESTANDO DIA 01 (Ad-Hoc)"

log "Executando script ruim..."
docker cp demos/dia-01/script_ruim.sh $CONTAINER_NAME:/tmp/
docker exec $CONTAINER_NAME bash /tmp/script_ruim.sh
check_error "Script ruim dia 01 falhou"

log "Executando Ansible Ad-Hoc (Lineinfile)..."
ansible docker -i $INVENTORY -m lineinfile \
  -a "path=/etc/motd line='TESTE SUCESSO' state=present create=yes"
check_error "Ansible Ad-Hoc falhou"

# --- DIA 02 ---
log ">>> TESTANDO DIA 02 (Playbook Nginx)"

log "Executando script ruim (Install Nginx)..."
docker cp demos/dia-02/install_nginx_bad.sh $CONTAINER_NAME:/tmp/
docker exec $CONTAINER_NAME bash /tmp/install_nginx_bad.sh
check_error "Script ruim dia 02 falhou"

log "Executando Playbook Nginx..."
ansible-playbook -i $INVENTORY demos/dia-02/setup_nginx.yml --limit docker
check_error "Playbook Nginx falhou"

log "Validando Nginx..."
docker exec $CONTAINER_NAME curl localhost | grep "ANSIBLE"
check_error "Nginx não serviu a página do Ansible"

# --- DIA 03 ---
log ">>> TESTANDO DIA 03 (Vars & Templates)"

log "Executando Playbook Config (DEV)..."
ansible-playbook -i $INVENTORY demos/dia-03/app_config.yml --limit docker
docker exec $CONTAINER_NAME cat /tmp/app.conf | grep "db_dev"
check_error "Falha na validação DEV"

log "Executando Playbook Config (PROD)..."
ansible-playbook -i $INVENTORY demos/dia-03/app_config.yml --limit docker -e "app_env=prod"
docker exec $CONTAINER_NAME cat /tmp/app.conf | grep "db_prod"
check_error "Falha na validação PROD"

log ">>> TODOS OS TESTES PASSARAM COM SUCESSO! <<<"
log "Pode apresentar tranquilo."

# Limpeza Final
cleanup
