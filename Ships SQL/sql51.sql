# Найдите названия кораблей, имеющих наибольшее число орудий среди всех имеющихся кораблей
# такого же водоизмещения (учесть корабли из таблицы Outcomes).

with a as (select name, displacement, numguns
           from ships
                    inner join classes on ships.class = classes.class
           union
           select ship as name, displacement, numguns
           from outcomes
                    inner join classes on outcomes.ship = classes.class),
     b as (select displacement, max(numGuns) as numguns
           from (select displacement, numguns
                 from ships
                          inner join classes on ships.class = classes.class
                 union
                 select displacement, numguns
                 from outcomes
                          inner join classes on outcomes.ship = classes.class) s
           group by displacement)
select name
from a
         inner join b on a.displacement = b.displacement and a.numguns = b.numguns

