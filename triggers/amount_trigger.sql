delimiter $$
CREATE TRIGGER amount_error
BEFORE INSERT on Project
for each row
begin 
if (Project.Amount < 100000)
then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Funding is too low';
end if;
if (Project.Amount > 1000000)
then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Funding is too high';
end if;
end;
$$