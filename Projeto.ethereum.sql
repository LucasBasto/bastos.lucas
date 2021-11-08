Create database PROJETO
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
Adress_token varchar(150) not null,
Symbol_token varchar(10),
Name_token varchar(50),
Decimals_token int,
Total_supply_token varchar(50),
Number_block int  
)
go

alter table token
add constraint FK_Block_Token
foreign key(Number_block) references BLOCK(NumberBlock)
go
