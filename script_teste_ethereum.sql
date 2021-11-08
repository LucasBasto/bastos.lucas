reate database PROJETO
go

use PROJETO
go

create table BLOCK(
NumberBlock int primary key,
Date_block date not null,
Time_block time(0) not null,
Hash_block varchar(100) not null
)
go

create table TOKEN(
IdToken int primary key identity,
Adress varchar(150) not null,
Symbol varchar(10),
Name varchar(50),
Decimals int,
Total_supply varchar(50),
Number_block int  
)
go

alter table token
add constraint FK_Block_Token
foreign key(Number_block) references BLOCK(NumberBlock)
go



/* Primeira questão : Tokens criadas por Bloco */

select Number_block, count(adress) as 'Qtd Token' from token
group by Number_block
go 

/* Segunda Questão: Blocos contendo Tokens por dia */

select Date_block, count(Numberblock)as 'Blocks for day' from block
group by Date_block
go


/* Terceira questão: Variação na quantidade de blocos em um dia */

Select date_block, count(NumberBlock) as 'Total blocks created last 15 days'
from BLOCK
where Date_block between '2021-10-24' and '2021-11-07'
group by date_block	
go


/* Quarta questão: Variação na quantidade de tokens por dia nos ultimos 15 dias */

Select b.Date_block, count(t.adress) as 'tokens variation for last 15 days'
from Block b
inner join token t
on t.Number_block = b.NumberBlock
where Date_block between '2021-10-24' and '2021-11-07' 
group by Date_block
