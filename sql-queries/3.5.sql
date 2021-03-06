SELECT a1,b1,times_played,amount

FROM (
	SELECT
		a.`Project_ID Project`,
		a.`Scientific Field_Scientific Name` AS a1,
		b.`Scientific Field_Scientific Name` AS b1,
		COUNT(*) AS times_played,
		RANK() OVER (ORDER BY COUNT(*) DESC) Rnk
	FROM `project_has_scientific field` a
	JOIN `project_has_scientific field` b
	ON a.`Scientific Field_Scientific Name` < b.`Scientific Field_Scientific Name` AND a.`Scientific Field_Scientific Name` != b.`Scientific Field_Scientific Name`
	GROUP by 1,2
) sub , project
WHERE `ID Project` = `Project_ID Project`
LIMIT 3
; 