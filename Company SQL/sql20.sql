# Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.

Select maker, count(model) as count_PC
from product
where type = 'pc'
group by maker
having count(model) >= 3

