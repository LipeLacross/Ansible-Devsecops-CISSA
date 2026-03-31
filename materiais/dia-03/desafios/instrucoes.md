# Desafios Dia 03: Variáveis e Templates

## 🟢 Fácil: Customização por Variável
Crie um Playbook que use uma variável `meu_nome` para criar um arquivo em `/tmp/{{ meu_nome }}.txt`.

---

## 🟡 Médio: O Relatório do Sistema
Use o módulo `template` para gerar um arquivo `/tmp/info_sistema.txt` que contenha:
1.  O hostname da máquina.
2.  A versão do Kernel Linux.
3.  A quantidade total de memória RAM (em MB).
*   **Dica:** Use o módulo `setup` (Ad-Hoc) antes para descobrir os nomes das variáveis (Facts).

---

## 🔴 Difícil: Missão Crítica (Assertion)
Crie um Playbook que exige que uma variável chamada `chave_secreta` seja passada via linha de comando (`-e`).
*   Se a variável não for passada, o Playbook deve falhar imediatamente com uma mensagem amigável.
*   **Dica:** Pesquise sobre o módulo `assert` ou a instrução `fail`.
