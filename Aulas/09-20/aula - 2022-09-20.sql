create database domingos;

use domingos;

create table funcionario (
	idFunc int primary key auto_increment,
    nome varchar(45),
    salario decimal(10,2),
    fkSuper int, constraint fkSupervisor foreign key (fkSuper)
		references funcionario(idFunc)
);

create table dependente (
	idDep int,
    fkFunc int,
		foreign key (fkFunc) references funcionario(idFunc),
	primary key (idDep, fkFunc),
    nome varchar(45),
    parentesco varchar(45)
);

show tables;

-- criar um funcionario supervisor
insert into funcionario values
	(null, 'Domingos', 8.99, null);
    
select * from funcionario;

-- inserir os funcionarios supervisionados pelo Domingos
insert into funcionario values
	(null, 'Vivian', 1.99, 1),
	(null, 'Paulo', 1.99, 1);

insert into funcionario (nome, salario, fkSuper) values
	('Thiago', 0.89, 2);
    
select * from funcionario;

insert into dependente values
	(1, 1, 'Sábado', 'esposa'),
	(1, 2, 'Betina', 'mãe');
    
insert into dependente values
	(2, 1, 'Feriado', 'pai'),
	(1, 4, 'Tânia', 'irmã');

select * from dependente;

-- selecionar os funcionarios superiores e seus devidos orientandos
select f.nome as NomeFunc,
	s.nome as NomeSuper,
    d.nome as NomeDep
		from funcionario as f
			join funcionario as s
				on f.fkSuper = s.idFunc
                join dependente as d
					on d.fkFunc = f.idFunc;

-- selecionar todos os funcionarios até mesmo o que não tem supervisor
select f.nome as NomeFunc,
	ifNull(d.nome, 'SEM DEPENDENTE') as NomeDep
		from funcionario as f
			left join dependente as d
				on f.idFunc = d.fkFunc
					where f.idFunc = 1;
                    
select f.*,
	s.nome as Supervisor
		from funcionario as f
			left join funcionario as s
				on f.fkSuper = s.idFunc
					where f.fkSuper is null;
    
-- selecionar os funcionarios e seus dependentes
select * from funcionario as func
	join dependente as dep on dep.fkFunc = func.idFunc;
    

select t.nome as treinador,
	e.nome as experiente,
	n.nome as nadador
			from treinador as t join treinador as e
				on t.fkTreinadorOrientador = e.idTreinador
					join nadador as n
						on n.fkTreinador = t.Treinador;

