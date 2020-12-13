# Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.

Select distinct battle
from outcomes
where ship in (select name from ships where class = 'Kongo')

