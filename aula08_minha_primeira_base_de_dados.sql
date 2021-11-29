CREATE DATABASE minhaprimeirabasededados;
USE minhaprimeirabasededados;

# CREATE TABLE -> criar a tabela de acordo com especificacoes

CREATE TABLE post (
id INT PRIMARY KEY AUTO_INCREMENT,
titutlo VARCHAR(200)
);

CREATE TABLE filmes (
id INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(500) NOT NULL,
rating DECIMAL(3,1) NOT NULL,
premio INT DEFAULT 0,
data_lancamento DATE NOT NULL,
duracao INT NOT NULL
);

CREATE TABLE ordens (
ordem_id INT NOT NULL,
ordem_numero INT NOT NULL,
cliente_id TINYINT(4) NOT NULL,
PRIMARY KEY (ordem_id), # identificar qual coluna será a primary key
FOREIGN KEY (cliente_id) REFERENCES clientes(id) # linkar a qual tabela>coluna se refere a foreign key
);

# DROP TABLE -> excluir a tabela especificada
DROP TABLE IF EXISTS filmes;

# ALTER TABLE -> alterar a tabela especificadda

## ADD para adicionar uma coluna
ALTER TABLE filmes
ADD rating DECIMAL(3,1) NOT NULL;

## MODIFY para modificar uma coluna
ALTER TABLE filmes
MODIFY rating DECIMAL(4,1) NOT NULL; # deve repetir todas as configurações, alterando apenas a que deve ser modificada (no caso, o nro de casas decimais)

## DROP para excluir uma coluna
ALTER TABLE fiLmes
DROP rating;

# INSERT -> inserir dados na tabela
INSERT INTO artistas (nome)
VALUES ('Calle 13');

INSERT INTO artistas (nome, rating)
VALUES ('Maluma','1.0');

### Obs: Se for inserir dados em todas as colunas, não é necessário informar todas, mas os valores devem estar na mesma ordem em que foram atribuidas as colunas
INSERT INTO artistas
VALUES (DEFALUT, 'Shakira',1.0);

# UPDATE -> modificar dados existentes na tabela
UPDATE artistas
SET nome = 'Charly Garcia', rating = 1.0 # informação a ser atualizada para
WHERE id = 1; # condição para localizar a(s) linha(s) a ser(em) alterada(s)

# DELETE -> deletar dados da tabela
DELETE FROM artistas # tabela da qual será feita a exclusão de dados
WHERE id = 4; # condição para localizar a(s) linha(s) a ser(em) excluida(s)

### Obs: Se utilizar o UPDATE ou DELETE sem WHERE, ele irá alterar/deletar todas as linhas da tabela!!

# SELECT -> consultas
SELECT id, titulo, rating
FROM filmes;

# WHERE -> condição de filtro
SELECT primeiro_nome,sobrenome
FROM clientes
WHERE pais = 'Brasil';

SELECT primeiro_nome,sobrenome
FROM clientes
WHERE pais <> 'Brasil';

SELECT primeiro_nome,sobrenome
FROM clientes
WHERE id < 15;

SELECT primeiro_nome,sobrenome
FROM clientes
WHERE id > 5;

SELECT *
FROM cancoes
WHERE id >= 3 AND id < 8;

SELECT *
FROM cancoes
WHERE id = 2 OR id = 6;

# ORDER BY -> classificar
SELECT nome,rating
FROM artistas
WHERE avaliacao > 1.0
ORDER BY nome DESC;