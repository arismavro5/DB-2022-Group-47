delimiter $$
CREATE TRIGGER deadline_passed
AFTER INSERT on Project
for each row
begin
if (curdate() > Project.`End Date`)
then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Deadline has passed';
end if;
end;
$$