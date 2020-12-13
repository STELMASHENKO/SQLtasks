# Укажите сражения, которые произошли в годы, не совпадающие ни с одним из годов спуска кораблей на воду.


select name
from battles
where DATEPART(yy, date) not in (select DATEPART(yy, date)
                                 from battles
                                          join ships on DATEPART(yy, date) = launched)

