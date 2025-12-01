-- Garante que estamos usando o banco certo
USE hfab_db;

-- 1. Inserindo PACIENTES
INSERT INTO paciente (nome, cpf, data_nascimento, telefone, categoria) VALUES 
('Carlos Silva', '12345678900', '1985-04-12', '(61) 99999-1111', 'Militar'),
('Ana Paula Souza', '98765432100', '1990-07-25', '(61) 98888-2222', 'Dependente'),
('Roberto Costa', '11122233344', '1978-01-10', '(61) 97777-3333', 'Civil'),
('Maria Oliveira', '55566677788', '1995-12-05', '(61) 95555-4444', 'Dependente');

-- 2. Inserindo PROFISSIONAIS
INSERT INTO profissional (nome, especialidade, registro_profissional) VALUES 
('Dr. Mendes', 'Cardiologia', 'CRM-DF-1234'),
('Dra. Helena', 'Ortopedia', 'CRM-DF-5678'),
('Enf. João', 'Triagem', 'COREN-DF-9012');

-- 3. Inserindo AGENDAMENTOS
-- (Linkamos quem vai ser atendido por quem)
INSERT INTO agendamento (data_agendamento, hora_agendamento, id_paciente, id_profissional) VALUES 
('2023-11-20', '08:00:00', 1, 1), -- Carlos com Dr. Mendes
('2023-11-20', '09:00:00', 2, 2), -- Ana Paula com Dra. Helena
('2023-11-21', '14:00:00', 3, 1), -- Roberto com Dr. Mendes
('2023-11-22', '10:00:00', 4, 3); -- Maria com Enf. João

-- 4. Inserindo ATENDIMENTOS
-- (Só criamos atendimento para os agendamentos que "já aconteceram")
INSERT INTO atendimento (data_hora_inicio, status, observacoes, id_agendamento) VALUES 
('2023-11-20 08:15:00', 'Concluído', 'Paciente relatou dores no peito. Encaminhado para exames.', 1),
('2023-11-20 09:10:00', 'Em Andamento', 'Suspeita de fratura no braço direito.', 2),
('2023-11-21 14:05:00', 'Cancelado', 'Paciente não compareceu.', 3);

-- 5. Inserindo PROCEDIMENTOS
-- (Linkamos aos atendimentos criados acima)
INSERT INTO procedimento (tipo, descricao, resultado, id_atendimento) VALUES 
('Eletrocardiograma', 'Verificação de ritmo cardíaco', 'Taquicardia leve', 1),
('Raio-X', 'Raio-X do braço direito', 'Fratura leve na ulna', 2),
('Hemograma', 'Exame de sangue completo', 'Pendente', 1);