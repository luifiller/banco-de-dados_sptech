-- Criar um banco de dados chamado Venda
create database venda;

-- Selecionar banco de dados
use venda;

-- Criar tabelas correspondentes à modelagem
create table cliente (
	idCliente int primary key auto_increment,
    nome varchar(45),
    sobrenome varchar(45),
    email varchar(150), constraint chkEmail check (email like ('%@%')),
    fkCliente int, foreign key (fkCliente)
		references cliente(idCliente)
);

create table endereco (
	idEndereco int primary key auto_increment,
    cep char(9),
    bairro varchar(45),
    cidade varchar(45)
);

create table endCompleto (
	fkEnd int, foreign key (fkEnd)
		references endereco(idEndereco),
	fkCliente int, foreign key (fkCliente)
		references cliente(idCliente),
	primary key (fkEnd, fkCliente),
	numero int,
    complemento varchar(45)
);

create table produto (
	idProduto int primary key,
    nome varchar(45),
    descricao varchar(255),
    preco decimal(8,2)
);

create table venda (
	idVenda int primary key auto_increment,
    fkCliente int, foreign key (fkCliente)
		references cliente(idCliente),
	dataHora datetime
);

create table carrinhoVenda (
	fkVenda int, foreign key (fkVenda)
		references venda(idVenda),
    fkCliente int, foreign key (fkCliente)
		references cliente(idCliente),
    fkProduto int, foreign key (fkProduto)
		references produto(idProduto),
	primary key (fkProduto, fkVenda, fkCliente),
	qtdProduto int
);

-- Inserir dados nas tabelas, de forma que exista mais de uma venda para cada cliente, e mais de um cliente sendo indicado por outro cliente.
insert into cliente values 
	(null, 'Luiz Nison', 'Filler', 'luiz@gmail.com', null),
	(null, 'Giulia', null, 'giulia@gmail.com', 1),
	(null, 'Pedro Henrique', 'Lima', 'pedro@gmail.com', null),
	(null, 'Nadia', 'Pereira', 'nadia@gmail.com', 3);

insert into endereco values 
	(null, '01414-905', 'Vila Medeiros', 'São Paulo'),
	(null, '04253-000', 'Vila Sônia', 'São Paulo'),
	(null, '08250-000', 'Vila Maria', 'São Paulo');
    
insert into endCompleto values 
	(1, 1, 608, null),
	(3, 2, 55, null),
	(3, 3, 22, null),
	(2, 4, 608, null);
    
insert into produto values 
	(1, 'Caneta', 'Caneta de cor azul e ponta fina', 9.5),
	(2, 'Caneta', 'Caneta de cor preta e ponta fina', 9.5),
	(3, 'Borracha', 'Borracha de cor branca, redonda e macia', 2.7),
	(4, 'Borracha', 'Borracha de cor verde, retangular e macia', 9.5),
	(5, 'Caderno', 'Caderno de 100 folhas de capa dura', 22.5);
 
insert into venda values 
	(null, 1, '2022-10-31 15:30:00'),
	(null, 1, '2022-10-25 08:53:00'),
	(null, 2, '2022-10-30 10:22:00'),
	(null, 3, '2022-10-30 10:22:00'),
	(null, 4, '2022-10-30 21:05:00');
    
insert into carrinhoVenda values 
-- Itens da venda que o cliente 1 fez
    (1, 1, 1, 2),
	(1, 1, 2, 3),
	(1, 1, 5, 1),
    (2, 1, 3, 1),
    (3, 2, 1, 1),
    (3, 2, 5, 2),
    (4, 3, 2, 1),
    (4, 3, 4, 2),
    (5, 4, 2, 4),
    (5, 4, 4, 1),
    (5, 4, 5, 2);
    

-- Exibir todos os dados de cada tabela criada, separadamente.
select * from cliente;
select * from endereco;
select * from endCompleto;
select * from produto;
select * from venda;
select * from carrinhoVenda;

