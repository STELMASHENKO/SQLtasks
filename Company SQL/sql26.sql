# Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква).
# Вывести: одна общая средняя цена.

with a as (select price
           from pc
           where model in (select model
                           from product
                           where maker = 'a')
           union all
           select price
           from laptop
           where model in (select model
                           from product
                           where maker = 'a'))
select avg(price) as avg_price
from a

