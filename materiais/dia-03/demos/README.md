# Roteiro de Demonstração - Dia 03

## Cenário: Configuração Multi-Ambiente

### 1. A Dor (Shell Script)
```bash
docker cp config_app_bad.sh alvo-debian:/tmp/
docker exec alvo-debian bash /tmp/config_app_bad.sh
```

---

### 2. O Remédio (Jinja2 Templates)

**Rodar como DEV (Padrão):**
```bash
ansible-playbook -i ../hosts.ini app_config.yml --limit docker
docker exec alvo-debian cat /tmp/app.conf
```

**Rodar como PROD (Override):**
```bash
ansible-playbook -i ../hosts.ini app_config.yml --limit docker -e "app_env=prod"
docker exec alvo-debian cat /tmp/app.conf
```