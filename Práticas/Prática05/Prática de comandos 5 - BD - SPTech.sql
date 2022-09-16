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
-- OBS: Foi considerado como premissa/regra de negócio que os andares das empresas são representado apenas por números e sem distinção de blocos por qualquer caracter.
-- OBS: Foi considerado como regra de negócio que para ser um funcionário da empresa, este precisa estar alocado em um setor e um setor precisa/deve ter funcionários.

create table setor (
	idSetor int primary key auto_increment,
    nome_Setor varchar(45),
    andar int
);

create table funcionario (
	idFunc int primary key auto_increment,
    nome_Func varchar(45),
    sobrenome_Func varchar(45),
    telefone_Fixo varchar(20),
    telefone_Cel varchar(20),
    salario decimal(8,2),
    fkSetor int, constraint foreign key (fkSetor)
		references setor(idSetor)
);

create table acompanhante (
	idAcomp int auto_increment,
    nome_Acomp varchar(45),
    sobrenome_Acomp varchar(45),
    relacao_func varchar(45),
    nascimento date,
    fkFunc int, constraint foreign key (fkFunc)
		references funcionario(idFunc),
	fkSetor int, constraint foreign key (fkSetor)
		references setor(idSetor),
	primary key (idAcomp, fkFunc, fkSetor)
);

-- Inserir dados nas tabelas, de forma que exista mais de um funcionário em cada setor cadastrado.
insert into setor values 
	(null, 'Recursos Humanos', '3'),
	(null, 'Jurídico', '2'),
	(null, 'Desenvolvimento Web', '1');

insert into funcionario values
	(null, 'Thiago', 'Gomes', null, '11-92345-6789', 3600.00, 1),
	(null, 'Dan', 'Josua', null, '11-95795-9779', 3600.00, 1),
	(null, 'Lethicia', 'Alcantara Soares', null, '11-96783-9816', 3600.00, 1),
	(null, 'Henrique', 'Silva Menezes', null, '11-92875-3471', 4200.00, 2),
	(null, 'Karla', 'Soares', null, '11-98670-2252', 4200.00, 2),
	(null, 'Luiz Nison', 'Filler', null, '11-97372-1555', 2800.00, 3),
	(null, 'Kaio', 'Renan', null, '11-96215-6355', 2800.00, 3),
	(null, 'Pedro', 'Rocha', null, '11-93456-3467', 2800.00, 3);

insert into acompanhante values 
	(null, 'Maria', 'Aparecida', 'Mãe', '1968-12-20', 1, 1),
	(null, 'Carlos', 'Gomes', 'Irmão', '1999-05-10', 1, 1),
	(null, 'João Carlos', 'Soares', 'Pai', '1962-02-16', 3, 1),
	(null, 'Carla', 'Alcantara', 'Mãe', '1963-08-07', 3, 1),
	(null, 'Robson', 'Soares', 'Pai', '1960-09-07', 5, 2),
	(null, 'Roberta', 'Mendonça', 'Mãe', '1963-11-15', 5, 2),
	(null, 'Alberto', 'da Silva', 'Primo', '1998-05-05', 6, 3),
	(null, 'Jaqueline', 'da Silva', 'Prima', '1997-06-06', 6, 3);

-- Exibir todos os dados de cada tabela criada, separadamente.
select * from setor;

select * from funcionario;

select * from acompanhante;

-- Exibir os dados dos setores e dos seus respectivos funcionários.
select * from setor 
	join funcionario on fkSetor = idSetor;

-- Exibir os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários.
select setor.*, funcionario.* from setor 
	join funcionario on fkSetor = idSetor
		where idSetor = 1;

-- Exibir os dados dos funcionários e de seus acompanhantes.
select funcionario.*, acompanhante.* from funcionario
	join acompanhante on fkFunc = idFunc;

-- Exibir os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes.
select funcionario.*, acompanhante.* from funcionario
	join acompanhante on fkFunc = idFunc
		where idFunc = 1;

-- Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes
select funcionario.*, setor.*, acompanhante.* from funcionario
	join setor on fkSetor = idSetor
		join acompanhante on fkFunc = idFunc;

