/* Encontrar os Blocos criados nos ultimos 15 dias  */

Select NumberBlock, Date_block from BLOCK
 where Date_block between '2021-10-24' and '2021-11-07'



/* Encontrar as tokens criadas por dia nos ultimos 15 dias */

Select IdToken, Adress_token, Date_block
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
	   t.Adress_token, 
	   ISNULL(t.Symbol_token,'---') as 'Symbol',
	   ISNULL(t.Name_token,'---') as 'Name' ,
	   ISNULL(t.Decimals_token,'0') as 'Decimals', 
	   ISNULL(t.Total_supply_token,'---') as 'Total_supply', 
	   b.NumberBlock, 
	   b.Date_block, 
	   b.time_block, 
	   b.Hash_block 
from Block b
inner join token t
on Numberblock = Number_block
go
