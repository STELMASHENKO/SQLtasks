# Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.

select distinct a.model, b.model, a.speed, a.ram
from PC a,
     PC b
where a.model > b.model
  and a.ram = b.ram
  and a.speed = b.speed

