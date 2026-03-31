# Roteiro de Demonstração - Dia 02

## Cenário: Deploy de Nginx

### 1. A Dor (Shell Script)
Rodando o script manual no container.

```bash
# Copia o script
docker cp install_nginx_bad.sh alvo-debian:/tmp/

# Executa (Note a demora e o output sujo)
docker exec alvo-debian bash /tmp/install_nginx_bad.sh
```

---

### 2. O Remédio (Playbook)
Aplicando o Playbook.

```bash
# Rodar contra o grupo docker
ansible-playbook -i ../hosts.ini setup_nginx.yml --limit docker
```

**Validar:**
```bash
# Verificar se o HTML mudou
docker exec alvo-debian curl localhost
```