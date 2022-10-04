-- AVALIAÇÃO CONTINUADA 2 

-- Criar database e selecionar ele
create database continuada2;

use continuada2;

-- Criar tabelas conforme a modelagem lógica
create table hotel (
	idHotel int primary key auto_increment,
    nome varchar(45),
    endereco varchar(45),
    tipo varchar(20), constraint chkTipo check 
		(tipo in ("Matriz", "Filial"))
);

create table quarto (
	idQuarto int auto_increment,
    nome varchar(45),
    andar varchar(10),
    tipoQuarto varchar(15), constraint chkTipoQuarto check 
		(tipoQuarto in ("Casal", "Solteiro")),
	fkHotel int, foreign key (fkHotel)
		references hotel(idHotel),
	primary key (idQuarto, fkHotel)
);

-- Inserir dados nas duas tabelas
insert into hotel values 
	(null, "Hotel 1", "Rua Qualquer Uma, 569", "Matriz"),
	(null, "Hotel 2", "Rua Ruazinha, 12", "Filial"),
	(null, "Hotel 3", "Rua Qualquer Lugar, 222", "Filial"),
	(null, "Hotel 4", "Rua Não sei Onde, 777", "Filial"),
	(null, "Hotel 5", "Rua Aonde, 78", "Filial");

insert into quarto values 
	(null, "Grand Luz", "1", "Casal", "1"),
	(null, "Bonjour", "1", "Solteiro", "1"),
	(null, "Claridão", "1", "Solteiro", "2"),
	(null, "ObaOba", "3", "Casal", "3"),
	(null, "Upa Neném", "2", "Casal", "4"),
	(null, "Canapé a Dois", "3", "Casal", "5"),
	(null, "Canapé Solitário", "4", "Solteiro", "5");
    
-- a) Exibir todos os dados das tabelas separadamente.
select * from hotel;
select * from quarto;

-- b) Exibir os dados dos hotéis e seus respectivos quartos.
select h.nome,
		h.endereco,
		h.tipo,
		q.nome,
		q.andar,
		q.tipoQuarto 
			from hotel as h
				join quarto as q 
					on fkHotel = idHotel;

-- c) Exibir apenas o nome do hotel e o nome dos respectivos quartos do tipo 'solteiro';
select 	h.nome as "Nome Hotel",
		q.nome as "Nome do quarto de solteiro"
			from hotel as h
				join quarto as q
					on fkHotel = idHotel
						where tipoQuarto = "Solteiro";

-- d) Exibir os dados dos hotéis e sua respectiva matriz;
select * from hotel 
	where tipo = "Matriz";

-- e) Exibir apenas o nome e o andar de um determinado quarto que contém um determinado caracter;
select 	q.nome,
		q.andar
			from quarto as q
				where q.nome like ("%d%");

-- f) Atualize o tipo de algum quarto. Exiba novamente os dados da tabela após a atualização.
update quarto set tipoQuarto = "Solteiro" where idQuarto = 1;

select * from quarto;

-- g) Exclua algum quarto da tabela. Exiba novamente os dados da tabela após a exclusão. 
delete from quarto where idQuarto = 6;

select * from quarto;

-- Exibir os dados dos hotéis, sua respectiva matriz e quartos. Pode escolher os campos e apelidálos caso seja necessário.
select h.nome as "Nome do Hotel",
		h.endereco as "Endereço do Hotel",
		h.tipo as "Tipo do Hotel",
		q.nome as "Nome do Quarto",
		q.andar as "Andar do Quarto",
		q.tipoQuarto as "Tipo do Quarto"
			from hotel as h
				join quarto as q
					on fkHotel = idHotel;
                    
-- Efetue o comando para excluir o banco de dados do MySQL Server (Schema). 
drop database continuada2;