-- Exibir os dados de um funcionário específico, do seu setor e dos seus acompanhantes
select funcionario.*, setor.*, acompanhante.* from funcionario
	join setor on fkSetor = idSetor
		join acompanhante on fkFunc = idFunc
			where idFunc = 6;

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
		(experiencia in ('Experiente', 'Novato')),
	telefone_Fixo varchar(20),
    telefone_Cel varchar(20),
    email varchar(100), constraint chkEmail check
		(email like ('%@%')),
	fkTreinadorExp int, constraint foreign key (fkTreinadorExp)
		references treinador(idTreinador)
) auto_increment = 10;
SET FOREIGN_KEY_CHECKS=0;

create table nadador (
	idNadador int primary key auto_increment, 
    nome varchar(45),
    sobrenome varchar(45),
    estado varchar(45),
    nascimento date, 
    fkTreinador int, constraint foreign key (fkTreinador)
		references treinador(idTreinador)
) auto_increment = 100;

-- Inserir dados nas tabelas, de forma que exista mais de um nadador para algum treinador, e mais de um treinador sendo orientado por algum treinador mais experiente.
desc treinador;

insert into treinador values
	(null, 'Janna', 'Livramento', 'Experiente', null, '11-98983-1229', 'janna.livramento@hotmail.com', null),
	(null, 'Amanda', 'Azevedo', 'Novato', null, '11-99933-9999', 'amanda.azevedo@gmail.com', 10),
	(null, 'Pedro', 'Pedroso', 'Experiente', null, '11-97523-3333', 'pedro.pedroso@gmail.com', null),
	(null, 'Luiz Nison', 'Filler', 'Novato', null, '11-97372-1555', 'luiz.f@gmail.com', 12),
	(null, 'Giulia', 'Giuliana', 'Novato', null, '11-92456-4443', 'giulia.giuliana@outlook.com', 12),
	(null, 'Romário', 'Mariano', 'Novato', null, '11-96777-2225', 'romarinho.maneirinho@hotmail.com', 10),
	(null, 'José', 'Pereira de Lima', 'Experiente', null, '11-97652-1111', 'zezinho.borracharia@gmail.com', null),
	(null, 'Marcella', 'Caetano Veloso', 'Novato', null, '11-97561-0000', 'marcelinha.do.agogo@gmail.com', 16);
    
insert into nadador values
	(null, 'Kara', 'Cracha', 'SP', '1980-01-01', 10), 
	(null, 'Charada', 'Mística', 'RJ', '1993-02-18', 11),
	(null, 'Curirin', 'Curioso', 'MT', '1999-08-18', 11),
	(null, 'Rato', 'Borrachudo', 'SP', '1982-05-23', 12), 
	(null, 'Kara', 'Cracha Junior', 'SP', '1995-01-02', 13), 
	(null, 'Rassã', 'Sudein', 'TO', '1956-09-11', 14), 
	(null, 'Lin', 'Baden', 'ES', '1969-06-19', 15), 
	(null, 'Biro', 'Liru', 'BH', '1953-10-01', 16), 
	(null, 'Roberto', 'Carlos', 'MG', '1932-07-13', 17),
	(null, 'Carlos', 'Caruso', 'SP', '1968-02-01', 17);

-- Exibir todos os dados de cada tabela criada, separadamente.
select * from nadador;

select * from treinador;

-- Exibir os dados dos treinadores e os dados de seus respectivos nadadores.
select treinador.*, nadador.* from treinador
	join nadador on fkTreinador = idTreinador;

-- Exibir os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores.
select treinador.*, nadador.* from treinador
	join nadador on fkTreinador = idTreinador
		where idTreinador = 11;

-- Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores.
-- Me desculpa, professora. Eu não entendi como fazer o comando, mas eu tentei escrever abaixo o que eu entendi. 
select treinador.* from treinador 
	join treinador on fkTreinadorExp = fkTreinador
		join treinador on fkTreinador = idTreinador;

-- Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores, porém somente de um determinado treinador orientador (informar o nome do treinador na consulta).


-- Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados dos respectivos treinadores orientadores.


-- Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos respectivos nadadores e os dados do seu treinador orientador.

