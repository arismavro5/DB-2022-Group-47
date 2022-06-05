select p.`Program_Program Name`,p.`ID Project`,r.`Full Name`
from project p, researcher r, project_has_researcher pr
where r.`ID Researcher` = pr.`Researcher_ID Researcher` and p.`ID Project` = pr.`Project_ID Project`
-- should have criteria