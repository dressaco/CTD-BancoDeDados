CREATE DATABASE IF NOT EXISTS UniversoLeitura;
USE UniversoLeitura;

CREATE TABLE associados (
codigo INT PRIMARY KEY NOT NULL,
rg VARCHAR(7) NOT NULL,
nome VARCHAR(50) NOT NULL,
sobrenome VARCHAR(50) NOT NULL,
endereco VARCHAR(150) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado VARCHAR(2) NOT NULL
);

CREATE TABLE editoras (
codigo INT PRIMARY KEY NOT NULL,
razao_social VARCHAR(150) NOT NULL,
telefone VARCHAR(100) NOT NULL
);

CREATE TABLE autores (
codigo INT PRIMARY KEY NOT NULL,
sobrenome VARCHAR(100) NOT NULL,
nome VARCHAR(100) NOT NULL
);

CREATE TABLE telefones(
telefoneid INT PRIMARY KEY NOT NULL,
telefone_socio VARCHAR(100),
codAssoc INT NOT NULL,
FOREIGN KEY (codAssoc) REFERENCES associados(codigo)
);

CREATE TABLE livros (
cod INT PRIMARY KEY NOT NULL,
cod_ISBN VARCHAR(13) NOT NULL,
titulo VARCHAR(200) NOT NULL,
ano_criacao DATE NOT NULL,
cod_autor INT NOT NULL,
ano_publicacao DATE NOT NULL,
cod_editora INT NOT NULL,
FOREIGN KEY (cod_autor) REFERENCES autores(codigo),
FOREIGN KEY (cod_editora) REFERENCES editoras(codigo)
);

CREATE TABLE emprestimos (
codigo INT PRIMARY KEY NOT NULL,
codAssoc INT NOT NULL,
data_emprestimo DATE NOT NULL,
prazo_devolucao DATE NOT NULL,
data_devolucao DATE NOT NULL,
FOREIGN KEY (codAssoc) REFERENCES associados(codigo)
);

CREATE TABLE exemplares (
codigo INT PRIMARY KEY NOT NULL,
cod_livro INT NOT NULL,
sinistro BOOL,
FOREIGN KEY (cod_livro) REFERENCES livros(cod)
);

CREATE TABLE emprestimo_exemplares (
codigo INT PRIMARY KEY NOT NULL,
cod_emprestimo INT NOT NULL,
cod_exemplar INT NOT NULL,
FOREIGN KEY (cod_emprestimo) REFERENCES emprestimos(codigo),
FOREIGN KEY (cod_exemplar) REFERENCES exemplares(codigo)
);