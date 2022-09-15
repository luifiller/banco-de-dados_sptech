-- EXERCÍCIO 1

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
	(null, 'Luiz', 'Filler', null, '11-973721555', '02517-010', 'Rua das Ruas', '38', 'Vila Medeiros', 'São Paulo'),
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
select * from cliente order by bairro desc;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra.
select * from pet 
	where nome like 'B%'; 

-- Exibir os dados dos clientes que têm o mesmo sobrenome.
select * from cliente 
	where sobrenome = 'Silva';

-- Alterar o telefone de um determinado cliente.
update cliente set telefone_Cel = '11-912341555' where idCliente = 1;

-- Exibir os dados dos clientes para verificar se alterou.
select * from cliente;

-- Exibir os dados dos pets e dos seus respectivos donos.
select * from pet
	join cliente on idCliente = fkCliente;

-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente.
select * from pet 
	join cliente on idCliente = fkCliente
		where idCliente = 2;

-- Excluir algum pet.
delete from pet where idPet = 100;

-- Exibir os dados dos pets para verificar se excluiu.
select * from pet;

-- Excluir as tabelas.
drop table pet, cliente;
show tables;

-- EXERCÍCIO 2
create database sprint2;

use sprint2;

-- Implemente no MySQL as tabelas equivalentes ao modelo que você criou
create table pessoa (
	idPessoa int primary key auto_increment,
    nome varchar(45),
    nascimento date,
    profissao varchar(45)
);

create table gasto (
	idGasto int primary key auto_increment,
    dataGasto date,
    valor decimal(10,2),
    descricao varchar(255),
    fkPessoa int, constraint foreign key (fkPessoa)
		references pessoa(idPessoa)
);

-- Insira dados nas tabelas.
insert into pessoa values 
	(null, 'Luiz Nison', '1999-08-18', 'Psicologia'),
	(null, 'Rosana', '1968-12-20', 'Administração'),
	(null, 'Pedro', '1998-01-10', 'Contabilidade'),
	(null, 'Dante', '1997-10-08', 'Psicologia'),
	(null, 'Marcos Henrique', '1999-08-22', 'Enfermagem');

desc gasto;
insert into gasto values
	(null, '2022-09-12', 150.90, 'Roupa de cama nova', 1),
	(null, '2022-09-12', 40.00, 'Recarga valte transporte', 1),
	(null, '2022-09-13', 12.90, 'Café de manhã com os amigos', 1),
	(null, '2022-09-10', 4.40, 'Passagem de metrô', 2),
	(null, '2022-09-13', 57.90, 'Game novo', 2),
	(null, '2022-09-10', 12.70, 'Ingresso para show no parque', 3),
	(null, '2022-09-11', 30.00, 'Recarga celular 2º chip', 3),
	(null, '2022-09-09', 22.50, 'Escova para o cabelo', 4),
	(null, '2022-09-10', 10.20, 'Meia nova personalizada', 4),
	(null, '2022-09-11', 9.90, 'Premium do Spotify', 4),
	(null, '2022-09-12', 11.90, 'Amazon Prime', 4),
	(null, '2022-09-08', 2240.90, 'Passagens de avião para Acapulco', 5),
	(null, '2022-09-011', 790.00, 'Malas novas para viagem', 5);

-- Exiba os dados de cada tabela individualmente.
select * from pessoa;
select * from gasto;

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela (por exemplo, as pessoas de alguma profissão, etc).


-- Exiba os dados das pessoas e dos seus gastos correspondentes.
select * from pessoa
	join gasto on idPessoa = fkPessoa;

-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes.
select * from pessoa
	join gasto on idPessoa = fkPessoa
		where idPessoa = 4;

-- Atualize valores já inseridos na tabela.
update gasto set valor = 32.50 where idGasto = 8;
update gasto set valor = 18.20 where idGasto = 9;
update gasto set valor = 14.90 where idGasto = 10;
update gasto set valor = 22.90 where idGasto = 11;


-- Exclua um ou mais registros de alguma tabela
delete from gasto where idGasto in (4, 6, 7);
select * from gasto;

-- EXERCÍCIO 3
-- Criar um banco de dados chamado PraticaFuncionario.
create database PraticaFuncionario;

-- Selecionar esse banco de dados.
use PraticaFuncionario;

-- Criar as tabelas correspondentes à sua modelagem.
-- OBS: Foi considerado como premissa/regra de negócio que os andares das empresas são representado apenas por números e sem distinção de blocos por qualquer caracter.alter

-- Inserir dados nas tabelas, de forma que exista mais de um funcionário em cada setor cadastrado.


-- Exibir todos os dados de cada tabela criada, separadamente.


-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.


-- Exibir os dados dos setores e dos seus respectivos funcionários.


-- Exibir os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários.


-- Exibir os dados dos funcionários e de seus acompanhantes.


-- Exibir os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes.


-- Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes


-- EXERCICIO 4
-- Criar um banco de dados chamado Treinador.
create database Treinador;

-- Selecionar esse banco de dados.
use Treinador;

-- Criar as tabelas correspondentes à sua modelagem.
create table treinador (
	idTreinador int primary key auto_increment,
    nome varchar(45),
    sobrenome varchar(45),
    experiencia varchar(45), constraint chkExp check
		(experiencia in ('Experiente', 'Não experiente')),
	telefone_Fixo varchar(20),
    telefone_Cel varchar(20),
    email varchar(100), constraint chkEmail check
		(email like ('%@%')),
	fkTreinadorExp int, constraint foreign key (fkTreinadorExp)
		references Treinador(idTreinador)
) auto_increment = 10;


create table nadador (
	idNadador int primary key auto_increment, 
    nome varchar(45),
    sobrenome varchar(45),
    estado varchar(45),
    nascimento date, 
    fkTreinador int, constraint foreign key (fkTreinador)
		references Treinador(idTreinador)
) auto_increment = 100;

-- Inserir dados nas tabelas, de forma que exista mais de um nadador para algum treinador, e mais de um treinador sendo orientado por algum treinador mais experiente.


-- Exibir todos os dados de cada tabela criada, separadamente.
select * from nadador;

select * from treinador;

-- Exibir os dados dos treinadores e os dados de seus respectivos nadadores.


-- Exibir os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores.


-- Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores.


-- Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores, porém somente de um determinado treinador orientador (informar o nome do treinador na consulta).


-- Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados dos respectivos treinadores orientadores.


-- Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos respectivos nadadores e os dados do seu treinador orientador.

