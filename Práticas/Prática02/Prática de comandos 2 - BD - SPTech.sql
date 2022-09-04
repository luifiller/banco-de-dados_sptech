-- EXERCÍCIO 1

create database sprint1;

use sprint1;

-- Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha (int, representando a quantidade de medalhas que o atleta possui)
create table Atleta (
	idAtleta int primary key auto_increment,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int
);

-- Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade e pelo menos 5 atletas.
insert into Atleta (nome, modalidade, qtdMedalha) values
	('Adhemar Ferreira da Silva', 'Atletismo', 2),
	('Maurren Maggi', 'Atletismo', 1),
	('Aurélio Miguel', 'Judô', 2),
	('Cesar Cielo', 'Natação', 3),
	('Giba', 'Vôlei', 3),
	('Robert Scheidt', 'Vela', 5),
	('Peter Caio', 'Futebol', 3);

-- Exibir todos os dados da tabela.
select * from Atleta;

-- Atualizar a quantidade de medalhas do atleta com id=1;
update Atleta set qtdMedalha = 5
	where idAtleta = 1;

-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
update Atleta set qtdMedalha = 6
	where idAtleta in (2, 3);
    
-- Atualizar o nome do atleta com o id=4;
update Atleta set nome = 'João Pedro'
	where idAtleta = 4;

-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
alter table Atleta add column dtNasc date;

-- Atualizar a data de nascimento de todos os atletas;
update Atleta set dtNasc = '1987-03-22'
	where idAtleta = 1;

update Atleta set dtNasc = '1967-08-12'
	where idAtleta = 2;

update Atleta set dtNasc = '1999-08-18'
	where idAtleta = 3;
    
update Atleta set dtNasc = '1997-04-06'
	where idAtleta = 4;

update Atleta set dtNasc = '1975-02-28'
	where idAtleta = 5;

update Atleta set dtNasc = '1989-07-15'
	where idAtleta = 6;
    
update Atleta set dtNasc = '1985-05-30'
	where idAtleta = 7;

-- Excluir o atleta com o id=5;
delete from Atleta where idAtleta = 5;

-- Exibir os atletas onde a modalidade é diferente de natação;
select * from Atleta
	where modalidade <> 'Natação';

-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
select * from Atleta
	where qtdMedalha >=3;

-- Modificar o campo modalidade do tamanho 40 para o tamanho 60;
alter table Atleta modify modalidade varchar(60);

-- Descrever os campos da tabela mostrando a atualização do campo modalidade;
desc Atleta;

-- Limpar os dados da tabela;
truncate table Atleta;


-- EXERCÍCIO 2
create database sprint1;

use sprint1;

-- Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista (tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela
create table Musica (
	idMusica int primary key auto_increment,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);

-- Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo menos umas 7 músicas.
insert into Musica (titulo, artista, genero) values
	('Like Wooh Wooh', 'Rnbstylerz', 'EDM'),
	('The Nights', 'Avicci', 'EDM'),
	('Hey Brother', 'Avicci', 'EDM'),
	('Wake Me Up', 'Avicci', 'EDM'),
	('Who Wants to Live Forever', 'Queen', 'Rock'),
	('Still Loving You', 'Scorpions', 'Rock'),
	('Blinding Lights', 'The Weeknd', 'Pop'),
	('Powersnake', 'Brothers of Metal', 'Rock');
    
-- a) Exibir todos os dados da tabela.
select * from Musica;

-- b) Adicionar o campo curtidas do tipo int na tabela;
alter table Musica add column curtidas int;

-- c) Atualizar o campo curtidas de todas as músicas inseridas;
update Musica set curtidas = 12 where idMusica = 1;
update Musica set curtidas = 30 where idMusica = 2;
update Musica set curtidas = 15 where idMusica = 3;
update Musica set curtidas = 22 where idMusica = 4;
update Musica set curtidas = 9 where idMusica = 5;
update Musica set curtidas = 189 where idMusica = 6;
update Musica set curtidas = 256 where idMusica = 7;
update Musica set curtidas = 56 where idMusica = 8;

-- d) Modificar o campo artista do tamanho 40 para o tamanho 80;
alter table Musica modify artista varchar(80);

-- e) Atualizar a quantidade de curtidas da música com id=1;
update Musica set curtidas = 78
	where idMusica = 1;

-- f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
update Musica set curtidas = 41
	where idMusica in (2, 3);

