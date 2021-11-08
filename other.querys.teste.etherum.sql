/* Outros Codigos  */


/* Opções para encontrar os Blocos criados nos ultimos 15 dias  */

Select NumberBlock, Date_block from BLOCK
 where Date_block between '2021-10-24' and '2021-11-07'



/* Opções para encontrar as tokens criadas por dia nos ultimos 15 dias */

Select IdToken, adress, Date_block
from Block b
inner join token t
on t.Number_block = b.NumberBlock
where Date_block between '2021-10-24' and '2021-11-07' 



/* Contagem de dias de todos os blocos e tokens desde a criação */

Select NumberBlock, DATEDIFF(day,Date_block,Getdate()) as 'Days ago' from block 
order by date_block desc


/* Contagem de blocos ultimos 15 dias */ 

Select count(NumberBlock) as 'Total blocks created last 15 days'
from BLOCK
where Date_block between '2021-10-24' and '2021-11-07'
group by date_block	
go

/* Contagem de dias desde a criação do bloco  e token */

Select NumberBlock, DATEDIFF(day,Date_block,Getdate()) as 'Days ago' from block 
order by date_block desc

Select t.IdToken, DATEDIFF(day,Date_block,Getdate()) as 'Days ago'
from Block b
inner join token t
on t.Number_block = b.NumberBlock

/* Junção das duas tabelas com todos os campos */

Select t.IdToken, 
	   t.adress, 
	   ISNULL(t.Symbol,'---') as 'Symbol',
	   ISNULL(t.Name,'---') as 'Name' ,
	   ISNULL(t.Decimals,'0') as 'Decimals', 
	   ISNULL(t.Total_supply,'---') as 'Total_supply', 
	   b.NumberBlock, 
	   b.Date_block, 
	   b.time_block, 
	   b.Hash_block 
from Block b
inner join token t
on Numberblock = Number_block
go




/*Trigger para inserção ou exclusão de tokens nos blocos ja existentes*/



	Create trigger TRG_Operation_Token_D
on dbo.Token
after delete
as
begin
			DECLARE @Id_Token int
			DECLARE @Adress varchar(150)
			DECLARE @Number_Block int
			DECLARE @Date_Op datetime
			DECLARE @Op_Status varchar(10)
			DECLARE @User_Op varchar (30)
			DECLARE @Message_Op varchar(100)

	Set @Date_Op = GETDATE()
	Set @User_Op = SUSER_ID()

	Insert into Historic
	(Id_Token,Adress,Number_Block,Date_Op,Op_status,User_Op,Message_Op)
	select IdToken, Adress, Number_block,GETDATE(),'Deleted',SUSER_ID(),'Token Deleted'
	from Deleted 

	Print 'TOKEN DELETED' 


	end

	go


	Create trigger TRG_Operation_Token_I
on dbo.Token
after insert
as
begin
			DECLARE @Id_Token int
			DECLARE @Adress varchar(150)
			DECLARE @Number_Block int
			DECLARE @Date_Op datetime
			DECLARE @Op_Status varchar(10)
			DECLARE @User_Op varchar (30)
			DECLARE @Message_Op varchar(100)

	Set @Date_Op = GETDATE()
	Set @User_Op = SUSER_ID()

	Insert into Historic
	(Id_Token,Adress,Number_Block,Date_Op,Op_status,User_Op,Message_Op)
	select IdToken, Adress, Number_block,GETDATE(),'Inserted',SUSER_ID(),'New token created'
	from inserted
	
	Print 'NEW TOKEN CREATED -' 

	end

	go



	/* Dados para teste da trigger */

insert into token values ('ojaidio23931913842jo24',null,null,null,null,8824936)
insert into token values ('ojaidio23832734o23842jo24',null,null,null,null,8824936)
insert into token values ('ojaidio238923o23842jo24',null,null,null,null,8824936)




select * from Historic

delete from Token 
where IdToken = 3


delete from Token 
where IdToken = 103

delete from Token 
where IdToken = 5


select * from Historic

select * from TOKEN

/* Criei esses blocks e tokens para testar a query na contagem de blocos e tokens,
pois há somente um dia que foi criado blocks e tokens nos ultimos 15 dias */


insert into BLOCK values(8926213, '2021-11-06', '11:41:09', '0x44a5bc81n3108d53b0cc61461f7a411aa2abd9ba7a8347661aae2771f486c152df')
insert into BLOCK values(8842533, '2021-11-07', '21:13:24', '0x83a28ce4948742f05637c8ca0c4935a514aec20790799e3fe30e1c3093950ad462')
insert into BLOCK values(8926219, '2021-11-06', '11:41:09', '0x44a5bc81n3108d53b0cc61461f7a411aa2ab4292a7a8347661aae2771f486c152df')
insert into BLOCK values(8842532, '2021-11-07', '21:13:24', '0x83a28ce4948742f05637c8ca0c4935a5242ec20790799e3fe30e1c3093950ad462')
insert into BLOCK values(8842500, '2021-11-07', '21:13:24', '0x83a28ce4948742f05637c8ca0c4935a514aec4920799e3fe30e1c3093950ad462')



insert into TOKEN values ('0xfead1532a0d2f71cef47fd9c354e544448e269d5', null, null, null, null, 8926213)
insert into TOKEN values ('0x0d831d794c4a8452211efell6fa0fsaseb4009c3', null, null, null, null, 8926213)
insert into TOKEN values ('0x5a8ad8141ccfbfc9682894ebe5sak34da695554a5', null, null, null, null, 8842533)
insert into TOKEN values ('0x1208238b3ab953fe4c12214ca3238aa5cdb14403', null, null, null, null, 8842533)
insert into TOKEN values ('0x5a8ad8141ccfbfc9682894ebe53634de95554a5', null, null, null, null, 8842500)
insert into TOKEN values ('0x1208238b3ab953fe4c12214ca3238aaasdb14403', null, null, null, null, 8842532)
