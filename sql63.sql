# Определить имена разных пассажиров, когда-либо летевших на одном и том же месте более одного раза.

Select name
from Passenger
where ID_psg in (select ID_psg
                 from Pass_in_trip
                 group by ID_psg, place
                 having count(ID_psg) > 1)
