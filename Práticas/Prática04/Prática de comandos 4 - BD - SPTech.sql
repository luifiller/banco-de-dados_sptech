-- EXERCÍCIO 1

create database sprint2;

use sprint2;

-- Criar tabela de professor
create table professor (
	idProfessor int primary key auto_increment,
    nome varchar(50),
    sobrenome varchar(30),
    especialidade1 varchar(40), 
    especialidade2 varchar(40)
);

-- Inserir pelo menos 6 professores
insert into professor (nome, sobrenome, especialidade1, especialidade2) values
	("Pedro", "Rocha", "Banco de Dados", "Análise e Desenvolvimento de Sistemas"),
	("Júlio", "Cezar", "SSistemas da Informação", NULL),
	("Luiz Nison", "Filler", "Análise e Desenvolvimento de Sistemas", "Psicologia"),
	("Kaio", "Renan", "Desenvolvimento Web", "Ciência da Computação"),
	("Lethicia", NULL, "Designer de produtos", NULL),
	("Livia", "Loiola", "Sistemas da Informação", "UX/UI"),
	("Vitor Henrique", "da Silva", "Cyber Segurança", NULL);

select * from professor;

-- Criar tabela disciplina
create table disciplina (
	idDisc int primary key auto_increment,
    nomeDisc varchar(45)
);

-- Inserir pelo menos 3 disciplinas
insert into disciplina (nomeDisc) values
	("Banco de Dados"),
	("Tecnologia da Informação"),
	("Socioemocional"),
	("Algoritmo"),
	("Desenvolvimento Front-end"),
	("Desenvolvimento Back-end");
    
select * from disciplina;

-- Configurar a chave estrangeira na tabela conforme sua modelagem (Pode fazer no comando CREATE TABLE);
alter table disciplina add column fkProfessor int;

desc disciplina;

alter table disciplina add constraint foreign key (fkProfessor)
	references Professor(idProfessor);

-- Exibir os professores e suas respectivas disciplinas;
-- Antes, deve fazer update das FKs
update disciplina set fkProfessor = 1 where idDisc = 1;
update disciplina set fkProfessor = 2 where idDisc = 2;
update disciplina set fkProfessor = 3 where idDisc = 3;
update disciplina set fkProfessor = 4 where idDisc = 4;
update disciplina set fkProfessor = 5 where idDisc = 5;
update disciplina set fkProfessor = 7 where idDisc = 6;

select * from disciplina;

select professor.*, disciplina.* from disciplina
	join professor on idProfessor = fkProfessor;

-- Exibir apenas o nome da disciplina e o nome do respectivo professor;
select disciplina.nomeDisc as "Nome Disciplina", professor.nome as "Nome professor" from disciplina
	join professor on idProfessor = fkProfessor;

-- Exibir os dados dos professores, suas respectivas disciplinas de um determinado sobrenome;
select professor.*, disciplina.* from disciplina
	join professor on idProfessor = fkProfessor 
		where sobrenome like "%Renan%";

-- Exibir apenas a especialidade1 e o nome da disciplina, de um determinado professor, ordenado de forma crescente pela especialidade1;
select professor.especialidade1 as "Especialidade 1", disciplina.nomeDisc as "Nome disciplina" from disciplina
	join professor on idProfessor = fkProfessor
		where professor.nome = "Lethicia" order by professor.especialidade1 asc;
        
        
-- EXERCÍCIO 2

create database sprint2;

use sprint2;

-- Criar tabela Curso
create table curso (
	idCurso int primary key auto_increment,
    nome varchar(50),
    sigla char(3),
    coordenador varchar(50)
);

-- Inserir pelo menos 3 cursos
insert into curso (nome, sigla, coordenador) values
	("Análise e Desenvolvimento de Sistemas", "ADS", "Vivian Silva"),
	("Ciência da Computação", "CCO", "Paulo Eduardo"),
	("Sistemas da Informação", "SI", "Pedro Rocha"),
	("Tecnologia da Informação", "TI", "Luiz Silva");
    
select * from curso;

-- Criar tabela aluno
create table aluno (
	idAluno int primary key auto_increment,
    nome varchar(50),
    sobrenome varchar(45),
    sexo char(9), constraint chkSexo check
		(sexo in ("Masculino", "Feminino")),
	nota decimal(4,2), constraint chkNota check (nota >= 0 and nota <=10)
);

-- Inserir pelo menos 7 alunos
insert into aluno (nome, sobrenome, sexo, nota) values
	("Luiz Nison", "Filler", "Masculino", 8.5),
	("Lethicia", "Silva", "Feminino", 9.6),
	("Livia", "Loiola", "Feminino", 7.2),
	("Kaio", "Renan", "Masculino", 4.3),
	("Pedro", "Silva", "Masculino", 2.5),
	("Vivian", "Silva", "Feminino", 10),
	("Paulo", "Eduardo", "Masculino", 9);

select * from aluno;

-- Faça um JOIN entre as duas tabelas
-- Adicionar coluna para FK
alter table aluno add column fkCurso int;

alter table aluno add constraint foreign key (fkCurso)
	references Curso(idCurso);

update aluno set fkCurso = 1 where idAluno in (1, 3, 4, 5);
update aluno set fkCurso = 2 where idAluno = 6;
update aluno set fkCurso = 3 where idAluno = 2;
update aluno set fkCurso = 4 where idAluno = 7;

select * from aluno;
desc aluno;

select aluno.*, curso.* from aluno
	join curso on idCurso = fkCurso;
    
    
-- Faça um JOIN com WHERE entre as duas tabelas
select aluno.nome, aluno.sobrenome, curso.nome, curso.sigla from aluno
	join curso on idCurso = fkCurso
		where sobrenome = "Silva";
        
-- Crie um campo com a restrição (constraint) de check table
alter table aluno add column email varchar(255), add constraint chkEmail check (email like ("%@%"));
