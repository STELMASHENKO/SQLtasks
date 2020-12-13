# Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
# Вывести: maker, средний размер экрана.

Select maker, avg(screen)
from product
         inner join
     laptop on product.model = laptop.model
group by maker

