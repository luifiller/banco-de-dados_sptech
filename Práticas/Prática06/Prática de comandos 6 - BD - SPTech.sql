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

update aluno set fkraRep = 5 where ra = 1;

insert into aluno values 
	(null, 'Kaio', '91234-7899', 1, 1),
	(null, 'Pedro', '92222-7111', 3, 2),
	(null, 'Renan', '91334-7844', 2, 3),
	(null, 'João Pedro', '92555-7777', 1, 4);

select * from acomp;
insert into acomp values
	(null, 'José Luiz', 'pai', 1),
	(null, 'Giulia', 'esposa', 1),
	(null, 'Roberto', 'pai', 2),
	(null, 'Teresinha', 'avó', 3),
	(null, 'Jonathan', 'tio', 4),
	(null, 'Carlos Alberto', 'pai', 4),
	(null, 'Cecília', 'tia', 5);

-- Exibir todos os dados de cada tabela criada, separadamente.
select * from projeto;

select * from aluno;

select * from acomp;

-- Exibir os dados dos alunos e dos projetos correspondentes.
select a.ra,
		a.nome,
		a.telefone,
		p.nome,
		p.descricao from aluno as a
		join projeto as p on fkProjeto = idProjeto
			order by ra asc;

-- Exibir os dados dos alunos e dos seus acompanhantes.
select  a.ra, 
		a.nome,
        a.telefone,
        ac.nome_acomp,
        ac.parentesco
        from aluno as a
			join acomp as ac on fkra = ra;

-- Exibir os dados dos alunos e dos seus representantes.
select  a1.ra,
		a1.nome,
        a1.telefone,
        a2.ra,
        a2.nome from aluno as a1
			join aluno as a2 on a1.fkraRep = a2.ra;
-- O item de cima também poderia ser feito da forma representada abaixo
select * from aluno	as a
	join aluno as rep
		on rep.ra = a.fkraRep;
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do projeto na consulta).
select 	a.ra,
		a.nome,
		a.telefone,
        p.idProjeto,
        p.nome,
        p.descricao
			from aluno as a
				join projeto as p on a.fkProjeto = p.idProjeto
					where p.idProjeto = 2;

-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes.
select 	a.ra,
		a.nome,
		a.telefone,
        p.idProjeto,
        p.nome,
        p.descricao,
        ac.idAcomp,
        ac.nome_acomp,
        ac.parentesco
        from aluno as a
			join projeto as p on a.fkProjeto = p.idProjeto
				join acomp as ac on ac.fkra = a.ra
					order by ra asc;
-- Ou pode ser feito, também com todos os dados como abaixo
select * from aluno as a
	join projeto as p on a.fkProjeto = p.idProjeto
		join acomp as ac on ac.fkra = a.ra;


-- EXERCÍCIO 2
-- Criar um banco de dados chamado Campanha.
create database campanha;

-- Selecionar esse banco de dados.
use campanha;

-- Criar as tabelas correspondentes à sua modelagem.
create table organizador (
	idOrg int primary key auto_increment,
    nome varchar(45),
    end_rua varchar(100),
    end_bairro varchar(45),
    email varchar(100), constraint chkEmail check
		(email like ('%@%')),
	fkOrg_Exp int, constraint fkOrganizador_Experiente foreign key (fkOrg_Exp)
		references organizador(idOrg)
) auto_increment = 30;

create table campanha (
	idCamp int primary key auto_increment,
    categoria varchar(45),
    instituicao varchar(45),
    data_final date,
    fkOrg int, constraint fkOrganizador foreign key (fkOrg)
		references organizador(idOrg)
) auto_increment = 500;

