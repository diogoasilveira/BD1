-- Table: Equipe
CREATE TABLE Equipe (
    id int  NOT NULL,
    nome text  NOT NULL,
    cidade text  NOT NULL,
    pontos int  NOT NULL,
    CONSTRAINT IdNome PRIMARY KEY (id)
);

-- Table: Jogador
CREATE TABLE Jogador (
    CPF char(11)  NOT NULL,
    nome text  NOT NULL,
    numeroCamisa int  NOT NULL,
    equipeJogador int  NOT NULL,
    CONSTRAINT Jogador_pk PRIMARY KEY (CPF)
);

-- Table: JogadorPartida
CREATE TABLE JogadorPartida (
    jogadorCPF char(11)  NOT NULL,
    idPartida int  NOT NULL,
    posicao text  NOT NULL,
    golsMarcados int  NULL,
    CONSTRAINT JogadorPartida_pk PRIMARY KEY (jogadorCPF,idPartida)
);

-- Table: Partida
CREATE TABLE Partida (
    idPartida int  NOT NULL,
    data date  NOT NULL,
    placar char(3)  NOT NULL,
    timeCasa int  NOT NULL,
    timeFora int  NOT NULL,
    resultado int  NOT NULL,
    CONSTRAINT Partida_pk PRIMARY KEY (idPartida)
);

-- foreign keys
-- Reference: Equipe_Jogador (table: Jogador)
ALTER TABLE Jogador ADD CONSTRAINT Equipe_Jogador
    FOREIGN KEY (equipeJogador)
    REFERENCES Equipe (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: JogadorPartida_Jogador (table: JogadorPartida)
ALTER TABLE JogadorPartida ADD CONSTRAINT JogadorPartida_Jogador
    FOREIGN KEY (jogadorCPF)
    REFERENCES Jogador (CPF)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: JogadorPartida_Partida (table: JogadorPartida)
ALTER TABLE JogadorPartida ADD CONSTRAINT JogadorPartida_Partida
    FOREIGN KEY (idPartida)
    REFERENCES Partida (idPartida)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: timeCasaFK (table: Partida)
ALTER TABLE Partida ADD CONSTRAINT timeCasaFK
    FOREIGN KEY (timeCasa)
    REFERENCES Equipe (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: timeForaFK (table: Partida)
ALTER TABLE Partida ADD CONSTRAINT timeForaFK
    FOREIGN KEY (timeFora)
    REFERENCES Equipe (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

--TIMES
INSERT INTO equipe VALUES (0001, 'Bahia', 'Salvador', 15);
INSERT INTO equipe VALUES (0002, 'Fortaleza', 'Fortaleza', 11);
INSERT INTO equipe VALUES (0003, 'Ceará', 'Fortaleza', 12);
INSERT INTO equipe VALUES (0004, 'Treze', 'Campina Grande', 13);

--JOGADORES
INSERT INTO jogador VALUES ('11111111111', 'Josefino', 10, 0001);
INSERT INTO jogador VALUES ('22222222222', 'Cláudio', 9, 0001);
INSERT INTO jogador VALUES ('33333333333', 'Muriel', 7, 0001);
INSERT INTO jogador VALUES ('44444444444', 'Batista', 3, 0001);

INSERT INTO jogador VALUES ('55555555555', 'Manoel', 10, 0002);
INSERT INTO jogador VALUES ('66666666666', 'Rafael', 12, 0002);
INSERT INTO jogador VALUES ('77777777777', 'Mateus', 11, 0002);
INSERT INTO jogador VALUES ('88888888888', 'José', 01, 0002);

INSERT INTO jogador VALUES ('99999999999', 'Dantas',69, 0003);
INSERT INTO jogador VALUES ('12312312312', 'Xande',14, 0003);
INSERT INTO jogador VALUES ('12121212121', 'Santana',13, 0003);
INSERT INTO jogador VALUES ('13131313131', 'Zezo',171, 0003);

INSERT INTO jogador VALUES ('12345678912', 'Skibiribidup',12, 0004);
INSERT INTO jogador VALUES ('98765432198', 'Vando Trem Bala',15, 0004);
INSERT INTO jogador VALUES ('12312344455', 'Derxan',157, 0004);
INSERT INTO jogador VALUES ('77766677766', 'Freud',00, 0004);

--PARTIDAS
INSERT INTO partida VALUES (01, '0001-01-01', '7x1', 0001,0002,0001);
INSERT INTO partida VALUES (02, '0001-02-02', '2x1', 0001,0003,0001);
INSERT INTO partida VALUES (03, '0001-03-03', '3x2', 0001,0004,0001);
INSERT INTO partida VALUES (04, '0001-03-03', '3x2', 0004,0002,0004);

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