# Для каждого производителя, у которого присутствуют модели хотя бы в одной из таблиц PC, Laptop или Printer,
# определить максимальную цену на его продукцию.
# Вывод: имя производителя, если среди цен на продукцию данного производителя присутствует NULL, то выводить для этого производителя NULL,
# иначе максимальную цену.


Select maker, case count(*) when count(price) then max(price) END as Mprice
from (select maker, price
      from product
               inner join pc on product.model = pc.model
      union
      select maker, price
      from product
               inner join laptop on product.model = laptop.model
      union
      select maker, price
      from product
               inner join printer on product.model = printer.model) a
group by maker

