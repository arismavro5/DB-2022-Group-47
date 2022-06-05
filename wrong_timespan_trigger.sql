delimiter $$
CREATE TRIGGER timespan_check
BEFORE INSERT on project
for each row 
begin 
	if (project.Duration < 1)
	then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The project has too short of a lifespan' ;
    end if;
	if (project.Duration > 4)
	then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The project has too long of a lifespan' ;
	end if;
end;
$$