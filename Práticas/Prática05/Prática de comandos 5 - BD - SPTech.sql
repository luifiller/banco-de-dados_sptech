create database sprint2;

use sprint2;

-- Criar tabelas
create table pet (
	idPet int primary key auto_increment,
    tipo_animal varchar(45),
    nome varchar(45),
    raca varchar(45),
    nascimento date,
    fkCliente int, constraint foreign key (fkCliente)
		references cliente(idCliente)
)auto_increment = 101;

create table cliente (
	idCliente int primary key auto_increment,
    nome varchar(45),
    sobrenome varchar(45),
    telefone_Fixo varchar(20),
    telefone_Cel varchar(20),
    cep char(9), constraint chkCep check
		(cep like ('%-%')),
	logradouro varchar(45),
    numero_end varchar(10),
    bairro varchar(45),
    estado varchar(45)
);

-- Inserir dados nas tabelas, de forma que exista mais de um tipo de animal diferente, e que exista algum cliente com mais de um pet cadastrado. Procure inserir pelo menos 2 clientes diferentes que tenham o mesmo sobrenome.
insert into cliente values 
	(null, 'Luiz', 'Filler', null, '11-973721555', '02214-010', 'Rua das Promessas', '608', 'Vila Medeiros', 'São Paulo'),
	(null, 'Kaio', 'Silva', null, '11-912345678', '02214-020', 'Rua Qualquer', '702', 'Vila Alguma', 'São Paulo'),
	(null, 'Pedro', 'Silva', null, '11-9123435281', '02215-032', 'Rua Alguma', '52', 'Vila Qualquer', 'São Paulo');
    
insert into pet values
	(null, 'Gato', 'Fred', 'Persa', '2022-02-15', 2),
	(null, 'Cachorro', 'Kika', 'Vira-lata', '2022-08-18', 1),
	(null, 'Cachorro', 'Barney', 'Pastor alemão', '2022-10-25', 2),
	(null, 'Cachorro', 'Chocolate', 'Pastor albino', '2012-11-03', 2);

-- Exibir todos os dados de cada tabela criada, separadamente
select * from pet;
select * from cliente;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação
select cliente.idCliente, cliente.nome, cliente.sobrenome, pet.* from cliente join pet on idCliente = fkCliente;

-- Altere o tamanho da coluna nome do cliente.
alter table cliente modify nome varchar(50);
desc cliente;

-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro).
select * from pet where tipo_animal = 'Cachorro';

-- Exibir apenas os nomes e as datas de nascimento dos pets.
select nome, nascimento from pet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
select * from pet order by nome asc;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.


-- Exibir os dados dos pets cujo nome comece com uma determinada letra.


-- Exibir os dados dos clientes que têm o mesmo sobrenome.


-- Alterar o telefone de um determinado cliente.


-- Exibir os dados dos clientes para verificar se alterou.


-- Exibir os dados dos pets e dos seus respectivos donos.


-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente.


-- Excluir algum pet.


-- Exibir os dados dos pets para verificar se excluiu.


-- Excluir as tabelas.


