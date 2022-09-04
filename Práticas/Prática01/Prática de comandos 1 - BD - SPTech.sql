-- EXERCÍCIO 1 
-- Criar banco de dados
create database sprint1;

-- Selecionar banco de dados para ser utilizado
use sprint1;

-- Criar tabela 
create table atleta (
	idAtelta int primary key auto_increment,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int
);

-- Inserir dados na tabela
insert into atleta(nome, modalidade, qtdMedalha) values
	('Adhemar Ferreira da Silva', 'Atletismo', 2),
	('Maurren Maggi', 'Atletismo', 1),
	('Aurélio Miguel', 'Judô', 2),
	('Cesar Cielo', 'Natação', 3),
	('Giba', 'Vôlei', 3),
	('Robert Scheidt', 'Vela', 5),
	('Peter Caio', 'Futebol', 3);

-- Exibir todo os dados da tabela 
select * from atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas
select nome, qtdMedalha from atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade
select * from atleta 
	where modalidade = 'Atletismo';

-- Exibir os dados da tabela ordenados pela modalidade
select * from atleta order by modalidade asc;

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente
select * from atleta order by qtdMedalha desc;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra 's'
select * from atleta 
	Where nome like '%s%';
    
-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra
select * from atleta
	where nome like 'A%';
    
-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra 'o'
select * from atleta
	where nome like '%o';
    
-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra 'r'.
select * from atleta
	where nome like '%r_';
    
-- Eliminar a tabela
drop table atleta;


-- EXERCÍCIO 2
-- Criar banco de dados
create database sprint1;

-- Selecionar o banco de dados para ser utilizado
use sprint1;

-- Criar tabela 
create table Musica(
	idMusica int primary key,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);

-- Inserir dados na tabela 
insert into Musica values
	(1, 'Like Wooh Wooh', 'Rnbstylerz', 'EDM'),
	(2, 'The Nights', 'Avicci', 'EDM'),
	(3, 'Hey Brother', 'Avicci', 'EDM'),
	(4, 'Wake Me Up', 'Avicci', 'EDM'),
	(5, 'Who Wants to Live Forever', 'Queen', 'Rock'),
	(6, 'Still Loving You', 'Scorpions', 'Rock'),
	(7, 'Blinding Lights', 'The Weeknd', 'Pop'),
	(8, 'Powersnake', 'Brothers of Metal', 'Rock');

-- a) Exibir todos os dados da tabela
select * from Musica;

-- b) Exibir apenas os títulos e artistas das músicas
select titulo, artista from musica;

-- c) Exibir apenas os dados das músicas de um determinado gênero
select * from musica
	where genero = 'Rock';
    
-- d) Exibir apenas os dados das músicas de um determinado artista
select * from musica
	where artista = 'Avicci';
    
-- e) Exibir os dados da tabela ordenados pelo título da música
select * from musica order by titulo asc;

-- f) Exibir os dados da tabela ordenados pelo artista em ordem decrescente.
select * from musica order by artista desc;

-- g) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra
select * from musica 
	where titulo like 'W%';
    
-- h) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
select * from musica
	where artista like '%n';
    
-- i) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra
select * from musica
	where genero like '_o%';
    
-- j) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra
select * from musica
	where titulo like '%e_';
    
-- k) Elimine a tabela
drop table musica;


-- EXERCÍCIO 3 
-- Criar database
create database sprint1;

-- Usar tabela 
use sprint1;

-- Criar tabela
create table Filme(
	idFilme int primary key,
	titulo varchar(50),
	genero varchar(40),
	diretor varchar(40)
);

-- Inserir dados na tabela 
insert into Filme values
	(1, 'A viagem de Chihiro', 'Fantasia', 'Hayao Miyazaki'),
	(2, 'Tudo por uma esmeralda', 'Aventura', 'Robert Zemeckis' ),
	(3, 'Indiana Jones e os caçadores da arca perdida', 'Aventura', 'Steven Spielberg'),
	(4, 'A múmia', 'Aventura', 'Stephen Sommers'),
	(5, 'Transformes', 'Ação', 'Michael Bay'),
	(6, 'It: a coisa', 'Terror', 'Andrés Muschietti'),
	(7, 'Annabelle', 'Terror', 'John R. Leonetti'),
	(8, 'Jurassic Park', 'Ficção científica', 'Steven Spielberg'),
    (9, 'ET - O Extraterrestre', 'Ficção científica', 'Steven Spielberg');

-- Exibir todos os dados da tabela
select * from filme;

-- Exibir apenas os títulos e os diretores dos filmes.
select titulo, diretor from filme;

-- Exibir apenas os dados dos filmes de um determinado gênero.
select * from filme
	where genero = 'Aventura';

-- Exibir apenas os dados dos filmes de um determinado diretor.
select * from filme
	where diretor = 'Steven Spielberg';

-- Exibir os dados da tabela ordenados pelo título do filme.
select * from filme order by titulo asc;

-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
select * from filme order by diretor desc;

