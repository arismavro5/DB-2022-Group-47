SELECT p.Amount,p.`Organization_Organization Name`, s.`Full Name`
FROM project as p, company as c, stem as s
WHERE p.`Organization_Organization Name` = c.`Organization Name` and s.`ID Stem`=p.`Stem_ID Stem`
ORDER BY Amount;