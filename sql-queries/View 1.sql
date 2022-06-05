-- View with researchers and project which work for
CREATE VIEW projects_for_each_researcher AS
SELECT `Full Name`,`Project_ID Project`
FROM researcher,project_has_researcher
WHERE `Researcher_ID Researcher` = `ID Researcher`
ORDER BY `Full Name`