select `Full Name`, count(`Researcher_ID Researcher`) 
from project_has_researcher, researcher
where `Project_ID Project` not in(select `Project_ID Project` from deliveries) and `Researcher_ID Researcher` = `ID Researcher` 
group by `Researcher_ID Researcher`
having count(`Researcher_ID Researcher`)>=5