CREATE DATABASE Guerra_Da_Ucrânia;
USE Guerra_Da_Ucrânia;

CREATE TABLE Tb_União_Soviética_1991(
ID_Participantes_Soviéticos INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Participantes_União_Soviética_1991 VARCHAR (30) UNIQUE
);

INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Rússia');
INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Ucrânia');
INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Bielo-Rússia');
INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Uzbequistão');
INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Cazaquistão');
INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Geórgia');
INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Azerbaijão');
INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Lituânia');
INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Moldávia');
INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Letônia');
INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Quirguistão');
INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Tajiquistão');
INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Armênia');
INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Turcomenistão');
INSERT INTO tb_União_Soviética_1991 (Participantes_União_Soviética_1991) VALUES ('Estônia');

SELECT*FROM Tb_União_Soviética_1991 ORDER BY Participantes_União_Soviética_1991;

SELECT
  COUNT(Participantes_União_Soviética_1991) AS TOTAL
FROM
  tb_União_Soviética_1991;
CREATE TABLE tb_Guerra_Fria(
ID_Participantes_Guerra_Fria INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Participantes_Guerra_Fria VARCHAR (30) UNIQUE NOT NULL,
Modelo_Economico VARCHAR (50) NOT NULL
);

INSERT INTO tb_Guerra_Fria (Participantes_Guerra_Fria,Modelo_Economico) VALUES ('Estados Unidos', 'Capitalismo');
INSERT INTO tb_Guerra_Fria (Participantes_Guerra_Fria,Modelo_Economico) VALUES ('União Soviética', 'Socialismo');

DROP TABLE tb_União_Soviética_1991;

CREATE TABLE tb_Principais_Membros_OTAN(
ID_Participantes_OTAN INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Participantes_Otan VARCHAR (30) UNIQUE
);

INSERT INTO tb_Principais_Membros_OTAN (Participantes_Otan)  VALUES ('Estados Unidos');
INSERT INTO tb_Principais_Membros_OTAN (Participantes_Otan) VALUES ('Alemanha');
INSERT INTO tb_Principais_Membros_OTAN (Participantes_Otan) VALUES ('Bélgica');
INSERT INTO tb_Principais_Membros_OTAN (Participantes_Otan) VALUES ('Canadá');
INSERT INTO tb_Principais_Membros_OTAN (Participantes_Otan) VALUES ('Reino Unido');
INSERT INTO tb_Principais_Membros_OTAN (Participantes_Otan) VALUES ('França');
INSERT INTO tb_Principais_Membros_OTAN (Participantes_Otan) VALUES ('Itália');
INSERT INTO tb_Principais_Membros_OTAN (Participantes_Otan) VALUES ('Portugal');

ALTER TABLE tb_Principais_Membros_OTAN ADD Situação VARCHAR (30) NOT NULL;

UPDATE tb_Principais_Membros_OTAN SET Situação = 'Ativo' WHERE ID_Participantes_OTAN =1;
UPDATE tb_Principais_Membros_OTAN SET Situação = 'Ativo' WHERE ID_Participantes_OTAN =2;
UPDATE tb_Principais_Membros_OTAN SET Situação = 'Ativo' WHERE ID_Participantes_OTAN =3;
UPDATE tb_Principais_Membros_OTAN SET Situação = 'Ativo' WHERE ID_Participantes_OTAN =4;
UPDATE tb_Principais_Membros_OTAN SET Situação = 'Ativo' WHERE ID_Participantes_OTAN =5;
UPDATE tb_Principais_Membros_OTAN SET Situação = 'Ativo' WHERE ID_Participantes_OTAN =6;
UPDATE tb_Principais_Membros_OTAN SET Situação = 'Ativo' WHERE ID_Participantes_OTAN =7;
UPDATE tb_Principais_Membros_OTAN SET Situação = 'Ativo' WHERE ID_Participantes_OTAN =8;

SELECT
  COUNT(Participantes_Otan) AS TOTAL
FROM
 tb_Principais_Membros_OTAN;
 
SELECT Participantes_Otan FROM  tb_Principais_Membros_OTAN WHERE ID_Participantes_OTAN > 1;
 
INSERT INTO tb_Principais_Membros_OTAN (Participantes_Otan,Situação) VALUES ('Ucrânia', 'Interessado');
 
 CREATE TABLE tb_Arsenal_Russo(
 ID_Armas INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 Nome_Armas VARCHAR (30) UNIQUE NOT NULL,
 Preço_Armas VARCHAR (30) NOT NULL,
 Quantidade_Armas VARCHAR (30) NOT NULL
 );
 
INSERT INTO tb_Arsenal_Russo (Nome_Armas,Preço_Armas,Quantidade_Armas) VALUES ('AK47', '8500', 20);
INSERT INTO tb_Arsenal_Russo (Nome_Armas,Preço_Armas,Quantidade_Armas) VALUES ('Desert Eagle', '3500', 15);
INSERT INTO tb_Arsenal_Russo (Nome_Armas,Preço_Armas,Quantidade_Armas) VALUES ('Granadas', '1000', 90);
INSERT INTO tb_Arsenal_Russo (Nome_Armas,Preço_Armas,Quantidade_Armas) VALUES ('UZI', '2000', 10);
INSERT INTO tb_Arsenal_Russo (Nome_Armas,Preço_Armas,Quantidade_Armas) VALUES ('MP5', '3500', 15);

SELECT
  MAX(Preço_Armas) AS MAIOR_PREÇO
FROM
  tb_Arsenal_Russo;
  
  SELECT
  MIN(Preço_Armas) AS MENOR_PREÇO
FROM
  tb_Arsenal_Russo;
  
  SELECT
 AVG(Preço_Armas) AS PREÇO_MEDIO
FROM
tb_Arsenal_Russo;

DELETE FROM tb_Principais_Membros_OTAN  WHERE ID_Participantes_OTAN=9;

CREATE TABLE tb_Sanções(
ID_Sanção INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
ID_Membro_Otan INT,
FOREIGN KEY (ID_Membro_Otan) REFERENCES tb_Principais_Membros_OTAN (ID_Participantes_OTAN),
Sanção_Sugerida VARCHAR (500) NOT NULL
);

INSERT INTO tb_Sanções(ID_Membro_Otan,Sanção_Sugerida) VALUES (1,'Exportação de Medicamentos mais cara');
INSERT INTO tb_Sanções(ID_Membro_Otan,Sanção_Sugerida) VALUES (1,'Exportação de Alimentos mais cara');
INSERT INTO tb_Sanções(ID_Membro_Otan,Sanção_Sugerida) VALUES (5,'Exportação de Chá mais cara');
INSERT INTO tb_Sanções(ID_Membro_Otan,Sanção_Sugerida) VALUES (7,'Exportação de massas mais cara');
INSERT INTO tb_Sanções(ID_Membro_Otan,Sanção_Sugerida) VALUES (8,'Exportação de ouro brasileiro mais cara');
INSERT INTO tb_Sanções(ID_Membro_Otan,Sanção_Sugerida) VALUES (1,'Exportação de Matéria-Prima mais cara');

SELECT DISTINCT ID_Membro_Otan FROM tb_Sanções;

SET FOREIGN_KEY_CHECKS =0;
TRUNCATE tb_Arsenal_Russo;
SET FOREIGN_KEY_CHECKS =1;

SELECT*FROM Tb_União_Soviética_1991;
SELECT*FROM tb_Guerra_Fria;
SELECT*FROM tb_Principais_Membros_OTAN;
SELECT*FROM tb_Arsenal_Russo;
SELECT*FROM tb_Sanções;
