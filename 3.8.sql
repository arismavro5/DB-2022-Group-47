select p.`ID Project`, d.`Title`
from project p 
left join deliveries d 
on p.`ID Project` = d.`Project_ID Project`
group by p.`ID Project`;
-- where p.`ID Project` = d.`Project_ID Project` ; 
