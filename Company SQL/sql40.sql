# Найти производителей, которые выпускают более одной модели,
# при этом все выпускаемые производителем модели являются продуктами одного типа.
# Вывести: maker, type

with a as (select maker
           from product
           group by maker
           having count(model) > 1
    intersect
select maker
from product
group by maker
having count(distinct type) = 1)
select distinct maker, type
from product
where maker in (select maker from a)

