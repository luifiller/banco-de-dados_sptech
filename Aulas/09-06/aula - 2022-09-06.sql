use sprint2;

create table funcionario(
	idFunc int primary key auto_increment,
    nome varchar(45), -- + sobrenome = atributo composto
    sobrenome varchar(45),
    telefoneFixo char(11), -- + telefoneCelular = atributo multivalorado
    telefoneCelular char(12),
    ddd char(2), -- + prefixo e sufixo = atributo composto
    prefixo char(5),
    sufixo char(4)
);

insert into funcionario (nome, telefoneFixo) values
	("Vivian", "11-54321111");
    
select concat ("Meu nome completo é ", nome, " ", sobrenome) as Completo
	from funcionario;
    
insert into funcionario (sobrenome, ddd, prefixo, sufixo) values
	("Souza", "11", "98765", "3344");

update funcionario set nome = "Paulo", sobrenome = "Silva", prefixo = "90000" 
	where idFunc = 3;

select concat ("Meu nome completo é ", ifnull(nome, ""), "", ifnull(sobrenome,"")) as Completo
	from funcionario;


