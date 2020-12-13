# Для каждого класса определите число кораблей этого класса, потопленных в сражениях. Вывести: класс и число потопленных кораблей.

select class, sum(cast(sunks as numeric(6))) as sunks
from (select class, case when result = 'sunk' then '1' else '0' end as sunks
      from (select class, ship as name, result
            from classes
                     left join outcomes on classes.class = outcomes.ship
            union
            select class, name, result
            from ships
                     inner join outcomes on ships.name = outcomes.ship) a) b
group by class
