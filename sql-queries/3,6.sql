SELECT `Researcher_ID Researcher`, count(*)
FROM project_has_researcher, researcher
GROUP BY `Researcher_ID Researcher`
HAVING DoB > '01/01/1982'; 
---------
SELECT
  `Researcher_ID Researcher`,
  COUNT(`Project_ID Project`) AS `value_occurrence` 
FROM
  project_has_researcher
WHERE DoB > '01/01/1982'
GROUP BY 
  `Researcher_ID Researcher`
ORDER BY 
  `value_occurrence` DESC
LIMIT 1;

-----
--OR:
HAVING COUNT(*) = MAX(COUNT(*))
