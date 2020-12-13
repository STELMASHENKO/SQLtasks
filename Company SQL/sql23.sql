# Найдите производителей, которые производили бы как ПК
# со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
# Вывести: Maker

select maker
from product a
         inner join
     PC b on a.model = b.model
where speed >= 750
    intersect
select maker
from product a
         inner join
     laptop c on a.model = c.model
where speed >= 750

