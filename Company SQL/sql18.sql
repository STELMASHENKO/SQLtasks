#  Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price

SELECT distinct c.maker, a.priceA price
FROM (SELECT MIN(price) priceA
      FROM Printer
      WHERE color = 'y'
     ) a
         INNER JOIN
     Printer b ON a.priceA = b.price
         INNER JOIN
     Product c ON b.model = c.model
WHERE color = 'y'

