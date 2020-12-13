# еречислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.


with a as (
    select model, price
    from PC
    where price = (select max(price) from pc)
    union
    select model, price
    from laptop
    where price = (select max(price) from laptop)
    union
    select model, price
    from printer
    where price = (select max(price) from printer))
select model
from a
where price = (select max(price) from a)

