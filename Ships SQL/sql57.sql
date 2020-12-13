# Для классов, имеющих потери в виде потопленных кораблей и не менее 3 кораблей в базе данных, вывести имя класса и число потопленных кораблей.

with v as (select class
           from (select class, name
                 from ships
                 union
                 select ship as class, ship as name
                 from outcomes
                 where ship in (select class from classes)) r
           group by class
           having count(name) >= 3),
     w as (select b.ship, a.class, result
           from ships a
                    join outcomes b on a.name = b.ship
           where result = 'sunk'
           union
           select d.ship, d.ship, result
           from classes c
                    join outcomes d on c.class = d.ship
           where result = 'sunk')
select w.class, count(result) as sunken
from v
         inner join w on v.class = w.class
group by w.class
