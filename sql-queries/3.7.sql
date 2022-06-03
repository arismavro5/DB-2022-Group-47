select `Full Name`,`Stem_ID Stem`,Amount,`Organization_Organization Name`
from     project, company, stem
where `Organization_Organization Name` = `Organization Name` and `ID Stem` = `Stem_ID Stem`
order by Amount desc
limit 5;