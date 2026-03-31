# Desafios Dia 01: Comandos Ad-Hoc

## 🟢 Fácil: Inspeção de Saúde
Use o Ansible para verificar o espaço em disco de todas as máquinas do inventário.
*   **Módulo:** `shell` ou `command`.
*   **Comando:** `df -h`.

---

## 🟡 Médio: Gestão de Pacotes
Instale o pacote `htop` na sua máquina local usando o Ansible.
*   **Requisito:** O comando deve ser executado como superusuário (`become`).
*   **Dica:** Verifique o parâmetro `state` do módulo `apt`.

---

## 🔴 Difícil: Caça ao Fantasma (Troubleshooting)
Adicione um servidor inexistente (ex: `10.0.0.50`) ao seu `hosts.ini` e tente rodar o módulo `ping`.
1.  O que acontece com o tempo de execução?
2.  Qual o erro retornado?
3.  Como o Ansible reporta falhas em um host sem parar a execução nos outros?
