# Используя таблицы Income и Outcome, для каждого пункта приема определить дни, когда был приход, но не было расхода и наоборот.
# Вывод: пункт, дата, тип операции (inc/out), денежная сумма за день.


with q as (select point, date, sum(inc) as x
           from Income
           group by point, date),
     w as (select point, date, sum(out) as y
           from Outcome
           group by point, date)

select point, date, 'inc' as operation, x as money
from (select point, date, sum(x) as x, sum(y) as y
      from (select point, date, x, null as y
            from q
            union
            select point, date, null as x, y
            from w) t
      group by point, date
          except
      select q.point, q.date, x, y
      from q
          join w
      on q.point=w.point and q.date=w.date) p
where y is null

union

select point, date, 'out' as operation, y as money
from (select point, date, sum(x) as x, sum(y) as y
      from (select point, date, x, null as y
            from (select point, date, sum(inc) as x
                  from Income
                  group by point, date) e
            union
            select point, date, null as x, y
            from (select point, date, sum(out) as y
                  from Outcome
                  group by point, date) r) t
      group by point, date
          except
      select q.point, q.date, x, y
      from q
          join w
      on q.point=w.point and q.date=w.date) o
where x is null

