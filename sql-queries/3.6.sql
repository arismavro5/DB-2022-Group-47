SELECT
  `Researcher_ID Researcher`,
  COUNT(`Project_ID Project`) AS `value_occurrence` 
FROM
  project_has_researcher, researcher
WHERE DoB > CURRENT_DATE - INTERVAL 40 YEAR and `ID Researcher` = `Researcher_ID Researcher`
GROUP BY 
  `Researcher_ID Researcher`
ORDER BY 
  `value_occurrence` DESC
LIMIT 5;