-- g) Atualizar o nome da música com o id=5;
update Musica set titulo = 'Evidencias'
	where idMusica = 5;

-- h) Excluir a música com o id=4;
delete from Musica where idMusica = 4;

-- i) Exibir as músicas onde o gênero é diferente de funk;
select * from Musica
	where genero <> 'funk';

-- j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;
select * from Musica
	where curtidas >=20;

-- k) Descrever os campos da tabela mostrando a atualização do campo artista;
desc Musica;

-- l) Limpar os dados da tabela; 
truncate table Musica;


-- EXERCÍCIO 3
create database sprint1;

use sprint1;

-- Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero (tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.
create table Filme (
	idFilme int primary key auto_increment,
    titulo varchar(50),
    genero varchar(40),
    diretor varchar(40)
);

-- Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos uns 7 filmes.
insert into Filme (titulo, genero, diretor) values
	('A viagem de Chihiro', 'Fantasia', 'Hayao Miyazaki'),
	('Tudo por uma esmeralda', 'Aventura', 'Robert Zemeckis' ),
	('Indiana Jones e os caçadores da arca perdida', 'Aventura', 'Steven Spielberg'),
	('A múmia', 'Aventura', 'Stephen Sommers'),
	('Transformes', 'Ação', 'Michael Bay'),
	('It: a coisa', 'Terror', 'Andrés Muschietti'),
	('Annabelle', 'Terror', 'John R. Leonetti'),
	('Jurassic Park', 'Ficção científica', 'Steven Spielberg'),
    ('ET - O Extraterrestre', 'Ficção científica', 'Steven Spielberg');
    
-- Exibir todos os dados da tabela.
select * from Filme;

-- Adicionar o campo protagonista do tipo varchar(50) na tabela;
alter table Filme add column protagonista varchar(50);

-- Atualizar o campo protagonista de todas os filmes inseridos;
update Filme set protagonista = 'Jonas Jonh' where idFilme = 1;
update Filme set protagonista = 'João Cleiton' where idFilme = 2;
update Filme set protagonista = 'Prestes Jonh' where idFilme = 3;
update Filme set protagonista = 'Luiz Filler' where idFilme = 4;
update Filme set protagonista = 'Dorian McCartney' where idFilme = 5;
update Filme set protagonista = 'José Luiz' where idFilme = 6;
update Filme set protagonista = 'Pedro Pedroso' where idFilme = 7;
update Filme set protagonista = 'Valentina Vlato' where idFilme = 8;
update Filme set protagonista = 'Junior Unior' where idFilme = 9;

-- Modificar o campo diretor do tamanho 40 para o tamanho 150;
alter table Filme modify diretor varchar(150);

-- Atualizar o diretor do filme com id=5;
update Filme set diretor = 'João Clemente'
	where idFilme = 5;

-- Atualizar o diretor dos filmes com id=2 e com o id=7;
update Filme set diretor = 'Jonas Brothers'
	where idFilme in (2, 7);

-- Atualizar o título do filme com o id=6;
update Filme set titulo = 'As aventuras do Chaves'
	where idFilme = 6;

-- Excluir o filme com o id=3;
delete from Filme where idFilme = 3;

-- Exibir os filmes em que o gênero é diferente de drama;
select * from Filme 
	where genero <> 'drama';

-- Exibir os dados dos filmes que o gênero é igual ‘suspense’;
select * from Filme
	where genero = 'suspense';

-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor;
desc Filme;

-- Limpar os dados da tabela;
drop table Filme;


-- EXERCÍCIO 4
create database sprint1;

use sprint1;

-- Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50), especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da tabela.
create table Professor (
	idProfessor int primary key auto_increment,
    nome varchar(50),
    especialidade varchar(40),
    dtNasc date
);

-- Inserir dados na tabela, procurando colocar uma especialista para mais de um professor. Procure inserir pelo menos uns 6 professores.
insert into Professor (nome, especialidade, dtNasc) values
	('José Luiz', 'Psicologia Experimental', '1988-08-06'),
	('Romero Brito', 'Psicanálise', '1982-05-21'),
	('Chaulin Zéias', 'Psicoterapia Analítica Funcional', '1973-12-15'),
	('Cristiane Male', 'Psicologia Humanista', '1965-03-12'),
	('Moisés Pinto', 'Psicanálise', '1988-11-06'),
	('Isais Pessotti', 'Psicologia Experimental', '1976-07-26'),
	('Roberto Banaco', 'Psicologia Experimental', '1980-08-18'),
	('Jocelaine da Silva', 'Psicoterapia Analítica Funcional', '1992-01-01');
    
