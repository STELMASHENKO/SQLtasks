# Найдите названия кораблей с орудиями калибра 16 дюймов (учесть корабли из таблицы Outcomes).

Select name
from ships a
         inner join classes b on a.class = b.class
where bore = 16
union
select ship as name
from outcomes
where ship not in (select name from ships)
  and ship in (select class from classes where bore = 16)

