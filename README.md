# Sistema de Gestão de Pacientes e Procedimentos - HFAB 🏥

Este repositório contém os scripts SQL desenvolvidos para a disciplina de **Modelagem de Banco de Dados**. O projeto simula o banco de dados administrativo do Hospital da Força Aérea de Brasília (HFAB), focado no gerenciamento de pacientes, médicos, agendamentos e atendimentos.

## 📁 Estrutura do Projeto

Os scripts devem ser executados na ordem numérica para garantir a integridade do banco:

* **`01_criacao_tabelas.sql`**: Cria o banco `hfab_db` e todas as tabelas (DDL) com suas chaves primárias e estrangeiras.
* **`02_insercao_dados.sql`**: Povoa as tabelas com dados fictícios para teste (DML - INSERT).
* **`03_consultas_select.sql`**: Exemplos de relatórios e consultas utilizando `JOIN`, `GROUP BY` e `ORDER BY`.
* **`04_update_delete.sql`**: Scripts de manipulação de dados (DML - UPDATE e DELETE) para simular o dia a dia do sistema.

## 🛠️ Como Executar

1.  **Pré-requisito:** Tenha o **MySQL Workbench 8.0** instalado.
2.  Abra o script `01_criacao_tabelas.sql` no Workbench e execute (Raio ⚡).
3.  Em seguida, execute o script `02_insercao_dados.sql` para preencher o banco.
4.  Utilize os scripts `03` e `04` para testar as funcionalidades de consulta e alteração.

## 📊 Modelo Lógico

O banco de dados foi normalizado e segue a seguinte estrutura lógica:
* **Paciente** (1:N) ↔ **Agendamento**
* **Profissional** (1:N) ↔ **Agendamento**
* **Agendamento** (1:1) ↔ **Atendimento**
* **Atendimento** (1:N) ↔ **Procedimento**

---
*Desenvolvido por Alex Paulo como parte da Experiência Prática de Banco de Dados.*
