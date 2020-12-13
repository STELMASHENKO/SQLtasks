# Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
# Вывести: maker, максимальная цена.

Select maker, max(price)
From product
         inner join
     PC on product.model = pc.model
Group by maker

