USE hfab_db;

-- 1. Consulta Simples: Listar apenas pacientes Militares, em ordem alfabética
-- (Usa WHERE e ORDER BY)
SELECT nome, cpf, telefone 
FROM paciente 
WHERE categoria = 'Militar' 
ORDER BY nome ASC;

-- 2. Relatório de Agendamentos (O mais importante!)
-- Cruzamos 3 tabelas para saber: Quem vai ser atendido, por qual médico e que horas.
-- (Usa INNER JOIN)
SELECT 
    a.data_agendamento, 
    a.hora_agendamento, 
    p.nome AS Nome_Paciente, 
    prof.nome AS Nome_Medico,
    prof.especialidade
FROM agendamento a
JOIN paciente p ON a.id_paciente = p.id_paciente
JOIN profissional prof ON a.id_profissional = prof.id_profissional;

-- 3. Contagem de atendimentos por Médico
-- Mostra quantos agendamentos cada médico tem.
-- (Usa LEFT JOIN e GROUP BY)
SELECT prof.nome, COUNT(a.id_agendamento) AS total_agendamentos
FROM profissional prof
LEFT JOIN agendamento a ON prof.id_profissional = a.id_profissional
GROUP BY prof.nome;

-- 4. Ver resultado de exames de um atendimento específico
-- Vamos ver os exames do Atendimento nº 1
SELECT proc.tipo, proc.descricao, proc.resultado
FROM procedimento proc
WHERE proc.id_atendimento = 1;
