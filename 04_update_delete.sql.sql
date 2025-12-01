SET SQL_SAFE_UPDATES = 0;
USE hfab_db;

-- ===================================================
-- COMANDOS DE ATUALIZAÇÃO (UPDATE)
-- ===================================================

-- 1. Atualizar o telefone de um paciente
-- Cenário: O paciente Carlos mudou de número.
UPDATE paciente 
SET telefone = '(61) 99999-9999' 
WHERE id_paciente = 1;

-- 2. Finalizar um atendimento e adicionar observação médica
-- Cenário: O médico terminou o atendimento do id 2.
UPDATE atendimento 
SET status = 'Concluído', observacoes = 'Fratura confirmada. Gesso aplicado.'
WHERE id_atendimento = 2;

-- 3. Corrigir a especialidade de um médico
-- Cenário: Digitamos errado no cadastro.
UPDATE profissional 
SET especialidade = 'Cardiologia Pediátrica' 
WHERE nome = 'Dr. Mendes';


-- ===================================================
-- COMANDOS DE REMOÇÃO (DELETE)
-- ===================================================

-- 1. Remover um procedimento lançado errado
-- Vamos apagar o exame 'Hemograma' (id 3) do atendimento 1.
DELETE FROM procedimento 
WHERE id_procedimento = 3;

-- 2. Cancelar (apagar) um agendamento que NÃO tem atendimento
-- O agendamento 4 (Maria com Enf. João) foi criado mas não teve atendimento gerado ainda.
DELETE FROM agendamento 
WHERE id_agendamento = 4;

-- 3. Tentar apagar um paciente (Limpeza)
-- CUIDADO: Se tentar apagar um paciente que tem agendamento, o banco bloqueia (erro de Foreign Key).
-- Vamos inserir um paciente teste só para apagar ele em seguida.
INSERT INTO paciente (nome, cpf, telefone) VALUES ('Paciente Teste', '00000000000', '0000');

-- Agora apagamos ele:
DELETE FROM paciente 
WHERE cpf = '00000000000';