-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
select * from filme
	where titulo like 'A%';

-- Exibir os dados da tabela, dos filmes cujo artista termine com uma determinada letra.
select * from filme
	where diretor like '%i';

-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra.
select * from filme
	where genero like '_v%';

-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra.
select * from filme
	where titulo like '%d_';

-- Elimine a tabela.
drop table filme;


-- EXERCÍCIO 4
-- Criar banco de dados
create database sprint1;

-- Usar banco de dados
use sprint1;

-- Criar tabela 
create table Professor(
	idProfessor int primary key,
	nome varchar(50),
	especialidade varchar(40),
	dNasc date
);

-- Inserir dados na tabela 
insert into professor values
	(1, 'José Luiz', 'Psicologia Experimental', '1988-08-06'),
	(2, 'Romero Brito', 'Psicanálise', '1982-05-21'),
	(3, 'Chaulin Zéias', 'Psicoterapia Analítica Funcional', '1973-12-15'),
	(4, 'Cristiane Male', 'Psicologia Humanista', '1965-03-12'),
	(5, 'Moisés Pinto', 'Psicanálise', '1988-11-06'),
	(6, 'Isais Pessotti', 'Psicologia Experimental', '1976-07-26'),
	(7, 'Roberto Banaco', 'Psicologia Experimental', '1980-08-18'),
	(8, 'Jocelaine da Silva', 'Psicoterapia Analítica Funcional', '1992-01-01');

-- a) Exibir todos os dados da tabela.
select * from Professor;

-- b) Exibir apenas as especialidades dos professores.
select especialidade from Professor;

-- c) Exibir apenas os dados dos professores de uma determinada especialidade.
select * from Professor
	where especialidade = 'Psicologia Experimental';

-- d) Exibir os dados da tabela ordenados pelo nome do professor.
select * from Professor order by nome asc;

-- e) Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
select * from Professor order by dNasc desc;

-- f) Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra.
select * from Professor 
	where nome like 'R%';

-- g) Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra.
select * from Professor
	where nome like '%o';

-- h) Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
select * from Professor
	where nome like '_o%';

-- i) Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
select * from Professor
	where nome like '%t_';

-- j) Elimine a tabela
drop table Professor;


-- EXERCÍCIO 5
-- Criar banco de dados
create database sprint1;

-- Usar banco de dados
use sprint1;

-- Criar tabela
create table Curso(
	idCurso int primary key,
    nome varchar(50),
    sigla char(3),
    coordenador varchar(50)
);

-- Inserir dados na tabela
insert into Curso values
	(1, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Luiz Nison Filler'),
	(2, 'Ciência da Computação', 'CCO', 'José Luiz Pereira da Silva'),
	(3, 'Sistemas de Informação', 'SI', 'Pedro Pedroso'),
	(4, 'Psicologia', 'PSI', 'Lucas Silva'),
	(5, 'Arquitetura e Urbanismo', 'ARQ', 'Lucas Castro');
    
-- a) Exibir todos os dados da tabela.
select * from Curso;

-- b) Exibir apenas os coordenadores dos cursos.
select coordenador from Curso;

-- c) Exibir apenas os dados dos cursos de uma determinada sigla.
select * from Curso
	where sigla = 'PSI';

-- d) Exibir os dados da tabela ordenados pelo nome do curso.
select * from Curso order by nome asc;

-- e) Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
select * from Curso order by coordenador desc;

-- f) Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from Curso
	where nome like 'A%';

-- g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from Curso
	where nome like '%o';

-- h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
select * from Curso
	where nome like '_i%';

-- i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
select * from Curso
	where nome like '%a_';

-- j) Elimine a tabela.
    drop table Curso;


-- EXERCÍCIO 6
-- Criar database 
create database sprint1;

-- Usar database
use sprint1;

-- Criar tabela 
create table Revistas(
	idRevista int primary key auto_increment,
    nome varchar(40),
    categoria varchar(30)
);

-- Inserir dados na tabela
insert into Revistas(nome) values
	('Isto é'),
    ('Época'),
    ('Nature'),
    ('Veja');

-- Exibir todos os dados da tabela
select * from Revistas;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente
update Revistas set categoria ='Notícia'
	where idRevista in (1,2,4);
 select * from Revistas;
 
 -- Inserir mais 3 registros completos
 insert into Revistas(nome, categoria) values
	('Quatro Rodas', 'Carros'),
	('Placar', 'Esporte'),
	('Auto', 'Carros');
    
-- Exibir novamente os dados da tabela
select * from Revistas;

-- Exibir a descrição da estrutura da tabela
desc Revistas;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres
alter table Revistas
	modify categoria varchar(40);
   
-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
desc Revistas;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15)
alter table Revistas
	add periodicidade varchar(15)
    after categoria;

-- Exibir os dados da tabela 
select * from Revistas;

-- Excluir a coluna periodicidade da tabela
alter table Revistas
	drop column periodicidade;
    
-- Excluir o banco de dados sprint1
drop database sprint1;