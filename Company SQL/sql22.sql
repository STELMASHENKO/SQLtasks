# Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью.
# Вывести: speed, средняя цена.

Select speed, avg(price)
from PC
where speed > 600
group by speed

