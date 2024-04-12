create database Escola;
use Escola;

create table ALUNO(
     RA bigint primary key,
     NOME varchar(50),
     DTCAD date,
     CURSO enum("DS", "REDES"),
     TURNO enum("MATUTINO", "VESPERTINO", "NOTURNO")
);

create table PROFESSOR(
    ID int primary key,
    NOME varchar(50),
    GRAU enum("MESTRE", "ESPECIALISTA", "GRADUADO")
);

create table DISCIPLINA(
    ID int auto_increment primary key,
    UC varchar(50),
    IDPROF int,
    foreign key(IDPROF) references PROFESSOR(ID)
);

create table NOTA(
    IDDISC int,
    RA bigint,
    NOTA1 float,
    NOTA2 float,
    MEDIA float,
    STATU enum ("APROVADO", "RECUPERAÇÃO", "REPROVADO"),
    foreign key(IDDISC) references DISCIPLINA(ID),
    foreign key(RA) references ALUNO(RA),
    primary key(IDDISC, RA)
);

insert into ALUNO(RA, NOME, DTCAD, CURSO, TURNO) values
(20758519, "Leticia Mascarenhas", "2023-01-30", "DS", "VESPERTINO"),
(20758520, "Ramon Papes", "2023-01-30", "DS", "VESPERTINO"),
(20758521, "Luis Henrique", "2023-07-31", "REDES", "NOTURNO"),
(20758522, "Joseane Silva", "2023-07-31", "REDES", "NOTURNO");

insert into PROFESSOR(ID, NOME, GRAU) values
(7934, "Jailson Santos", "MESTRE"),
(7935, "Jailson Rodrigues", "ESPECIALISTA"),
(7936, "Westn Silva", "GRADUADO"),
(7937, "Jose Marivaldo", "MESTRE");

insert into DISCIPLINA(UC, IDPROF) values
("BANCO DE DADOS", 7934),
("FUNDAMENTOS DE TI", 7935),
("PROGRAMAÇÃO WEB", 7936),
("REDES", 7937);

insert into NOTA(RA, IDDISC, NOTA1, NOTA2) values
(20758519, 1, 8.0, 8.2),
(20758519, 2, 9.0, 5.0),
(20758519, 3, 8.7, 7.3),
(20758519, 4, 8.4, 10.0),
(20758520, 1, 5.0, 5.0),
(20758520, 2, 4.2, 7.8),
(20758520, 3, 1.8, 10.0),
(20758520, 4, 7.0, 8.9),
(20758521, 1, 7.2, 6.6),
(20758521, 2, 7.4, 6.2),
(20758521, 3, 8.0, 7.4),
(20758521, 4, 8.2, 9.0),
(20758522, 1, 0.0, 2.2),
(20758522, 2, 5.4, 3.3),
(20758522, 3, 5.8, 6.0),
(20758522, 4, 4.0, 6.0);

select * from NOTA;
truncate table NOTA;

DELIMITER $
create trigger trg_Media before insert
on NOTA
for each row
begin
    set new.MEDIA = (new.NOTA1 + new.NOTA2) / 2;
end $

create trigger trg_Status before insert
on NOTA
for each row
begin
    if new.MEDIA >= 6 then
        set new.STATU = "APROVADO";
    elseif new.MEDIA >= 4 then
        set new.STATU = "RECUPERAÇÃO";
    else
        set new.STATU = "REPROVADO";
    end if;
end $
DELIMITER ;

DELIMITER $

CREATE TRIGGER trg_Estatisticas
AFTER INSERT ON NOTA
FOR EACH ROW
BEGIN
    DECLARE total_aprovados INT DEFAULT 0;
    DECLARE total_recuperacao INT DEFAULT 0;
    DECLARE total_reprovados INT DEFAULT 0;
    
    SELECT COUNT(*) INTO total_aprovados
    FROM NOTA
    WHERE IDDISC = NEW.IDDISC AND STATU = 'APROVADO';
    
    SELECT COUNT(*) INTO total_recuperacao
    FROM NOTA
    WHERE IDDISC = NEW.IDDISC AND STATU = 'RECUPERAÇÃO';
    
    SELECT COUNT(*) INTO total_reprovados
    FROM NOTA
    WHERE IDDISC = NEW.IDDISC AND STATU = 'REPROVADO';
    
    UPDATE DISCIPLINA
    SET APROVADOS = total_aprovados, RECUPERACAO = total_recuperacao, REPROVADOS = total_reprovados
    WHERE ID = NEW.IDDISC;
    
    DELETE FROM ALUNO
    WHERE RA IN (
        SELECT RA
        FROM NOTA
        WHERE STATU = 'REPROVADO'
    );
END $
