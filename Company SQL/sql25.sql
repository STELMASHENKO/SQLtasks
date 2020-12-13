# Найдите производителей принтеров, которые производят ПК
# с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM.
# Вывести: Maker

SELECT DISTINCT maker
FROM Product
WHERE type = 'printer'
  AND maker IN (SELECT maker
                FROM Product
                WHERE model IN (SELECT model
                                FROM PC
                                WHERE ram = (SELECT MIN(ram) from pc)
                                  and speed = (SELECT MAX(speed)
                                               FROM (SELECT speed
                                                     FROM PC
                                                     WHERE ram = (SELECT MIN(ram)
                                                                  FROM PC
                                                     )
                                                    ) AS z4
                                )
                )
)

