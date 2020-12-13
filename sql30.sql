# В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
# Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).
#

with a as (select point, date, null as out, inc
from Income
union all
select point, date, out, null as inc
from Outcome
)
select point, date, sum(out) as out, sum(inc) as inc
from a
group by date, point

