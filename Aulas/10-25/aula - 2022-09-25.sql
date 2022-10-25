-- Criação e utilização de database
create database relacaonton;

use relacaonton;

-- Criação de entidades
create table pessoa (
	idPessoa int primary key auto_increment,
    nome varchar(45),
    salario decimal(10,2)
);

create table endereco (
	idEndereco int primary key auto_increment,
    cep char(9),
    bairro varchar(45),
    cidade varchar(45)
) auto_increment = 100;

create table endCompleto (
	fkEnd int, foreign key (fkEnd)
		references endereco(idEndereco),
    fkPessoa int, foreign key (fkPessoa)
		references pessoa(idPessoa),
    primary key (fkEnd, fkPessoa),
    numero int,
    complemento varchar(45)
);

-- Inserir dados às tabelas
insert into pessoa values
	(null, "Vivian", 1.99),
	(null, "Paulo", 1.59),
	(null, "Nison", 0.09);
    
    
insert into endereco values
	(null, "01414-905", "Cerqueira Cesar", "São Paulo"),
	(null, "04253-000", "Sacomã", "São Paulo"),
	(null, "08250-000", "Centro", "Florianópolis");

insert into endCompleto values 
	(101, 1, 1500, "apto 100"),
	(100, 2, 595, "10 andar"),
	(100, 3, 595, "6 andar");
    
-- Selecionar dados e fazer joins entre entidades
select * from pessoa;
select * from endereco;
select * from endCompleto;
    
select * from pessoa
	join endCompleto on idPessoa = fkPessoa
		join endereco on fkEnd = idEndereco;
        
-- Selecionar apenas o nome e o bairro das pessoas
select pessoa.nome as Nome,
		endereco.bairro as Bairro
			from pessoa
				join endCompleto on idPessoa = fkPessoa
					join endereco on fkEnd = idEndereco;
   
-- Selecionar todas as pessoas e endereços
select * from pessoa 
	right join endCompleto on idPessoa = fkPessoa
		right join endereco on fkEnd = idEndereco;
        
-- Inserir dados de uma pessoa e 
insert into pessoa values
	(null, "Murilo", 0.99);

-- O bloco de comando abaixo é como um full outer join
select nome,
		bairro
			from pessoa
				right join endCompleto on idPessoa = fkPessoa
					right join endereco on fkEnd = idEndereco
union
select nome,
		bairro
			from pessoa
				left join endCompleto on idPessoa = fkPessoa
					left join endereco on fkEnd = idEndereco;
                    
-- Selecionar as pessoas e o endereco com fk = null
select nome,
		bairro
			from pessoa
				right join endCompleto on idPessoa = fkPessoa
					right join endereco on fkEnd = idEndereco
                    where fkEnd is null
union
select nome,
		bairro
			from pessoa
				left join endCompleto on idPessoa = fkPessoa
					left join endereco on fkEnd = idEndereco
                    where fkPessoa is null;
                    
                    
-- FUNÇÕES MATEMÁTICAS
-- Mostrar a quantidade de registros nas tabela pessoa
-- COUNT()
select count(*) from pessoa;
select * from pessoa;

insert into pessoa values 
	(null, "Estela", null);
    
-- Selecionar um campo/atributo em específio | Não contará os que tem campo = Null
select count(salario) as "Salario das pessoas" from pessoa;

-- LIMIT | Limitar a quantidade de linhas do meu select
select nome from pessoa limit 1;
-- Limitar com um range específico
select nome from pessoa limit 3,2;
-- SQL Server | Não existe o limite, mas existe o TOP | Não ter como pegar por um range/intervalo | select top 1 campo 1 from tabela1;

-- MAX e MIN | Mostrar o maior e menor salário | Não conta o que tiver valor null
select max(salario) as "Maior salário", 
		min(salario) as "Menor salário"
			from pessoa;
            
-- SUM | Mostrar a soma de todos os salarios
select sum(salario) from pessoa;

-- AVG | Mostrar a média de salários
select avg(salario) from pessoa;

-- ROUND | Arredondar a média para duas casas decimais
select round(avg(salario), 2) from pessoa;

insert into pessoa values
	(null, "Nauana", 1.09),
    (null, "Thiago", 5.19);
    
-- TRUNCATE | Não vai arredondar, mas apenas parar no número da casa decimal definida após a vírgula
select truncate(avg(salario), 2) from pessoa;

insert into pessoa values
	(null, "Marcus",  1.09);
select * from pessoa;

-- DISTINCT | Pega os salarios diferentes e faz média ou soma | Tem que estar dentro dos parênteses
select avg(distinct salario) from pessoa;
select sum(distinct salario) from pessoa;
select distinct salario from pessoa;

-- GROUP BY | Agrupar por bairro que contem dados nele | Não mostrar os que tem apenas NULL
select bairro,
	avg(salario)
		from pessoa
			join endCompleto on idPessoa = fkPessoa
				join endereco on idEndereco = fkEnd
					group by bairro;
                    
-- Selecionar a pessoa que tem o salário mínimo e máximo
select nome, salario from pessoa
	where salario = (select min(salario) from pessoa)
UNION 
select nome, salario from pessoa
	where salario = (select max(salario) from pessoa);

select nome, salario from pessoa
	where salario <= (select avg(salario) from pessoa);
