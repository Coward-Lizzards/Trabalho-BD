create database RPG_ASSIST;

CREATE TYPE Sistema_RPG AS ENUM ('DND5e', 'DND3e', 'Tormenta', 'Storyteller');
CREATE TYPE Impacto AS ENUM ('Baixo', 'Médio', 'Alto');


create table Campanha (
	Id serial primary key,
	Nome varchar(50),
	Mestre varchar(50),
	Data_Inicio DATE,
	Sistema Sistema_RPG not null 
);

create table Sessao (
	Id serial primary key,
	id_Campanha int references Campanha(Id) on delete cascade,
	Data_Sessao Date,
	Hora_Sessao Time
);

CREATE TABLE ParticipacaoSessao (
    PRIMARY KEY (id_Sessao, id_Personagem),
    id_Sessao INT REFERENCES Sessao(Id) ON DELETE CASCADE,
    id_Personagem INT REFERENCES Personagens(Id) ON DELETE CASCADE
);

create table Personagens (
	Id serial primary key,
	id_Campanha int references Campanha(Id) on delete cascade,
	Nome varchar(50),
	Classe varchar(50),
	Raca varchar(50)
);

create table Eventos_Marcantes (
	Id serial primary key,
	id_Campanha int references Campanha(Id) on delete cascade,
	id_Sessao int references Sessao(Id) on delete cascade,
	Impacto int
);

create table Players (
	Id serial primary key,
	id_Personagem INT REFERENCES Personagens(Id) ON DELETE cascade,
	id_Campanha int references Campanha(Id) on delete cascade,
	Nome varchar(50)
);


-- corrigindo meus erros oops


alter table Eventos_Marcantes
drop column Impacto;

alter table Eventos_Marcantes
add Impacto Impacto not null;

alter table Eventos_Marcantes
add Nome varchar(50);

-- INSERTS

INSERT INTO Campanha (Nome, Mestre, Data_Inicio, Sistema)
VALUES
    ('A Grande Guerra', 'Mestre1', '2024-11-01', 'DND5e'),
    ('A Batalha Final', 'Mestre2', '2024-10-15', 'DND3e'),
    ('Mistério nas Sombras', 'Mestre3', '2024-09-30', 'Tormenta'),
    ('Desafio Supremo', 'Mestre4', '2024-08-20', 'Storyteller'),
    ('Aventura das Estrelas', 'Mestre5', '2024-07-10', 'DND5e');

   
INSERT INTO Sessao (id_Campanha, Data_Sessao, Hora_Sessao)
VALUES
    (1, '2024-11-10', '19:00:00'),
    (2, '2024-10-25', '20:00:00'),
    (3, '2024-09-15', '18:30:00'),
    (4, '2024-08-25', '21:00:00'),
    (5, '2024-07-15', '16:00:00');

   
INSERT INTO Personagens (id_Campanha, Nome, Classe, Raca)
VALUES
    (1, 'Aragon', 'Guerreiro', 'Humano'),
    (1, 'Legolas', 'Arqueiro', 'Elfo'),
    (2, 'Gimli', 'Anão', 'Anão'),
    (3, 'Morgana', 'Mago', 'Humano'),
    (4, 'Hades', 'Ladrão', 'Meio-Orc');

   
   
INSERT INTO Players (id_Personagem, id_Campanha, Nome)
VALUES
    (1, 1, 'Jogador1'),
    (2, 1, 'Jogador2'),
    (3, 2, 'Jogador3'),
    (4, 3, 'Jogador4'),
    (5, 4, 'Jogador5');

   
INSERT INTO ParticipacaoSessao (id_Sessao, id_Personagem)
VALUES
    (1, 1), (1, 2), (2, 3), (3, 4), (4, 5);

   
INSERT INTO Eventos_Marcantes (id_Campanha, id_Sessao, Impacto, Nome)
VALUES
    (1, 1, 'Médio', 'A Batalha do Dragão'),
    (2, 2, 'Alto', 'A Queda do Império'),
    (3, 3, 'Baixo', 'O Tesouro Esquecido'),
    (4, 4, 'Médio', 'A Última Aliança'),
    (5, 5, 'Alto', 'O Despertar dos Deuses');

   
select * from Personagens;

