# Desafios Dia 02: Playbooks e YAML

## 🟢 Fácil: O Arrumador
Crie um Playbook chamado `setup_workspace.yml` que:
1.  Crie um diretório em `/tmp/treinamento`.
2.  Crie um arquivo vazio chamado `estive_aqui.txt` dentro desse diretório.

---

## 🟡 Médio: Web Server Alternativo
Crie um Playbook para instalar o `apache2`, mas garanta que ele **NÃO** inicie automaticamente após a instalação.
*   **Dica:** Explore o parâmetro `enabled` e `state` do módulo `service`.

---

## 🔴 Difícil: O Código Quebrado (Destrator)
O Playbook abaixo contém **3 erros críticos**. Sua missão é corrigi-los para que ele funcione.

```yaml
---
- hosts: local
  become: yes
  tasks:
  - name: Instalar ferramentas
    apt: name=git, curl state=present
    
    - name: Criar usuario
      user:
      name: aluno_ansible
      shell: /bin/bash
```
*Dica:* Observe indentação e a lista de nomes no módulo apt.
