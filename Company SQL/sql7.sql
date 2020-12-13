# Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

select distinct product.model as model, price
from product
         inner join
     PC on product.model = PC.model
where maker = 'B'
union
select distinct product.model as model, price
from product
         inner join
     laptop on product.model = laptop.model
where maker = 'B'
union
select distinct product.model as model, price
from product
         inner join
     printer on product.model = printer.model
where maker = 'B'

