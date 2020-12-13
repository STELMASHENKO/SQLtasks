# Найдите классы, в которые входит только один корабль из базы данных (учесть также корабли в Outcomes).


select class
from (select name, class
      from ships
      union
      select class as name, class
      from classes,
           outcomes
      where classes.class = outcomes.ship) a
group by class
having count(a.name) = 1

