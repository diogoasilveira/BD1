--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.24
-- Dumped by pg_dump version 9.5.24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.vendas DROP CONSTRAINT vendas_medicamento_fkey;
ALTER TABLE ONLY public.vendas DROP CONSTRAINT vendas_funcionario_fkey;
ALTER TABLE ONLY public.vendas DROP CONSTRAINT vendas_farmacia_fkey;
ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_farmacia_fkey;
ALTER TABLE ONLY public.entregas DROP CONSTRAINT entregas_cliente_fkey;
DROP TRIGGER teste ON public.vendas;
DROP TRIGGER teste ON public.medicamentos;
DROP TRIGGER teste ON public.funcionarios;
DROP TRIGGER teste ON public.farmacias;
DROP TRIGGER teste ON public.entregas;
DROP TRIGGER teste ON public.clientes;
ALTER TABLE ONLY public.farmacias DROP CONSTRAINT sede_exclude;
ALTER TABLE ONLY public.medicamentos DROP CONSTRAINT id_unique;
ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_cpf_key;
ALTER TABLE ONLY public.farmacias DROP CONSTRAINT farmacias_pkey;
ALTER TABLE ONLY public.farmacias DROP CONSTRAINT farmacias_id_key;
ALTER TABLE ONLY public.farmacias DROP CONSTRAINT farmacias_gerente_key;
ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_cpf_key;
ALTER TABLE public.vendas ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.entregas ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.vendas_id_seq;
DROP TABLE public.vendas;
DROP TABLE public.medicamentos;
DROP TABLE public.funcionarios;
DROP TABLE public.farmacias;
DROP SEQUENCE public.entregas_id_seq;
DROP TABLE public.entregas;
DROP TABLE public.clientes;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: clientes; Type: TABLE; Schema: public; Owner: diogoas
--

CREATE TABLE public.clientes (
    cpf character(11),
    nome text,
    endereco text,
    CONSTRAINT clientes_endereco_check CHECK (((endereco = 'casa'::text) OR (endereco = 'trabalho'::text) OR (endereco = 'outro'::text)))
);


ALTER TABLE public.clientes OWNER TO diogoas;

--
-- Name: entregas; Type: TABLE; Schema: public; Owner: diogoas
--

CREATE TABLE public.entregas (
    id integer NOT NULL,
    farmacia integer,
    cliente character(11)
);


ALTER TABLE public.entregas OWNER TO diogoas;

--
-- Name: entregas_id_seq; Type: SEQUENCE; Schema: public; Owner: diogoas
--

CREATE SEQUENCE public.entregas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entregas_id_seq OWNER TO diogoas;

--
-- Name: entregas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: diogoas
--

ALTER SEQUENCE public.entregas_id_seq OWNED BY public.entregas.id;


--
-- Name: farmacias; Type: TABLE; Schema: public; Owner: diogoas
--

CREATE TABLE public.farmacias (
    id integer NOT NULL,
    nome text,
    estado character(2),
    cidade character varying(50),
    bairro character varying(20),
    tipo text,
    gerente character(11)
);


ALTER TABLE public.farmacias OWNER TO diogoas;

--
-- Name: funcionarios; Type: TABLE; Schema: public; Owner: diogoas
--

CREATE TABLE public.funcionarios (
    cpf character(11),
    nome text,
    funcao text,
    gerente boolean,
    farmacia integer,
    CONSTRAINT funcionarios_funcao_check CHECK (((funcao = 'farmaceutico'::text) OR (funcao = 'vendedor'::text) OR (funcao = 'entregador'::text) OR (funcao = 'caixa'::text) OR (funcao = 'administrador'::text))),
    CONSTRAINT gerente_check CHECK (((((funcao = 'administrador'::text) OR (funcao = 'farmaceutico'::text)) AND (gerente = true)) OR (gerente = false)))
);


ALTER TABLE public.funcionarios OWNER TO diogoas;

--
-- Name: medicamentos; Type: TABLE; Schema: public; Owner: diogoas
--

CREATE TABLE public.medicamentos (
    id integer,
    nome text,
    preco numeric,
    tarja character(1),
    CONSTRAINT medicamentos_tarja_check CHECK (((tarja = 'A'::bpchar) OR (tarja = 'V'::bpchar) OR (tarja = 'P'::bpchar) OR (tarja IS NULL)))
);


ALTER TABLE public.medicamentos OWNER TO diogoas;

--
-- Name: vendas; Type: TABLE; Schema: public; Owner: diogoas
--

CREATE TABLE public.vendas (
    id integer NOT NULL,
    medicamento integer,
    cliente character(11),
    farmacia integer,
    funcionario character(11)
);


