# Укажите корабли, потопленные в сражениях в Северной Атлантике (North Atlantic). Вывод: ship.

Select ship
from outcomes
where result = 'sunk'
  and battle = 'North Atlantic'

