# Посчитать остаток денежных средств на каждом пункте приема для базы данных с отчетностью не чаще одного раза в день. Вывод: пункт, остаток.

with a as (Select point, sum(inc) as q
           from Income_o
           group by point),
     b as (Select point, sum(out) as w
           from Outcome_o
           group by point)
select a.point, case when w is null then q else q - w end r
from a
         left join b on a.point = b.point
