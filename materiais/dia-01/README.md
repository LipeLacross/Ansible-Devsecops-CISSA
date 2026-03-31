# Roteiro de Demonstração - Dia 01

## Setup Inicial (Docker)
Antes de começar, garanta que o container alvo está rodando:
```bash
docker run -it -d --name alvo-debian debian
# Instala Python (necessário para o Ansible)
docker exec alvo-debian apt update && docker exec alvo-debian apt install -y python3
```

## Cenário: Atualização do MOTD

### 1. A Dor (Shell Script)
Execute o script ruim DIRETAMENTE no alvo (simulando acesso manual):

```bash
# Copia o script para o container
docker cp script_ruim.sh alvo-debian:/tmp/

# Executa manualmente (várias vezes para mostrar o erro)
docker exec alvo-debian bash /tmp/script_ruim.sh
docker exec alvo-debian bash /tmp/script_ruim.sh
```

---

### 2. O Remédio (Ansible Ad-Hoc)
Limpe a sujeira e aplique a correção via Ansible.

```bash
# Limpar o arquivo primeiro (para a demo)
docker exec alvo-debian bash -c "> /etc/motd"

# Executar Ad-Hoc contra o grupo [docker]
ansible docker -i ../hosts.ini \
  -m lineinfile \
  -a "path=/etc/motd line='BEM-VINDO AO CURSO DE ANSIBLE' state=present create=yes"
```

**Verificação:**
Execute novamente o comando Ansible. O status será `SUCCESS` (Verde), não `CHANGED` (Amarelo).

```
