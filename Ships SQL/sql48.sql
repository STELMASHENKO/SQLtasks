# Найдите классы кораблей, в которых хотя бы один корабль был потоплен в сражении.

select class
from ships
where name in (select ship from Outcomes where result = 'sunk')
union
select ship as class
from Outcomes
where ship not in (Select name from ships)
  and ship in (Select class from classes)
  and result = 'sunk'