-- Exibir os dados dos clientes e os dados de suas respectivas vendas.
select * from cliente as c
	join venda as v on v.fkCliente = c.idCliente;

-- Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas.
select c.nome,
		c.sobrenome,
		c.email,
		v.idVenda,
		v.dataHora
		from cliente as c
			join venda as v on v.fkCliente = c.idCliente
				where c.idCliente = 1;

-- Exibir os dados dos clientes e de suas respectivas indicações de clientes
select * from cliente as cIndicador
	join cliente as cIndicado
		on cIndicado.fkCliente = cIndicador.idCliente;

-- Exibir os dados dos clientes indicados e os dados dos respectivos clientes indicadores, porém somente de um determinado cliente indicador (informar o nome do cliente que indicou na consulta).
select cIndicado.nome as 'Nome do cliente indicado',
		cIndicado.sobrenome as 'Sobrenome do cliente indicado', 
        cIndicado.email as 'Email do cliente indicado',
        cIndicador.nome as 'Nome do cliente indicador',
        cIndicador.sobrenome as 'Sobrenome do cliente indicador',
        cIndicador.email as 'Email do cliente indicador'
			from cliente as cIndicado
				join cliente as cIndicador
					on cIndicado.fkCliente = cIndicador.idCliente;

-- Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os dados das respectivas vendas e dos produtos.
select clI.nome,
		clI.sobrenome,
        clI.email,
        cl.nome as 'Nome do cliente indicador',
        cl.sobrenome as 'Sobrenome do cliente indicador',
        cl.email as 'E-mail do cliente indicador',
        v.dataHora as 'Data da venda',
        p.nome as 'Nome do produto',
        p.descricao,
        p.preco,
        caV.qtdProduto
			from cliente as clI
			join cliente as cl on clI.fkCliente = cl.idCliente
				join venda as v on v.fkCliente = clI.idCliente
					join produto as p
					join carrinhoVenda as caV on caV.fkVenda = v.idVenda and caV.fkCliente = clI.idCliente and caV.fkProduto = p.idProduto;

-- Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda.
select v.dataHora,
        p.nome,
        c.qtdProduto
		from produto as p
			join venda as v 
				join carrinhoVenda as c on c.fkVenda = v.idVenda and c.fkProduto = p.idProduto
					where idVenda = 1;
                
-- Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos agrupados pelo nome do produto.
select p.nome,
		p.preco,
		sum(qtdProduto) as 'Soma da quantidade de produtos vendidos'
			from produto as p
				join carrinhoVenda as c on c.fkProduto = p.idProduto
					group by p.nome;

-- Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas vendas, e os clientes que não realizaram nenhuma venda.
insert into cliente values 
	(null, 'Janna', null, 'janna@gmail.com', 3);

select * from cliente as c
	left join carrinhoVenda as ca on ca.fkCliente = c.idCliente;
    
-- Exibir o valor mínimo e o valor máximo dos preços dos produtos;
select max(preco) as "Maior preço", 
		min(preco) as "Menor preço"
			from produto;

-- Exibir a soma e a média dos preços dos produtos;
select sum(preco) as 'Soma dos preços dos produtos',
		round(avg(preco),2) as 'Média dos preços dos produtos'
			from produto;
            
-- Exibir a quantidade de preços acima da média entre todos os produtos;
select count(preco) as 'Quantidade de preços acima da média' from produto 
	where preco > (select avg(preco) from produto);

-- Exibir a soma dos preços distintos dos produtos;
select sum(distinct preco) from produto;

-- Exibir a soma dos preços dos produtos agrupado por uma determinada venda;
select sum(preco) from produto as p 
	join carrinhoVenda as ca on ca.fkProduto = p.idProduto
		join venda as v on v.idVenda = fkVenda
			where v.idVenda = 3 and v.fkCliente = 2
				group by v.idVenda;