select `Project_ID Project`,`Full Name`,count(*) 
from project_has_researcher, researcher
where `Project_ID Project` not in(select `Project_ID Project` from deliveries) and `Researcher_ID Researcher` = `ID Researcher` 
having count(*)>=5