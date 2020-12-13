# Найдите названия всех кораблей в базе данных, начинающихся с буквы R.

with a as (Select name
           from ships
           union all
           Select ship as name
           from Outcomes)
Select distinct name
from a
where name like 'R%'

