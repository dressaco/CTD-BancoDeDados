DROP DATABASE IF EXISTS SaudeDh;

CREATE DATABASE IF NOT EXISTS SaudeDh #CREATE SCHEMA IF NOT EXISTS SaudeDh;
    DEFAULT CHARSET utf8mb4
    DEFAULT COLLATE utf8mb4_general_ci;

USE SaudeDh;

CREATE TABLE IF NOT EXISTS Paciente
(
    nPacienteID INT SIGNED AUTO_INCREMENT,
    strNome VARCHAR(50) NOT NULL,
    strSobrenome VARCHAR(100) NULL,
    strPlano VARCHAR(100) NULL,
    
    CONSTRAINT Pk_Paciente_nPacienteID PRIMARY KEY (nPacienteID)
);

CREATE TABLE IF NOT EXISTS Especialidade
(
    nEspecialidadeID SMALLINT UNSIGNED AUTO_INCREMENT,
    strNome VARCHAR(100) NULL,
    
    PRIMARY KEY (nEspecialidadeID)
);

CREATE TABLE IF NOT EXISTS Medico
(
    nMedicoID INT UNSIGNED AUTO_INCREMENT,
    strNome VARCHAR(20) NOT NULL,
    strSobrenome VARCHAR(40) NULL,
    strEmail VARCHAR(50) NULL UNIQUE,
    strCRM CHAR(10) UNIQUE,
    nEspecialidadeID SMALLINT UNSIGNED,
    
    PRIMARY KEY (nMedicoID)
);

CREATE TABLE IF NOT EXISTS Consulta
(
    nConsultaID INT UNSIGNED AUTO_INCREMENT,
    nPacienteID INT UNSIGNED NULL,
    -- nMedicoID INT UNSIGNED NULL,
    dtConsulta DATE NULL,
    dtHora TIME NULL,
    
    PRIMARY KEY (nConsultaID)
);

ALTER TABLE Medico ADD CONSTRAINT Fk_Medico_Especialidade_nEspecialidadeID
    FOREIGN KEY (nEspecialidadeID) REFERENCES Especialidade (nEspecialidadeID);

ALTER TABLE Consulta ADD COLUMN nMedicoID INT NOT NULL;

#1 drop - e se sua tabela já estiver populada (com registros)?
#ALTER TABLE Consulta DROP COLUMN nMedicoID;
#ALTER TABLE Consulta ADD nMedicoID INT UNSIGNED NOT NULL;

#2 modify
ALTER TABLE Consulta MODIFY COLUMN nMedicoID INT UNSIGNED NOT NULL;

ALTER TABLE Consulta ADD CONSTRAINT Fk_Consulta_Medico_nMedicoID FOREIGN KEY (nMedicoID)
    REFERENCES Medico (nMedicoID);
    
#1
INSERT INTO Medico (strNome, strSobrenome, nEspecialidadeID)
VALUES('Marcia', 'Martins', 1); -- erro de integridade referencial. Estou tentando inserir uma especialidade que não existe.

INSERT INTO Medico (strNome, strSobrenome, nEspecialidadeID)
VALUES('Marcia', 'Martins', NULL); -- especialidade não é obrigatório, ou seja, é NULL

-- devo incluir a especialidade primeiro
INSERT INTO Especialidade (strNome)
VALUES ('Ginecologista');

INSERT INTO Especialidade (strNome)
VALUES ('Ortopedista');

INSERT INTO Especialidade (strNome)
VALUES ('Cardiologista');

SELECT * FROM Especialidade;

-- verifique o nMedicoID da Marcia e informe ele no update abaixo
SELECT * FROM Medico;

UPDATE Medico
SET nEspecialidadeID = 1
WHERE nMedicoID = informe_aqui_o_nMedicoID;

SELECT * FROM Medico;