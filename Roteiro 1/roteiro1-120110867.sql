--PRIMEIRA QUESTÃO
--automóvel: placa, modelo, ano, dono
--segurado: nome, cpf, idade, sexo
--perito: nome, cpf
--oficina: nome, endereço, nota
--seguro: num, tipo, segurado, automóvel, início, validade
--sinestro: num, sinistro, hora do sinistro, tipo da perda, local do sinistro, segurado
--pericia: num, perito, resultado, tipo da perda, valor do reparo
--reparo: num, reparo, valor

--SEGUNDA QUESTÃO
CREATE TABLE AUTOMOVEL(
placa char(7),
modelo varchar(50),
ano char(4),
dono char(11));

CREATE TABLE SEGURADO(
nome varchar(100),
cpf char(11),
idade integer,
sexo char(1));

CREATE TABLE PERITO(
nome varchar(100),
cpf char(11));

CREATE TABLE OFICINA(
num char(5),
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
ALTER TABLE oficina ADD CONSTRAINT oficina_pkey PRIMARY KEY (num);
ALTER TABLE pericia ADD CONSTRAINT pericia_pkey PRIMARY KEY (num);
ALTER TABLE perito ADD CONSTRAINT perito_pkey PRIMARY KEY (cpf);
ALTER TABLE reparo ADD CONSTRAINT reparo_pkey PRIMARY KEY (num);
ALTER TABLE segurado ADD CONSTRAINT segurado_pkey PRIMARY KEY (cpf);
ALTER TABLE seguro ADD CONSTRAINT seguro_pkey PRIMARY KEY (num);
ALTER TABLE sinistro ADD CONSTRAINT sinistro_pkey PRIMARY KEY (num);

--QUARTA QUESTÃO
ALTER TABLE automovel ADD CONSTRAINT automovel_dono_fkey FOREIGN KEY (dono) REFERENCES segurado (cpf);
ALTER TABLE seguro ADD CONSTRAINT seguro_segurado_fkey FOREIGN KEY (segurado) REFERENCES segurado (cpf);
ALTER TABLE sinistro ADD CONSTRAINT sinistro_segurado_fkey FOREIGN KEY (segurado) REFERENCES segurado (cpf);
ALTER TABLE pericia ADD CONSTRAINT pericia_perito_fkey FOREIGN KEY (perito) REFERENCES perito (cpf);

--QUINTA QUESTÃO
Atributos que devem/podem ser NOT NULL: 
automóvel: dono
oficina: endereço
perícia: perito, resultado
perito: nome
reparo: reparo, valor
segurado: nome
seguro: segurado, automóvel, início, validade, tipo
sinistro: segurado, hora, local, sinistro

--SEXTA QUESTÃO
DROP TABLE sinistro;
DROP TABLE seguro;
DROP TABLE automovel;
DROP TABLE segurado;
DROP TABLE pericia;
DROP TABLE perito;
DROP TABLE oficina;
DROP TABLE reparo;

--SÉTIMA QUESTÃO
CREATE TABLE AUTOMOVEL(
placa char(7) CONSTRAINT automovel_pkey PRIMARY KEY,
modelo varchar(50) NOT NULL,
ano char(4),
dono char(11) NOT NULL,
CONSTRAINT automovel_dono_fkey FOREIGN KEY (dono) REFERENCES segurado (cpf));

CREATE TABLE SEGURADO(
nome varchar(100),
cpf char(11) CONSTRAINT segurado_pkey PRIMARY KEY,
idade integer,
sexo char(1));

CREATE TABLE PERITO(
nome varchar(100),
cpf char(11) CONSTRAINT perito_pkey PRIMARY KEY);

CREATE TABLE OFICINA(
num char(5) CONSTRAINT oficina_pkey PRIMARY KEY,
nome varchar(100) NOT NULL,
endereco varchar(200) NOT NULL,
nota numeric);

CREATE TABLE SEGURO(
num char(5) CONSTRAINT seguro_pkey PRIMARY KEY,
tipo varchar(50) NOT NULL,
segurado char(11) ,
automovel varchar(50) NOT NULL,
inicio date NOT NULL,
validade date NOT NULL,
CONSTRAINT seguro_segurado_fkey FOREIGN KEY (segurado) REFERENCES segurado (cpf));

CREATE TABLE SINISTRO(
num char(5) CONSTRAINT sinistro_pkey PRIMARY KEY,
sinistro varchar(50) NOT NULL,
hora_sinistro timestamp NOT NULL,
tipo_perda varchar(10),
local_sinistro varchar(200) NOT NULL,
segurado char(11),
CONSTRAINT sinistro_segurado_fkey FOREIGN KEY (segurado) REFERENCES segurado (cpf));

CREATE TABLE PERICIA(
num char(5) CONSTRAINT pericia_pkey PRIMARY KEY,
perito char(11) NOT NULL,
resultado text NOT NULL,
tipo_perda text,
valor_reparo numeric,
CONSTRAINT pericia_perito_fkey FOREIGN KEY (perito) REFERENCES perito (cpf));

CREATE TABLE REPARO(
num char(5) CONSTRAINT reparo_pkey PRIMARY KEY,
reparo text NOT NULL,
valor numeric);

--OITAVA QUESTÃO (em ordem de criação)
CREATE TABLE SEGURADO(
nome varchar(100),
cpf char(11) CONSTRAINT segurado_pkey PRIMARY KEY,
idade integer,
sexo char(1));

CREATE TABLE AUTOMOVEL(
placa char(7) CONSTRAINT automovel_pkey PRIMARY KEY,
modelo varchar(50) NOT NULL,
ano char(4),
dono char(11) NOT NULL,
CONSTRAINT automovel_dono_fkey FOREIGN KEY (dono) REFERENCES segurado (cpf));

CREATE TABLE PERITO(
nome varchar(100),
cpf char(11) CONSTRAINT perito_pkey PRIMARY KEY);

CREATE TABLE REPARO(
num char(5) CONSTRAINT reparo_pkey PRIMARY KEY,
reparo text NOT NULL,
valor numeric);

CREATE TABLE SINISTRO(
num char(5) CONSTRAINT sinistro_pkey PRIMARY KEY,
sinistro varchar(50) NOT NULL,
hora_sinistro timestamp NOT NULL,
tipo_perda varchar(10),
local_sinistro varchar(200) NOT NULL,
segurado char(11),
CONSTRAINT sinistro_segurado_fkey FOREIGN KEY (segurado) REFERENCES segurado (cpf));

CREATE TABLE PERICIA(
num char(5) CONSTRAINT pericia_pkey PRIMARY KEY,
perito char(11) NOT NULL,
resultado text NOT NULL,
tipo_perda text,
valor_reparo numeric,
CONSTRAINT pericia_perito_fkey FOREIGN KEY (perito) REFERENCES perito (cpf));

CREATE TABLE SEGURO(
num char(5) CONSTRAINT seguro_pkey PRIMARY KEY,
tipo varchar(50) NOT NULL,
segurado char(11) ,
automovel varchar(50) NOT NULL,
inicio date NOT NULL,
validade date NOT NULL,
CONSTRAINT seguro_segurado_fkey FOREIGN KEY (segurado) REFERENCES segurado (cpf));

CREATE TABLE OFICINA(
num char(5) CONSTRAINT oficina_pkey PRIMARY KEY,
nome varchar(100) NOT NULL,
endereco varchar(200) NOT NULL,
nota numeric);

--NONA QUESTÃO
DROP TABLE sinistro;
DROP TABLE seguro;
DROP TABLE automovel;
DROP TABLE segurado;
DROP TABLE pericia;
DROP TABLE perito;
DROP TABLE oficina;
DROP TABLE reparo;

--DÉCIMA QUESTÃO
-- Não por enquanto, mas provavelmente existem atributos úteis para pesquisa que ainda precisam ser adicionados ao banco de dados.
