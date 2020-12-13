# Перечислите названия головных кораблей, имеющихся в базе данных (учесть корабли в Outcomes).


Select name
from ships
where name = class
union
select ship as name
from Outcomes a
         inner join
     classes b on a.ship = b.class
where class = ship

