select 		temp1.`Organization_Organization Name`
from 	(	select count(`ID Project`) as counter,`Organization_Organization Name`,year(`Start Date`) as yr
			from project
			group by `Organization_Organization Name`,year(`Start Date`) ) as temp1,
		(	select count(`ID Project`) as counter,`Organization_Organization Name`,year(`Start Date`) as yr
			from project
			group by `Organization_Organization Name`,year(`Start Date`) ) as temp2
where temp1.`Organization_Organization Name` = temp2.`Organization_Organization Name` and temp1.counter = temp2.counter and temp1.counter>=10 and ( (temp1.yr - temp2.yr) = 1 )
group by `Organization_Organization Name`;