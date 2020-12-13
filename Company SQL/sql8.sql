# Найдите производителя, выпускающего ПК, но не ПК-блокноты.

select distinct maker
from product
where type = 'PC'
  and maker not in (select maker
                    from product
                    where type = 'laptop')

