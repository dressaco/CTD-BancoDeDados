CREATE DATABASE IF NOT EXISTS consultorio_saude_dh;
USE consultorio_saude_dh;

CREATE TABLE IF NOT EXISTS pacientes (
paciente_id INT(11) PRIMARY KEY,
paciente_idsaude INT(11),
paciente_nome VARCHAR(50),
paciente_sobrenome VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS especialidades (
especialidade_id INT(11) PRIMARY KEY,
especialidade_nome VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS medicos (
medico_id INT(11) PRIMARY KEY,
medico_nome VARCHAR(40),
medico_sobrenome VARCHAR(100),
medico_especialidade INT(11),
FOREIGN KEY (medico_especialidade) REFERENCES especialidades(especialidade_id)
);

CREATE TABLE IF NOT EXISTS consultas (
consulta_id INT(11) PRIMARY KEY,
paciente INT(11),
medico INT(11),
data_consulta DATE,
hora_consulta TIME,
FOREIGN KEY (paciente) REFERENCES pacientes(paciente_id),
FOREIGN KEY (medico) REFERENCES medicos(medico_id)
);