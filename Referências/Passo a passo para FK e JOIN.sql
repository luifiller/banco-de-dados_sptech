-- Script para configurar foreign keys e fazer joins
-- 1. Estabeler a regra de negócio
-- 2. Fazer a modelagem conceitual
-- 3. Modelagem lógica - DER com cardinalidade
-- 4. Modelo físico - detalhando qual o SGBD mais adequado e as estruturas do banco de dados (entidades, atributos e seus tipos, tipos de dados)
-- 5. Criação de database
-- 6. Selecionar um database para ser utilizado
-- 7. Criação de tabelas/entidades com suas devidas colunas/atributos

-- Após a modelagem, e sabendo onde se encontrará a foreign key (sempre onde tiver o máximo de cardinalidade igual a N)
-- Deverá ser adicionada uma coluna com o nome fkNOMEdoATRIBUTO e o tipo de dado (int) | alter table TABELA add column fkNOMEdoATRIBUTO int;
-- Depois, deverá ser adicionada a constraint de foreign key para essa nova coluna/atributo com a sua devida referência a outra tabela que está 
-- se relacionando| alter table TABELA add constraint foregin key (fkNOMEdoATRIBUTO) references OUTRAtabela(idOUTRAtabela);
-- Após add constraint, deve ser feito updates com os devidos ids da outra tabela | update TABELA set fkNOMEdoATRIBUTO = 1 where idOUTRAtabela = 1;

-- Agora sim é a hora dos JOINs
-- Para fazer um Join é necessário ter feito os passos supracitados e:
-- Fazer SELECT ... FROM ... JOIN ... ON ... = ... | select OUTRATABELA.*, TABELA.* from TABELA join OUTRATABELA on idOUTRAtabela = fkNOMEdoAtributo;

