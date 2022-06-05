CREATE VIEW total_amount_for_each_field AS
SELECT SUM(Amount),`Scientific Field_Scientific Name`
FROM `project_has_scientific field`,project
WHERE `ID Project` = `Project_ID Project`
GROUP BY `Scientific Field_Scientific Name`
ORDER BY Amount desc