ALTER TABLE public.vendas OWNER TO diogoas;

--
-- Name: vendas_id_seq; Type: SEQUENCE; Schema: public; Owner: diogoas
--

CREATE SEQUENCE public.vendas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendas_id_seq OWNER TO diogoas;

--
-- Name: vendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: diogoas
--

ALTER SEQUENCE public.vendas_id_seq OWNED BY public.vendas.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.entregas ALTER COLUMN id SET DEFAULT nextval('public.entregas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.vendas ALTER COLUMN id SET DEFAULT nextval('public.vendas_id_seq'::regclass);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: diogoas
--



--
-- Data for Name: entregas; Type: TABLE DATA; Schema: public; Owner: diogoas
--



--
-- Name: entregas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: diogoas
--

SELECT pg_catalog.setval('public.entregas_id_seq', 1, false);


--
-- Data for Name: farmacias; Type: TABLE DATA; Schema: public; Owner: diogoas
--



--
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: public; Owner: diogoas
--



--
-- Data for Name: medicamentos; Type: TABLE DATA; Schema: public; Owner: diogoas
--



--
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: diogoas
--



--
-- Name: vendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: diogoas
--

SELECT pg_catalog.setval('public.vendas_id_seq', 1, false);


--
-- Name: clientes_cpf_key; Type: CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cpf_key UNIQUE (cpf);


--
-- Name: farmacias_gerente_key; Type: CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.farmacias
    ADD CONSTRAINT farmacias_gerente_key UNIQUE (gerente);


--
-- Name: farmacias_id_key; Type: CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.farmacias
    ADD CONSTRAINT farmacias_id_key UNIQUE (id);


--
-- Name: farmacias_pkey; Type: CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.farmacias
    ADD CONSTRAINT farmacias_pkey PRIMARY KEY (id);


--
-- Name: funcionarios_cpf_key; Type: CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_cpf_key UNIQUE (cpf);


--
-- Name: id_unique; Type: CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT id_unique UNIQUE (id);


--
-- Name: sede_exclude; Type: CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.farmacias
    ADD CONSTRAINT sede_exclude EXCLUDE USING gist (tipo WITH =) WHERE ((tipo = 'sede'::text));


--
-- Name: teste; Type: TRIGGER; Schema: public; Owner: diogoas
--

CREATE TRIGGER teste AFTER INSERT OR DELETE OR UPDATE ON public.clientes FOR EACH ROW EXECUTE PROCEDURE public.clientes();


--
-- Name: teste; Type: TRIGGER; Schema: public; Owner: diogoas
--

CREATE TRIGGER teste AFTER INSERT OR DELETE OR UPDATE ON public.entregas FOR EACH ROW EXECUTE PROCEDURE public.entregas();


--
-- Name: teste; Type: TRIGGER; Schema: public; Owner: diogoas
--

CREATE TRIGGER teste AFTER INSERT OR DELETE OR UPDATE ON public.farmacias FOR EACH ROW EXECUTE PROCEDURE public.farmacias();


--
-- Name: teste; Type: TRIGGER; Schema: public; Owner: diogoas
--

CREATE TRIGGER teste AFTER INSERT OR DELETE OR UPDATE ON public.funcionarios FOR EACH ROW EXECUTE PROCEDURE public.funcionarios();


--
-- Name: teste; Type: TRIGGER; Schema: public; Owner: diogoas
--

CREATE TRIGGER teste AFTER INSERT OR DELETE OR UPDATE ON public.medicamentos FOR EACH ROW EXECUTE PROCEDURE public.medicamentos();


--
-- Name: teste; Type: TRIGGER; Schema: public; Owner: diogoas
--

CREATE TRIGGER teste AFTER INSERT OR DELETE OR UPDATE ON public.vendas FOR EACH ROW EXECUTE PROCEDURE public.vendas();


--
-- Name: entregas_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.entregas
    ADD CONSTRAINT entregas_cliente_fkey FOREIGN KEY (cliente) REFERENCES public.clientes(cpf);


--
-- Name: funcionarios_farmacia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_farmacia_fkey FOREIGN KEY (farmacia) REFERENCES public.farmacias(id);


--
-- Name: vendas_farmacia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_farmacia_fkey FOREIGN KEY (farmacia) REFERENCES public.farmacias(id);


--
-- Name: vendas_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_funcionario_fkey FOREIGN KEY (funcionario) REFERENCES public.funcionarios(cpf);


--
-- Name: vendas_medicamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_medicamento_fkey FOREIGN KEY (medicamento) REFERENCES public.medicamentos(id);


--
-- PostgreSQL database dump complete
--

