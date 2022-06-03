select  ps.`Scientific Field_Scientific Name`,ps.`Project_ID Project`, p.`Researcher_ID Researcher`
from `project_has_scientific field` ps, project p 
where `Project_ID Project` = `ID Project` and `End Date` is null
order by `Scientific Field_Scientific Name` ;
