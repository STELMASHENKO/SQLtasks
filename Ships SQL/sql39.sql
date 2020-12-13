# Найдите корабли, `сохранившиеся для будущих сражений`;
# т.е. выведенные из строя в одной битве (damaged), они участвовали в другой, произошедшей позже.


SELECT distinct ship
FROM outcomes a
         LEFT JOIN Battles b ON b.name = a.battle
WHERE a.result = 'damaged'
  and EXISTS(SELECT ship
             FROM outcomes a2
                      LEFT JOIN Battles b2 ON b2.name = a2.battle
             WHERE a2.ship = a.ship
               and b2.date > b.date)