-- a) Exibir todos os dados da tabela.
select * from Professor;

-- b) Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’, ‘assistente’ ou ‘titular’;
alter table Professor add column funcao varchar(50), add constraint chkFuncao check 
	(funcao in ('monitor', 'assistente', 'titular'));

-- c) Atualizar os professores inseridos e suas respectivas funções;
update Professor set funcao = 'titular' where idProfessor = 1;
update Professor set funcao = 'assistente' where idProfessor = 2;
update Professor set funcao = 'assistente' where idProfessor = 3;
update Professor set funcao = 'monitor' where idProfessor = 4;
update Professor set funcao = 'titular' where idProfessor = 5;
update Professor set funcao = 'titular' where idProfessor = 6;
update Professor set funcao = 'assistente' where idProfessor = 7;
update Professor set funcao = 'monitor' where idProfessor = 8;

-- d) Inserir um novo professor;
insert into Professor (nome, especialidade, dtNasc, funcao) values
	('Roger Monster', 'Análise e Desenvolvimento de Sistemas', '1995-08-18', 'monitor');

-- e) Excluir o professor onde o idProfessor é igual a 5;
delete from Professor where idProfessor = 5;

-- f) Exibir apenas os nomes dos professores titulares;
select * from Professor 
	where funcao = 'titular';

-- g) Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
select especialidade, dtNasc from Professor 
	where funcao = 'monitor';

-- h) Atualizar a data de nascimento do idProfessor igual a 3;
update Professor set dtNasc = '1986-05-26'
	where idProfessor = 3;

-- i) Limpar a tabela Professor;
truncate table Professor;


-- EXERCÍCIO 5
create database sprint1;

use sprint1;

-- Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla (tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.
create table Curso (
	idCurso int primary key auto_increment,
    nome varchar(50),
    sigla char(3),
    coordenador varchar(80)
);

-- Inserir dados na tabela, procure inserir pelo menos 3 cursos
insert into Curso (nome, sigla, coordenador) values
	('Análise e Desenvolvimento de Sistemas', 'ADS', 'Luiz Nison Filler'),
	('Ciência da Computação', 'CCO', 'José Luiz Pereira da Silva'),
	('Sistemas de Informação', 'SI', 'Pedro Pedroso'),
	('Psicologia', 'PSI', 'Lucas Silva'),
	('Arquitetura e Urbanismo', 'ARQ', 'Lucas Castro');

-- a) Exibir todos os dados da tabela.
select * from Curso;

-- b) Exibir apenas os coordenadores dos cursos.
select coordenador from Curso;

-- c) Exibir apenas os dados dos cursos de uma determinada sigla.
select * from Curso
	where sigla = 'ADS';

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
	where nome like '_n%';

-- i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
select * from Curso
	where nome like '%m_';

-- j) Elimine a tabela.
drop table Curso;


-- EXERCÍCIO 6
create database sprint1;

use sprint1;

-- Criar a tabela chamada Revista para conter os campos: idRevista (int e chave primária da tabela), nome (varchar, tamanho 40), categoria (varchar, tamanho 30). Os valores de idRevista devem iniciar com o valor 1 e ser incrementado automaticamente pelo sistema.
create table Revista (
	idRevista int primary key auto_increment,
    nome varchar(40),
    categoria varchar(30)
);

-- Inserir 4 registros na tabela, mas sem informar a categoria.
insert into Revista (nome) values
	('Isto é'),
    ('Época'),
    ('Nature'),
    ('Veja');
    
-- Exibir todos os dados da tabela.
select * from Revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
update Revista set categoria = 'Noticia' where idRevista = 1;
update Revista set categoria = 'Ciência' where idRevista = 3;
update Revista set categoria = 'Noticia' where idRevista = 4;

-- Insira mais 3 registros completos.
insert into Revista (nome, categoria) values
	('Abc do amor', 'Fofoca'),
	('VrumVrum', 'Carros'),
	('Yummy', 'Culinaria');

-- Exibir novamente os dados da tabela.
select * from Revista;

-- Exibir a descrição da estrutura da tabela.
desc Revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table Revista modify categoria varchar(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
desc Revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table Revista add column periodicidade varchar(15);

-- Exibir os dados da tabela.
select * from Revista;

-- Excluir a coluna periodicidade da tabela.
alter table Revista drop column periodicidade;
