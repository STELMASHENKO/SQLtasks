# Определить названия всех кораблей из таблицы Ships, которые могут быть линейным японским кораблем,
# имеющим число главных орудий не менее девяти, калибр орудий менее 19 дюймов и водоизмещение не более 65 тыс.тонн

Select name
from ships a
         inner join classes b on a.class = b.class
where country = 'japan'
  and type = 'bb'
  and (numGuns >= 9 or numGuns is null)
  and (bore < 19 or bore is null)
  and (displacement <= 65000 or displacement is null)
