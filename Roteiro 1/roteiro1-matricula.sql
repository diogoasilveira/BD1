--PRIMEIRA QUESTÃO
automóvel: placa, modelo, ano, dono
segurado: nome, cpf, idade, sexo
perito: nome, cpf
oficina: nome, endereço, nota
seguro: num, tipo, segurado, automóvel, início, validade
sinestro: num, sinistro, hora do sinistro, tipo da perda, local do sinistro, segurado
pericia: num, perito, resultado, tipo da perda, valor do reparo
reparo: num, reparo, valor

--SEGUNDA QUESTÃO
CREATE TABLE AUTOMOVEL(
placa char(7),
modelo varchar(50),
ano char(4),
dono varchar(100));

CREATE TABLE SEGURADO(
nome varchar(100),
cpf char(11),
idade integer,
sexo char(1));

CREATE TABLE PERITO(
nome varchar(100),
cpf char(11));

CREATE TABLE OFICINA(
nome varchar(100),
endereco varchar(200),
nota numeric);

CREATE TABLE SEGURO(
num char(5),
tipo varchar(50),
segurado char(11),
automovel varchar(50),
inicio date,
validade date);

CREATE TABLE SINISTRO(
num char(5),
sinistro varchar(50),
hora_sinistro timestamp,
tipo_perda varchar(10),
local_sinistro varchar(200),
segurado char(11));

CREATE TABLE PERICIA(
num char(5),
perito varchar(100),
resultado text,
tipo_perda text,
valor_reparo numeric);

CREATE TABLE REPARO(
num char(5),
reparo text,
valor numeric);

--TERCEIRA QUESTÃO
ALTER TABLE automovel ADD CONSTRAINT automovel_pkey PRIMARY KEY (placa);
ALTER TABLE oficina ADD CONSTRAINT oficina_pkey PRIMARY KEY (nome);
ALTER TABLE pericia ADD CONSTRAINT pericia_pkey PRIMARY KEY (num);
ALTER TABLE perito ADD CONSTRAINT perito_pkey PRIMARY KEY (cpf);
ALTER TABLE reparo ADD CONSTRAINT reparo_pkey PRIMARY KEY (num);
ALTER TABLE segurado ADD CONSTRAINT segurado_pkey PRIMARY KEY (cpf);
ALTER TABLE seguro ADD CONSTRAINT seguro_pkey PRIMARY KEY (num);
ALTER TABLE sinistro ADD CONSTRAINT sinistro_pkey PRIMARY KEY (num);


DROP TABLE automovel;
DROP TABLE oficina;
DROP TABLE pericia;
DROP TABLE perito;
DROP TABLE reparo;
DROP TABLE segurado;
DROP TABLE seguro;
DROP TABLE sinistro;
