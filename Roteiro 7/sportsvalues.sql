--TIMES
INSERT INTO equipe VALUES (0001, 'Bahia', 'Salvador', 15);
INSERT INTO equipe VALUES (0002, 'Fortaleza', 'Fortaleza', 11);
INSERT INTO equipe VALUES (0003, 'Ceará', 'Fortaleza', 12);
INSERT INTO equipe VALUES (0004, 'Treze', 'Campina Grande', 13);
--INSERT INTO equipe VALUES (0005, 'Campinense', 'Campina Grande', 7);
--INSERT INTO equipe VALUES (0006, 'Botafogo', 'João Pessoa', 3);
--INSERT INTO equipe VALUES (0007, 'Sport Recife', 'Recife', 6);
--INSERT INTO equipe VALUES (0008, 'Brejo FC', 'Brejo do Cruz', 25);

--JOGADORES
INSERT INTO jogador VALUES ('11111111111', 'Josefino', 0001);
INSERT INTO jogador VALUES ('22222222222', 'Cláudio', 0001);
INSERT INTO jogador VALUES ('33333333333', 'Muriel', 0001);
INSERT INTO jogador VALUES ('44444444444', 'Batista', 0001);

INSERT INTO jogador VALUES ('55555555555', 'Manoel', 0002);
INSERT INTO jogador VALUES ('66666666666', 'Rafael', 0002);
INSERT INTO jogador VALUES ('77777777777', 'Mateus', 0002);
INSERT INTO jogador VALUES ('88888888888', 'José', 0002);

INSERT INTO jogador VALUES ('99999999999', 'Dantas', 0003);
INSERT INTO jogador VALUES ('12312312312', 'Xande', 0003);
INSERT INTO jogador VALUES ('12121212121', 'Santana', 0003);
INSERT INTO jogador VALUES ('13131313131', 'Zezo', 0003);

INSERT INTO jogador VALUES ('12345678912', 'Skibiribidup', 0004);
INSERT INTO jogador VALUES ('98765432198', 'Vando Trem Bala', 0004);
INSERT INTO jogador VALUES ('12312344455', 'Derxan', 0004);
INSERT INTO jogador VALUES ('77766677766', 'Freud', 0004);

--PARTIDAS
INSERT INTO partida VALUES (01, 00010101, '7x1', 0001,0002,0001);
INSERT INTO partida VALUES (02, 00010202, '2x1', 0001,0003,0001);
INSERT INTO partida VALUES (03, 00010303, '3x2', 0001,0004,0001);

--JOGADORPARTIDA
INSERT INTO jogadorpartida VALUES ('11111111111', 01, 'Centro', 3);
INSERT INTO jogadorpartida VALUES ('22222222222', 01, 'Frente', 2);
INSERT INTO jogadorpartida VALUES ('33333333333', 01, 'Trás', 1);
INSERT INTO jogadorpartida VALUES ('44444444444', 01, 'Gol', 0);

INSERT INTO jogadorpartida VALUES ('55555555555', 01, 'Centro', 0);
INSERT INTO jogadorpartida VALUES ('66666666666', 01, 'Frente', 0);
INSERT INTO jogadorpartida VALUES ('77777777777', 01, 'Trás', 0);
INSERT INTO jogadorpartida VALUES ('88888888888', 01, 'Gol', 1);

INSERT INTO jogadorpartida VALUES ('11111111111', 02, 'Centro', 1);
INSERT INTO jogadorpartida VALUES ('22222222222', 02, 'Frente', 0);
INSERT INTO jogadorpartida VALUES ('33333333333', 02, 'Trás', 1);
INSERT INTO jogadorpartida VALUES ('44444444444', 02, 'Gol', 0);

INSERT INTO jogadorpartida VALUES ('99999999999', 02, 'Centro', 0);
INSERT INTO jogadorpartida VALUES ('12312312312', 02, 'Frente', 1);
INSERT INTO jogadorpartida VALUES ('12121212121', 02, 'Trás', 0);
INSERT INTO jogadorpartida VALUES ('13131313131', 02, 'Gol', 0);

INSERT INTO jogadorpartida VALUES ('11111111111', 03, 'Centro', 0);
INSERT INTO jogadorpartida VALUES ('22222222222', 03, 'Frente', 1);
INSERT INTO jogadorpartida VALUES ('33333333333', 03, 'Trás', 1);
INSERT INTO jogadorpartida VALUES ('44444444444', 03, 'Gol', 1);

INSERT INTO jogadorpartida VALUES ('12345678912', 03, 'Centro', 1);
INSERT INTO jogadorpartida VALUES ('98765432198', 03, 'Frente', 0);
INSERT INTO jogadorpartida VALUES ('12312344455', 03, 'Trás', 1);
INSERT INTO jogadorpartida VALUES ('77766677766', 03, 'Gol', 0);