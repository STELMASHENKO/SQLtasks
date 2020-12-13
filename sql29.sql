# В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день
# [т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход).
# Использовать таблицы Income_o и Outcome_o.

SELECT COALESCE(i.point, o.point) AS point, COALESCE(i.date, o.date) AS date, i.inc, o.out
FROM Income_o i FULL JOIN Outcome_o o
ON i.point = o.point
    AND i.date = o.date

