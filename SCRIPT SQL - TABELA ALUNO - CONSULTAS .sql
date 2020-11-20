/*EXERCICIO 1*/
CREATE DATABASE EXERCICIO_1
use EXERCICIO_1

/*EXERCICIO 2*/
CREATE TABLE ALUNO(
	MATRICULA integer NOT NULL UNIQUE,
	NOME VARCHAR(50) NOT NULL,
	TELEFONE VARCHAR(15) NOT NULL,
	ENDERECO VARCHAR(250) NOT NULL,
	IDADE INT,
	ALTURA FLOAT, 
	PESO FLOAT, 
	DTNASCIMENTO DATE,
	
	CONSTRAINT PKALUNO PRIMARY KEY (MATRICULA)
)

/*EXERCICIO 3*/
INSERT INTO ALUNO (MATRICULA,NOME,TELEFONE,ENDERECO,IDADE,ALTURA,PESO) 
VALUES(
	1000,
	'Victor Emanuell',
	'3198520-6624',
	'Rua Bombom 333',
	12,
	1.63,
	60.0
)

INSERT INTO ALUNO (MATRICULA, NOME,TELEFONE,ENDERECO,IDADE,ALTURA,PESO,DTNASCIMENTO)
VALUES(
	3000,
	'Elaine Cristina dos Santos',
	'3198520-9897',
	'Rua Limpeza 3443',
	44,
	1.65,
	66.4,
	'1976/01/22'
)

INSERT INTO ALUNO (MATRICULA, NOME,TELEFONE,ENDERECO,IDADE,ALTURA,PESO,DTNASCIMENTO)
VALUES(
	4000,
	'Luzia Augusta',
	'3198988-9897',
	'Rua Santos 43',
	18,
	1.65,
	55.3,
	'2002/11/02'
)

INSERT INTO ALUNO (MATRICULA, NOME,TELEFONE,ENDERECO,IDADE,ALTURA,PESO,DTNASCIMENTO)
VALUES(
	5000,
	'Aparecida Souza',
	'3194555-4444',
	'Av Março, 55, Iguaçu, Ipatinga',
	20,
	1.62,
	59.1,
	'2000/11/24'
)

INSERT INTO ALUNO (MATRICULA, NOME,TELEFONE,ENDERECO,IDADE,ALTURA,PESO,DTNASCIMENTO)
VALUES(
	6000,
	'Bruno Salvatori',
	'3194599-7744',
	'Av Barnabe, 7, Cidade Nobre, Ipatinga',
	22,
	1.92,
	75.9,
	'1997/4/04'
)

INSERT INTO ALUNO (MATRICULA, NOME,TELEFONE,ENDERECO,IDADE,ALTURA,PESO,DTNASCIMENTO)
VALUES(
	7000,
	'Maykom Matos',
	'3193255-4444',
	'Av Brasil, Belvederi, Ipatinga',
	15,
	1.72,
	62.2,
	'2005/1/2'
)

select * from ALUNO
USE EXERCICIO_1

SELECT * FROM ALUNO

INSERT INTO ALUNO (MATRICULA,NOME,TELEFONE,ENDERECO,IDADE,ALTURA,PESO) 
VALUES(
	2000,
	'Heithor Eliezer',
	'3199856-0002',
	'Rua Lácudia 223',
	13,
	1.60,
	37.0
);


/*exercicio 4*/
ALTER TABLE ALUNO
ADD SEXO CHAR(1)

/*EXERCICIO 5A*/
SELECT * FROM ALUNO

/*5B*/
SELECT NOME, IDADE 
FROM ALUNO
ORDER BY NOME DESC

/* 5C*/
SELECT NOME,TELEFONE
FROM ALUNO
WHERE IDADE < 18 AND IDADE > 59
ORDER BY TELEFONE, NOME

/* 5D*/
SELECT MATRICULA, NOME, TELEFONE
FROM ALUNO
WHERE ALTURA > 1.7

/*5E*/
UPDATE ALUNO
SET ALTURA = 0

select * from ALUNO

/*5F*/
UPDATE ALUNO
SET PESO = (PESO*(10/100) + PESO)
WHERE DTNASCIMENTO BETWEEN '01-01-1995' AND '31-12-2015' 

select * from ALUNO

/*5G*/
UPDATE ALUNO
SET ENDERECO = 'AV TIRADENTES, 83, CANAA, IPATINGA-MG'
WHERE MATRICULA = 10

/*5H*/
UPDATE ALUNO
SET IDADE = 10
WHERE YEAR(DTNASCIMENTO) = 2005

/*5I*/
DELETE
FROM ALUNO
WHERE MATRICULA = 5

/*5J*/
DELETE FROM ALUNO 
WHERE IDADE < 10

/*5K*/
DELETE FROM ALUNO
WHERE ALTURA BETWEEN 1.91 AND 2.20

/*5L*/
SELECT MATRICULA, NOME
FROM ALUNO
WHERE NOME LIKE 'M%'
ORDER BY ENDERECO DESC

/*5M*/
SELECT MATRICULA, IDADE
FROM ALUNO
WHERE NOME LIKE '%E'

/*5N*/
SELECT NOME, TELEFONE
FROM ALUNO
WHERE NOME LIKE '%ANO%'

/*5O*/
SELECT NOME, IDADE
FROM ALUNO
ORDER BY IDADE DESC

/*5P*/
SELECT TELEFONE, SEXO, PESO, ALTURA, IDADE
FROM ALUNO
ORDER BY IDADE, PESO, ALTURA DESC

/*5Q*/
SELECT MATRICULA, NOME, TELEFONE
FROM ALUNO
WHERE SEXO = 'M'

/*5R*/
SELECT MAX(PESO)
FROM ALUNO

/*5S*/
SELECT AVG(IDADE)
FROM ALUNO

/*5T*/
SELECT NOME, DTNASCIMENTO
FROM ALUNO
WHERE MONTH(DTNASCIMENTO) = 11 AND MONTH(DTNASCIMENTO) = 12

/*5U*/
SELECT COUNT(*) 
FROM ALUNO

SELECT * FROM ALUNO

/*5V*/
SELECT MIN(IDADE)
FROM ALUNO

/*EXERCICIO 6*/
DROP TABLE ALUNO
