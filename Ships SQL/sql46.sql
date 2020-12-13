# Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal),
# вывести название, водоизмещение и число орудий.

select name as n, displacement as d, numguns as ng
from ships
         inner join classes on ships.class = classes.class
where name in (select ship from outcomes where battle = 'Guadalcanal')
union
select ship as n, displacement as d, numguns as ng
from outcomes
         inner join classes on outcomes.ship = classes.class
where battle = 'Guadalcanal'
  and ship not in (select name from ships)
union
select ship as n, null as d, null as ng
from outcomes
where battle = 'Guadalcanal'
  and ship not in (select name from ships)
  and ship not in (select class from classes)

