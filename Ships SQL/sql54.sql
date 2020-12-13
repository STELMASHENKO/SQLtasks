# С точностью до 2-х десятичных знаков определите среднее число орудий всех линейных кораблей (учесть корабли из таблицы Outcomes).

SELECT CAST(AVG(numguns * 1.0) AS NUMERIC(4, 2)) as AVG_nmg
FROM (SELECT ship, type, numguns
      FROM Outcomes
               LEFT JOIN Classes ON ship = class
      UNION
      SELECT name, type, numguns
      FROM Ships as S
               INNER JOIN Classes as C ON c.class = s.class) AS T
WHERE type = 'bb'

