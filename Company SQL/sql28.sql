# Используя таблицу Product, определить количество производителей, выпускающих по одной модели.


with a as (select maker
           from product
           group by maker
           having count(model) = 1)
select count(*)
from a

