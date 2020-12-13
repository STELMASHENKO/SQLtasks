# Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
# Вывести: type, model, speed

Select distinct p.type, l.model, l.speed
from product p,
     laptop l
where l.speed < all (select speed from pc)
  and p.type = 'laptop'

