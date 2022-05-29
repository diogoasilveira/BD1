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

ALTER TABLE ONLY public.tarefas DROP CONSTRAINT resp_cpf_fk;
ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_superior_cpf_fkey;
DROP TRIGGER teste ON public.tarefas;
DROP TRIGGER teste ON public.funcionario;
ALTER TABLE ONLY public.tarefas DROP CONSTRAINT tarefas_id_key;
ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_pkey;
DROP TABLE public.tarefas;
DROP TABLE public.funcionario;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: funcionario; Type: TABLE; Schema: public; Owner: diogoas
--

CREATE TABLE public.funcionario (
    cpf character(11) NOT NULL,
    data_nasc timestamp without time zone NOT NULL,
    nome text NOT NULL,
    funcao text NOT NULL,
    nivel character(1),
    superior_cpf character(11),
    CONSTRAINT funcionario_check CHECK ((((superior_cpf IS NOT NULL) AND (funcao = 'LIMPEZA'::text)) OR ((superior_cpf IS NULL) AND (funcao = 'SUP_LIMPEZA'::text)))),
    CONSTRAINT funcionario_chk CHECK (((nivel = 'J'::bpchar) OR (nivel = 'P'::bpchar) OR (nivel = 'S'::bpchar)))
);


ALTER TABLE public.funcionario OWNER TO diogoas;

--
-- Name: tarefas; Type: TABLE; Schema: public; Owner: diogoas
--

CREATE TABLE public.tarefas (
    id bigint NOT NULL,
    descricao text NOT NULL,
    func_resp_cpf character(11),
    prioridade integer NOT NULL,
    status character(1) NOT NULL,
    CONSTRAINT prioridade_chk CHECK (((prioridade > '-1'::integer) AND (prioridade < 6))),
    CONSTRAINT resp_cpf_chk CHECK ((((func_resp_cpf IS NOT NULL) AND ((status = 'E'::bpchar) OR (status = 'C'::bpchar))) OR (((func_resp_cpf IS NULL) OR (func_resp_cpf IS NOT NULL)) AND (status = 'P'::bpchar)))),
    CONSTRAINT status_chk CHECK (((status = 'P'::bpchar) OR (status = 'E'::bpchar) OR (status = 'C'::bpchar)))
);


ALTER TABLE public.tarefas OWNER TO diogoas;

--
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: diogoas
--

INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678911', '1980-05-07 00:00:00', 'Pedro da Silva', 'SUP_LIMPEZA', 'S', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678912', '1980-03-08 00:00:00', 'Jose da Silva', 'LIMPEZA', 'J', '12345678911');
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678914', '1990-01-10 00:00:00', 'Manoel da Silva', 'SUP_LIMPEZA', 'S', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678915', '2000-05-07 00:00:00', 'Marcos Andrade', 'SUP_LIMPEZA', 'J', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678916', '2002-09-07 00:00:00', 'Marcos Pimenta', 'LIMPEZA', 'P', '12345678914');
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678917', '2001-09-07 00:00:00', 'Bira Andrade', 'LIMPEZA', 'J', '12345678914');
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678918', '2000-12-17 00:00:00', 'José Andrade', 'LIMPEZA', 'S', '12345678914');
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678919', '2002-09-07 00:00:00', 'Ubirajara Andrade', 'SUP_LIMPEZA', 'P', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678920', '2002-09-10 00:00:00', 'Kerlon Bala', 'LIMPEZA', 'P', '12345678915');
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678921', '1998-10-27 00:00:00', 'Han Solo', 'SUP_LIMPEZA', 'S', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678922', '2002-05-13 00:00:00', 'Indiana Jones', 'LIMPEZA', 'P', '12345678919');
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678923', '2002-08-17 00:00:00', 'Josefino Pinto', 'LIMPEZA', 'S', '12345678919');
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('98765432111', '2002-08-17 00:00:00', 'Josefino Indra', 'SUP_LIMPEZA', 'S', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('98765432122', '2000-08-17 00:00:00', 'Junior Indra', 'LIMPEZA', 'S', '12345678911');
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('32323232955', '1980-05-05 00:00:00', 'Donkey Kong', 'LIMPEZA', 'S', '12345678911');
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('32323232911', '1980-10-12 00:00:00', 'Monkey D Luffy', 'LIMPEZA', 'P', '12345678911');


--
-- Data for Name: tarefas; Type: TABLE DATA; Schema: public; Owner: diogoas
--

INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (2147483646, 'limpar o chão do corredor central', '98765432111', 0, 'C');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (2147483647, 'limpar janelas da sala 203', '98765432122', 1, 'C');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (2147483648, 'limpar portas do térreo', '32323232955', 4, 'P');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (2147483651, 'limpar portas do 1o andar', '32323232911', 5, 'P');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (2147483652, 'limpar portas do 2o andar', '32323232911', 5, 'P');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (2147483653, 'limpar portas do 1o andar', '32323232911', 2, 'P');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (214748654, 'limpar o banheiro 1o andar', '12345678914', 2, 'E');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (214748655, 'limpar janelas do 1o andar', '12345678914', 0, 'C');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (214748656, 'limpar janelas do 2o andar', '12345678914', 1, 'P');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (214748657, 'limpar janelas do 3o andar', NULL, 1, 'P');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (214748658, 'limpar janelas do 4o andar', '12345678923', 1, 'C');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (214748659, 'limpar janelas do 5o andar', '12345678923', 1, 'P');


--
-- Name: funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (cpf);


--
-- Name: tarefas_id_key; Type: CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.tarefas
    ADD CONSTRAINT tarefas_id_key UNIQUE (id);


--
-- Name: teste; Type: TRIGGER; Schema: public; Owner: diogoas
--

CREATE TRIGGER teste AFTER INSERT OR DELETE OR UPDATE ON public.funcionario FOR EACH ROW EXECUTE PROCEDURE public.funcionario();


--
-- Name: teste; Type: TRIGGER; Schema: public; Owner: diogoas
--

CREATE TRIGGER teste AFTER INSERT OR DELETE OR UPDATE ON public.tarefas FOR EACH ROW EXECUTE PROCEDURE public.tarefas();


--
-- Name: funcionario_superior_cpf_fkey; Type: FK CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_superior_cpf_fkey FOREIGN KEY (superior_cpf) REFERENCES public.funcionario(cpf);


--
-- Name: resp_cpf_fk; Type: FK CONSTRAINT; Schema: public; Owner: diogoas
--

ALTER TABLE ONLY public.tarefas
    ADD CONSTRAINT resp_cpf_fk FOREIGN KEY (func_resp_cpf) REFERENCES public.funcionario(cpf) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

