-- Criar um banco de dados chamado Venda
create database avalicaoGrupo;

-- Selecionar banco de dados
use avalicaoGrupo;

-- Criar tabelas correspondentes à modelagem
create table grupo (
	idGrupo int primary key auto_increment,
    nomeGrupo varchar(45),
    descricao varchar(255)
);

create table aluno (
	ra varchar(45) primary key,
    nomeAluno varchar(45),
    emailAluno varchar(45),
    fkGrupo int, foreign key (fkGrupo)
		references grupo(idGrupo)
);

create table professor (
	idProfessor int primary key auto_increment,
    nomeProfessor varchar(45),
    disciplina varchar(45)
) auto_increment = 10000;

create table avaliacaoGrupo (
	idAvaliacaoGrupo int auto_increment,
    fkProfessor int, foreign key (fkProfessor)
		references professor(idProfessor),
	fkGrupo int, foreign key (fkGrupo)
		references grupo(idGrupo),
	primary key (idAvaliacaoGrupo, fkProfessor, fkGrupo),
    dtAvaliacao datetime,
    nota decimal(4,2)
);

-- Inserir dados nas tabelas, de forma que exista mais de uma venda para cada cliente, e mais de um cliente sendo indicado por outro cliente.
insert into grupo values 
	(null, "Alert Center", "Monitoramento de temperatura e umidade em data centers"),
	(null, "Bright Tech", "Monitoramento de fluxo de pessoas em empresas"),
	(null, "Plumeria", "Controle de sessões de mindfulness");

insert into aluno values 
	("001", "Luiz Nison", "luiz@gmail.com", 1),
	("002", "Murilo", "murilo@gmail.com", 1),
	("003", "Pedro Rocha", "pedro.rocha@gmail.com", 1),
	("004", "Pedro Muniz", "pedro.muniz@gmail.com", 2),
	("005", "Lethicia", "lethicia@gmail.com", 2),
	("006", "Livia", "livia@gmail.com", 2),
	("007", "Giulia", "gilia@gmail.com", 3),
	("008", "Pedro", "pedro@gmail.com", 3),
	("009", "Janna", "janna@gmail.com", 3);
    
insert into professor values 
	(null, "Vivian", "Banco de Dados"),
	(null, "Rogério", "Arquitetura Computacional"),
	(null, "Fernanda", "Pesquisa e Inovação"),
	(null, "Yoshi", "Algoritmo");
    
insert into avaliacaoGrupo values 
	(null, 10000, 1, "2022-11-04 12:00", 10),
	(null, 10001, 1, "2022-11-04 12:02", 9.5),
	(null, 10002, 1, "2022-11-04 12:05", 9.8),
	(null, 10001, 2, "2022-11-04 12:00", 8.2),
	(null, 10002, 2, "2022-11-04 12:01", 9.6),
	(null, 10003, 2, "2022-11-04 12:02", 10),
	(null, 10000, 3, "2022-11-05 11:22", 8.6),
	(null, 10001, 3, "2022-11-05 11:25", 9.5),
	(null, 10003, 3, "2022-11-05 11:30", 7.9);
    

-- Exibir todos os dados de cada tabela criada, separadamente.
select * from grupo;
select * from aluno;
select * from professor;
select * from avaliacaoGrupo;

-- Exibir os dados dos grupos e dos seus alunos 
select g.nomeGrupo,
		g.descricao,
        al.nomeAluno,
        al.emailAluno
			from grupo as g
				join aluno as al on al.fkGrupo = g.idGrupo;

-- Exibir os dados de um determinado grupo e os dados dos seus respectivos alunos
select g.nomeGrupo,
		g.descricao,
        al.nomeAluno,
        al.emailAluno
			from grupo as g
				join aluno as al on al.fkGrupo = g.idGrupo
					where g.idGrupo = 3;

-- 7 Exibir a média das notas atribuídas aos grupos, no geral
select avg(nota) from avaliacaoGrupo;

-- 8 Exibir a nota mínima e nota máxima que foi atribuída aos grupos no geral
select min(nota),
		max(nota) from avaliacaoGrupo;

-- 9 Exibir a soma das notas dadas aos grupos, no geral
select sum(nota) from avaliacaoGrupo;

-- 10 Exibir os dados dos professores que avaliaram cada grupo, os dados dos grupos, a data e o horário da avaliação 
select p.nomeProfessor,
		p.disciplina,
        g.nomeGrupo,
        g.descricao,
        av.dtAvaliacao,
		av.nota
			from avaliacaoGrupo as av
				join grupo as g on av.fkGrupo = g.idGrupo
					join professor as p on p.idProfessor = av.fkProfessor;

-- 11 Exibir os dados dos professores que avaliaram um determinado grupo, os dados do grupo, a data e o horário da avaliação
select p.nomeProfessor,
		p.disciplina,
        g.nomeGrupo,
        g.descricao,
        av.dtAvaliacao,
		av.nota
			from avaliacaoGrupo as av
				join grupo as g on av.fkGrupo = g.idGrupo
					join professor as p on p.idProfessor = av.fkProfessor
						where g.idGrupo = 3;

-- 12 Exibir os nomes dos grupos que foram avaliados por um determinado professor
select g.nomeGrupo,
		g.descricao,
		p.nomeProfessor
			from avaliacaoGrupo as av
				join grupo as g on g.idGrupo = av.fkGrupo
					join professor as p on p.idProfessor = av.fkProfessor
						where p.idProfessor = 10000;

-- 13 Exibir os dados dos grupos, os dados dos alunos correspondentes, os professores que avaliaram, a data e o horário da avaliação
select g.nomeGrupo,
        g.descricao,
		al.nomeAluno,
        al.emailAluno,
        p.nomeProfessor,
		p.disciplina,
        av.dtAvaliacao,
		av.nota
			from grupo as g 
				join aluno as al on al.fkGrupo = g.idGrupo
					join avaliacaoGrupo as av on av.fkGrupo = g.idGrupo
						join professor as p on p.idProfessor = av.fkProfessor;

-- 14 Exibir a quantidade de notas distintas
select distinct nota as "Notas distintas" from avaliacaoGrupo;

-- 15 Exibir a identificação do professor (pode ser o fk ou o nome), a média das notas e a soma das notas atribuídas, agrupadas por professor
select p.nomeProfessor, 
		p.disciplina,
		avg(nota),
        sum(nota)
			from avaliacaoGrupo 
				join professor as p on p.idProfessor = fkProfessor
					group by nomeProfessor;

-- 16 Exibir a identificação do grupo (pode ser o fk ou o nome), a média das notas e a soma das notas atribuídas, agrupadas por grupo
select g.nomeGrupo,
		avg(nota),
		sum(nota)
			from avaliacaoGrupo
				join grupo as g on g.idGrupo = fkGrupo
					group by fkGrupo;

-- 17 Exibir a identificação do professor (pode ser o fk ou o nome) a menor nota e a maior nota atribuída, agrupada pro professor
select p.nomeProfessor, 
		p.disciplina,
		min(nota),
        max(nota)
			from avaliacaoGrupo 
				join professor as p on p.idProfessor = fkProfessor
					group by nomeProfessor;

-- 18 Exibir a identificação do grupo (pode ser o fk ou o nome), a menor nota e a maior nota atribuída, agrupada por grupo.
select g.nomeGrupo,
		min(nota),
		max(nota)
			from avaliacaoGrupo
				join grupo as g on g.idGrupo = fkGrupo
					group by fkGrupo;