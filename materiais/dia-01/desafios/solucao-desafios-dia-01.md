# Soluções dos Desafios: Dia 01 (Alvo: Container alvo-debian)

Para que os comandos abaixo funcionem, seu arquivo `hosts.ini` deve estar configurado para reconhecer o container. 

**Configuração do `hosts.ini` sugerida:**
```ini
[alvos]
# Usando o conector nativo do Docker (não precisa de SSH configurado)
alvo-debian ansible_connection=docker

# OU via SSH (caso tenha configurado o SSH no container durante a aula):
# [IP_DO_CONTAINER] ansible_user=root
```

---

### 🟢 Desafio Fácil: Espaço em Disco
**Missão:** Verificar o espaço em disco (`df -h`) do container `alvo-debian`.

```bash
# Comando Ad-Hoc
ansible alvo-debian -i hosts.ini -m shell -a "df -h"
```

---

### 🟡 Desafio Médio: Instalando o htop no Container
**Missão:** Instalar o pacote `htop` dentro do container `alvo-debian`. 

```bash
# Comando Ad-Hoc (Container Debian)
ansible alvo-debian -i hosts.ini -m apt -a "name=htop state=present update_cache=yes" --become
```
*   **Dica:** O `update_cache=yes` equivale ao `apt update`, necessário em containers novos.

---

### 🔴 Desafio Difícil: Cenário Chaos
**Missão:** Tentar um `ping` contra um host inexistente e entender o erro.

**1. Execução:**
```bash
# Tentando pingar um IP que não existe na sua rede
ansible all -i "10.99.99.99," -m ping
```
*(Nota: O uso da vírgula no final permite passar um host direto sem arquivo de inventário).*

**2. O que observar:**
O erro `UNREACHABLE` aparecerá. Isso prova que o Ansible não conseguiu estabelecer a conexão de transporte (SSH ou Docker) para entregar o código Python do módulo `ping`. Se o seu container `alvo-debian` estiver desligado, o erro será idêntico.
