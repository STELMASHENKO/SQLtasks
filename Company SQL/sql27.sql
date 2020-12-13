# Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры.
# Вывести: maker, средний размер HD.


With c as (Select maker, hd
           From product a
                    Inner join
                PC b on a.model = b.model
           Where maker in (select maker
                           from product
                           where type = 'printer'))
Select maker, avg(hd)
From c
Group by maker

