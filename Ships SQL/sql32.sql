# Одной из характеристик корабля является половина куба калибра его главных орудий (mw).
# С точностью до 2 десятичных знаков определите среднее значение mw для кораблей каждой страны,
# у которой есть корабли в базе данных.

with c as (Select country, classes.class, bore, name
           from classes
                    left join ships
                              on classes.class = ships.class
           union all
           select distinct country, class, bore, ship
           from classes a
                    left join outcomes b
                              on a.class = b.ship
           where ship = class
             and ship not in (select name from ships))


select country, cast(avg(bore * bore * bore / 2) as numeric(6, 2)) as weight
from c
where name is not null
group by country

