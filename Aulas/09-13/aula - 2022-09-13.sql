-- Criar usuário
create user 'prod'@'localhost' identified by 'sptech';

-- Conceder privilégios
grant all privileges on faculdade1adsc.* to 'prod'@'localhost';
flush privileges;

-- Conceder privilégios específicos
grant select, update, delete, create on faculdade1adsc.* to 'prod'@'localhost';
flush privileges; 

-- Deletar usuário
drop user 'prod'@'localhost';
drop user 'testando'@'localhost';

-- Revogar privilégios
revoke INSERT, SELECT on faculdade1adsc.* from 'prod'@'localhost';

-- Criar tabelas de funcionario e dependente
create table funcionario (
	idFunc int primary key auto_increment,
    nome varchar(45),
    salario decimal(3,2)
);

create table dependente (
	idDep int auto_increment,
    nome varchar(45),
    parentesco varchar(45),
    fkFunc int,
    foreign key (fkFunc) references funcionario(idFunc),
    primary key (idDep, fkFunc))
    auto_increment = 100;	
    
-- Inserir valores na tabela 
insert into funcionario values
	(null, 'Paulo', 0.99),
	(null, 'Rafael', 0.99);
    
-- Select
select * from funcionario;

-- Inserir valores na tabela de dependentes
insert into dependente values
	(null, 'Paula', 'irmã', 1),
	(null, 'Rafaela', 'irmã', 2),
	(null, 'Paulão', 'pai', 1);
    
-- Select
select * from dependente;

-- Fazer join entre as tabelas
select * from funcionario as func
	join dependente as dep
		on func.idFunc = dep.fkFunc;