# Найдите названия всех кораблей в базе данных, состоящие из трех и более слов (например, King George V).
# Считать, что слова в названиях разделяются единичными пробелами, и нет концевых пробелов.

with a as (Select name
           from ships
           union all
           Select ship as name
           from Outcomes)
Select distinct name
from a
where name like '% % %'

