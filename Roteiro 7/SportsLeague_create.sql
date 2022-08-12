-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-07-31 00:49:26.884

-- tables
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

-- End of file.

