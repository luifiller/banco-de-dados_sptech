-- PRÁTICA 3
-- EXERCÍCIO 1
-- Criar database
create database sprint2;

-- Selecionar database para ser utilizado
use sprint2;

-- Criar tabela de Atleta
create table Atleta (
	idAtleta int primary key auto_increment,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int     
);

-- Inserir dados na tablea
insert into Atleta (nome, modalidade, qtdMedalha) values
	('Adhemar Ferreira da Silva', 'Atletismo', 2),
	('Maurren Maggi', 'Atletismo', 1),
	('Aurélio Miguel', 'Judô', 2),
	('Cesar Cielo', 'Natação', 3),
	('Giba', 'Vôlei', 3),
	('Robert Scheidt', 'Vela', 5),
	('Peter Caio', 'Futebol', 3);
    
-- Criar tabela chamada País
create table Pais (
		idPais int primary key auto_increment,
        nome varchar(30),
        capital varchar(40)
);

-- Inserir dados de paises, pelo menos 4
insert into Pais (nome, capital) values
	('Brasil', 'Brasília'),
	('Argentina', 'Buenos Aires'),
	('Irlanda', 'Dublim'),
	('Noruega', 'Oslo'),
	('Lima', 'Lima');
    
-- Modealgem lógica -> Está no Moodle


-- Criar a chave estrangeira na tabela correspondente conforme modelagem;
alter table Atleta add column fkPais int;

alter table Atleta add constraint foreign key (fkPais)
	references Pais(idPais);

desc Atleta;

-- Atualizar o país de todos os atletas;
select * from Atleta;
select * from Pais;

update atleta set fkPais = 1 
	where idAtleta in (1, 3, 5);

update Atleta set fkPais = 2
	where idAtleta in (2, 4);
    
update Atleta set fkPais = 3
	where idAtleta = 6;
    
update Atleta set fkPais = 4
	where idAtleta = 7;

-- Exibir os atletas e seu respectivo país;
select * from Atleta join Pais
	on idPais = fkPais;
 
-- Exibir apenas o nome do atleta e o nome do respectivo país;
select Atleta.nome as Atleta, Pais.nome as Pais from Atleta
	join Pais on idPais = fkPais;

-- Exibir os dados dos atletas, seus respectivos países, de uma determinada capital
select Atleta.*, Pais.* from Atleta
	join Pais on idPais = fkPais
		where capital = 'Buenos Aires';
			-- ou pode ser feito o script abaixo 
        
select * from Atleta
	join Pais on idPais = fkPais
		where capital = 'Buenos Aires'; 
        
        
-- EXERCÍCIO 2
create database sprint2;

-- Selecionar database para ser utilizado
use sprint2;

-- Criar tabela Musica
create table Musica (
	idMusica int primary key auto_increment,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);

-- Inserir dados na tabela Musica
insert into Musica (titulo, artista, genero) values
	('Like Wooh Wooh', 'Rnbstylerz', 'EDM'),
	('The Nights', 'Avicci', 'EDM'),
	('Hey Brother', 'Avicci', 'EDM'),
	('Who Wants to Live Forever', 'Queen', 'Rock'),
	('Blinding Lights', 'The Weeknd', 'Pop'),
	('Powersnake', 'Brothers of Metal', 'Rock');

-- Criar tabela chamada Album
create table Album (
	idAlbum int primary key auto_increment,
    nome varchar(40),
    tipo char(7), constraint chkTipo check 
		(tipo in ('Digital', 'Físico')),
	dtLancamento date
);

select * from Album;

-- Inserir pelo menos 2 albuns
desc Album;

insert into Album (nome, tipo, dtLancamento) values
	('Albunzin Fuleira', 'Digital', '2022-08-07'),
	('Alo Alo, Sertão', 'Físico', '2021-12-25'),
	('Um Teste', 'Digital', '2022-02-15'),
	('Bonjour João', 'Digital', '2019-01-01'),
	('Montanha Russa', 'Digital', '2022-03-19');
    
-- Modealgem lógica -> Está no Moodle

-- Exibir todos os dados das tabelas separadamente;
select * from Musica;

select * from Album;

-- Criar a chave estrangeira na tabela de acordo com a regra de negócio;
alter table Musica add column fkAlbum int;

alter table Musica add constraint foreign key (fkAlbum)
	references Album(idAlbum);

-- Atualizar os álbuns de cada música;
select * from Musica;

update Musica set fkAlbum = 1
	where idMusica = 1;

update Musica set fkAlbum = 2
	where idMusica in (2, 3);

update Musica set fkAlbum = 3
	where idMusica = 4;    

update Musica set fkAlbum = 4
	where idMusica = 5;
    
update Musica set fkAlbum = 5
	where idMusica = 6;

-- Exibir as músicas e seus respectivos álbuns;
select * from Musica join Album 
	on idAlbum = fkAlbum;
 
-- Exibir somente o título da música e o nome do seu respectivo álbum;
select Musica.titulo as 'Titulo Música', Album.nome as 'Nome do Album' from Musica
	join Album on idAlbum = fkAlbum;

-- Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo
select Musica.*, Album.nome from Musica
	join Album on idAlbum = fkAlbum
		where tipo = 'Digital';