-- Inserir dados nas tabelas, de forma que exista mais de uma campanha para algum organizador, e mais de um organizador novato sendo orientado por algum organizador mais experiente.
insert into organizador values 
	(null, 'Luiz Nison', 'Rua Alguma', 'Beaba', 'luiznison@email.com', null),
	(null, 'Giulia', 'Rua Aruanda', 'Periquaqua', 'giulia@email.com', null),
	(null, 'Pedro', 'Rua Qualquer', 'Aluanda', 'pedro@email.com', 30),
	(null, 'Kaio', 'Rua Farelo', 'Alecrim', 'kaio@email.com', 30),
	(null, 'Marcela', 'Rua Prediano', 'Casório', 'marcela@email.com', 31),
	(null, 'Jorge', 'Rua Salve', 'Piqueri', 'jorgin@email.com', 31),
	(null, 'João', 'Rua Levada', 'Aluanda', 'joão@email.com', 30);
    
insert into campanha values 
	(null, 'Alimentos', 'Comida para todos', '2022-08-18', 30),
	(null, 'Vestimentas', 'Roupa para todos', '2021-12-27', 30),
	(null, 'Alimentos', 'Barriguinha cheia', '2022-02-21', 31),
	(null, 'Higiene', 'Uma mão lava a outra', '2021-07-12', 31),
	(null, 'Alimentos', 'Marilene', '2022-05-01', 32),
	(null, 'Vestimentas', 'Agasalhando', '2021-10-19', 33),
	(null, 'Proteção e Saúde', 'Criança Esperantum', '2021-11-09', 34),
	(null, 'Higiene', 'Higiorg', '2021-09-12', 35),
	(null, 'Proteção e Saúde', 'Atchin não mais', '2022-12-25', 36);

-- Exibir todos os dados de cada tabela criada, separadamente.
select * from organizador;

select * from campanha;

-- Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
select 	o.nome,
		o.end_rua,
		o.end_bairro,
        o.email,
        c.categoria,
        c.instituicao,
        c.data_final
			from organizador as o
				join campanha as c on c.fkOrg = o.idOrg;

-- Exibir os dados de um determinado organizador (informar o nome do organizador na consulta) e os dados de suas respectivas campanhas.
select 	o.nome,
		o.end_rua,
		o.end_bairro,
		o.email,
        c.categoria,
        c.instituicao,
        c.data_final
			from organizador as o
				join campanha as c on c.fkOrg = o.idOrg
					where idOrg = 31;
-- Também poderia ser feito como abaixo
select * from organizador as o
	join campanha as c on c.fkOrg = o.idOrg
		where o.idOrg = 31;

-- Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores.
select 	o.nome,
		o.end_rua,
        o.end_bairro,
        o.email,
        oNovato.nome,
        oNovato.end_rua,
        oNovato.end_bairro,
        oNovato.email
			from organizador as o
				join organizador as oNovato on oNovato.fkOrg_Exp = o.idOrg;

-- Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores, porém somente de um determinado organizador orientador (informar o nome do organizador orientador na consulta).
select 	oNovato.nome as "Nome Novato",
        oNovato.end_rua,
        oNovato.end_bairro,
        oNovato.email,
		o.nome as "Nome Orientadora"
			from organizador as o
				join organizador as oNovato on oNovato.fkOrg_Exp = o.idOrg
					where o.idOrg = 31;

-- Exibir os dados dos organizadores novatos, os dados das respectivas campanhas organizadas e os dados dos respectivos organizadores orientadores.
select 	oNovato.nome as "Nome Novato",
        oNovato.end_rua,
        oNovato.end_bairro,
        oNovato.email,
        c.categoria,
        c.instituicao,
        c.data_final,
		o.nome as "Nome Orientadora"
			from organizador as oNovato
				join campanha as c on c.fkOrg = oNovato.idOrg
					join organizador as o on oNovato.fkOrg_Exp = o.idOrg;
                    
-- Exibir os dados de um organizador novato (informar o seu nome na consulta), os dados das respectivas campanhas em que trabalha e os dados do seu organizador orientador
select 	oNovato.nome as "Nome Novato",
        oNovato.end_rua,
        oNovato.end_bairro,
        oNovato.email,
        c.categoria,
        c.instituicao,
        c.data_final,
		o.nome as "Nome Orientadora"
			from organizador as oNovato
				join campanha as c on c.fkOrg = oNovato.idOrg
					join organizador as o on oNovato.fkOrg_Exp = o.idOrg
						where oNovato.idOrg = 32;