create database supermercado;
Use supermercado;

create table Fornecedor (CNPJ varchar (15) primary key not null, RazaoSocial varchar(100), NomeFantasia varchar(50),
Contato varchar(20), IE int, Telefone1 varchar(20), Telefone2 varchar(20), WhatsApp varchar(20),
Email varchar(100), Endereco varchar(100), Cep varchar(10), Bairro varchar(30), Cidade varchar(30), UF varchar(2), 
Pais varchar(30));

create table Funcionario(MatFunc int primary key not null, NomeFunc varchar(50), DtNasc date, DtAdmissao date, 
CPF varchar(15), CNH varchar(15), RG varchar(15), Genero varchar(10), EstadoCivil varchar(15), CargoFuncao varchar(20), 
Telefone1 varchar(20), Telefone2 varchar(20), WhatsApp varchar(20),
Email varchar(100), Endereco varchar(100), Cep varchar(10), Bairro varchar(30), Cidade varchar(30), UF varchar(2), 
Pais varchar(30));

create table Produto(CodBarra varchar(25) primary key not null, Descricao varchar(50), Marca varchar(30), ValCompra real,
 ValVenda real, CNPJ varchar(15) unique, DtFab date, DtVal date, Lote varchar(5), Peso varchar(5), Umedida varchar(5), 
 QtdEstocada int, QtdMinima int, Categoria varchar(20),
 
 CONSTRAINT fk_CNPJ FOREIGN KEY (CNPJ) REFERENCES Fornecedor (CNPJ));
 
create table Venda(IdVenda int auto_increment primary key, MatFunc int unique, DtVenda date, 
HrVenda time, Desconto real, Total real,

CONSTRAINT fk_MatFunc FOREIGN KEY (MatFunc) REFERENCES Funcionario (MatFunc));

create table ItensVenda(IdVenda int, CodBarra varchar(25) unique, QtdVendida int, SubTotal real,

CONSTRAINT fk_IdVenda FOREIGN KEY (IdVenda) REFERENCES Venda (IdVenda),
CONSTRAINT fk_CodBarra FOREIGN KEY (CodBarra) REFERENCES Produto (CodBarra),
CONSTRAINT pk_IV_CB primary key(IdVenda,CodBarra));

create table Pedido(CodPedido int auto_increment primary key, CodBarra varchar(25) unique, CNPJ varchar(15) unique,
MatFunc int unique, DtPedido date, QtdPedida int,

CONSTRAINT fk_CodBarra_Pedido FOREIGN KEY (CodBarra) REFERENCES Produto (CodBarra),
CONSTRAINT fk_CNPJ_Pedido FOREIGN KEY (CNPJ) REFERENCES Fornecedor (CNPJ),
CONSTRAINT fk_MatFunc_Pedido FOREIGN KEY (MatFunc) REFERENCES Funcionario (MatFunc));

insert into Fornecedor (CNPJ, RazaoSocial, NomeFantasia, Contato, IE, Telefone1, Telefone2,
WhatsApp, Email, Endereco, Cep, Bairro, Cidade, UF, Pais) values ('10100123456', 'Coca-Cola S/A', 
'Coca-Cola', 'Maria Eduarda', 465447,'(71)99456-8989','(71)98456-0089','(71)98456-0089',
'jjs2004@gmail.com','Rua das flores, s/n', '40.210-700','Federação', 'Salvador','BA','Brasil');

select * from Fornecedor;
