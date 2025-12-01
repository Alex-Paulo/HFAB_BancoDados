-- 1. Criação do Banco de Dados
CREATE DATABASE hfab_db;
USE hfab_db;

-- 2. Tabela PACIENTE
CREATE TABLE paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(15),
    categoria VARCHAR(50) -- Ex: Militar, Civil, Dependente
);

-- 3. Tabela PROFISSIONAL
CREATE TABLE profissional (
    id_profissional INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50),
    registro_profissional VARCHAR(20) UNIQUE -- CRM ou similar
);

-- 4. Tabela AGENDAMENTO
CREATE TABLE agendamento (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    data_agendamento DATE NOT NULL,
    hora_agendamento TIME NOT NULL,
    id_paciente INT NOT NULL,
    id_profissional INT NOT NULL,
    CONSTRAINT fk_agenda_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    CONSTRAINT fk_agenda_prof FOREIGN KEY (id_profissional) REFERENCES profissional(id_profissional)
);

-- 5. Tabela ATENDIMENTO
CREATE TABLE atendimento (
    id_atendimento INT AUTO_INCREMENT PRIMARY KEY,
    data_hora_inicio DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Em Andamento', 
    observacoes TEXT,
    id_agendamento INT NOT NULL UNIQUE, 
    CONSTRAINT fk_atend_agenda FOREIGN KEY (id_agendamento) REFERENCES agendamento(id_agendamento)
);

-- 6. Tabela PROCEDIMENTO
CREATE TABLE procedimento (
    id_procedimento INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL, 
    descricao VARCHAR(255),
    resultado TEXT,
    id_atendimento INT NOT NULL,
    CONSTRAINT fk_proc_atend FOREIGN KEY (id_atendimento) REFERENCES atendimento(id_atendimento)
);