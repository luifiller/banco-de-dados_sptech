-- EXERCÍCIO 1
-- Criar banco de dados AlunoProjeto
create database AlunoProjeto;

-- Selecionar banco de dados
use AlunoProjeto;

-- Criar as tabelas equivalentes à modelagem.
create table projeto (
	idProjeto int primary key auto_increment,
    nome varchar(45),
    descricao varchar(255)
);

create table aluno (
	ra int primary key auto_increment,
	nome varchar(45),
    telefone varchar(20),
    fkProjeto int, foreign key (fkProjeto)
		references projeto(idProjeto),
	fkraRep int,  foreign key (fkraRep)
		references aluno(ra)
);

create table acomp (
	idAcomp int primary key auto_increment,
    nome_acomp varchar(45),
    parentesco varchar(45),
    fkra int, constraint aluno_fkra foreign key (fkra)
		references aluno(ra)
);

-- Inserir dados nas tabelas.
insert into projeto values
	(null, 'Bright Tech', 'Monitoramento de fluxo de pessoas para redução de gastos de energia em empresas'),
	(null, 'OnData', 'Controle de temperatura e umidade para mitigar prejuízos em data centers'),
	(null, 'Termo Baby', 'Monitoramento de temperatura e umidade para redução de malefícios a recém-nascidos');

insert into aluno values 
	(null, 'Luiz Nison', '97372-1555', 2, null);
    
update aluno set fkraRep = 11 where ra = 1;
    
insert into aluno values 
	(null, 'Kaio', '91234-7899', 1, 1),
	(null, 'Pedro', '92222-7111', 3, 2),
	(null, 'Renan', '91334-7844', 2, 8),
	(null, 'João Pedro', '92555-7777', 1, 10);

insert into acomp values
	(null, 'José Luiz', 'pai', 1),
	(null, 'Giulia', 'esposa', 1),
	(null, 'Roberto', 'pai', 2),
	(null, 'Teresinha', 'avó', 8),
	(null, 'Jonathan', 'tio', 10),
	(null, 'Carlos Alberto', 'pai', 10),
	(null, 'Cecília', 'tia', 11);


-- Exibir todos os dados de cada tabela criada, separadamente.
select * from projeto;

select * from aluno;

select * from acomp;

-- Exibir os dados dos alunos e dos projetos correspondentes.
select * from aluno
		join projeto on fkProjeto = idProjeto
			order by ra asc;

-- Exibir os dados dos alunos e dos seus acompanhantes.


-- Exibir os dados dos alunos e dos seus representantes.


-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do projeto na consulta).


-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes.



-- EXERCÍCIO 2
