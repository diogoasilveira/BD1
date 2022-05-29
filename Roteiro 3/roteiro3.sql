CREATE TABLE FARMACIAS(
id int UNIQUE,
nome text,
estado char(2),
cidade varchar(50),
bairro varchar(20),
tipo texto,
gerente char(11) UNIQUE;

CREATE TABLE FUNCIONARIOS(
cpf char(11) UNIQUE,
nome text,
funcao text CHECK(funcao = 'farmaceutico' or funcao = 'vendedor' or funcao = 'entregador' or funcao = 'caixa' or funcao = 'administrador'),
gerente boolean,
farmacia int REFERENCES farmacias (id));

CREATE TABLE MEDICAMENTOS(
id int,
nome text,
preco numeric,
tarja char(1) CHECK(tarja = 'A' or tarja = 'V' or tarja = 'P' or tarja IS NULL));

CREATE TABLE VENDAS(
id serial,
medicamento int REFERENCES medicamentos (id),
cliente char(11),
farmacia int REFERENCES farmacias (id),
funcionario char(11) REFERENCES funcionarios (cpf));

CREATE TABLE CLIENTES(
cpf char(11),
idade int,
nome text,
endereco text);

CREATE TABLE ENTREGAS(
id serial,
farmacia int,
cliente char(11) REFERENCES clientes (cpf));
