use EPharm;

#creating function
DELIMITER //
create function sample_tax(n int)
returns float deterministic
begin
	declare t float;
    set t=n/5;
    return t;
end;//
DELIMITER ;
#callling function
select total,sample_tax(total) from bill;
#more examples are in experiment 12

#creating procedure
DELIMITER $$    
CREATE PROCEDURE AboveAgePatients(
    IN Page INT,
    OUT count INT)
BEGIN
SELECT count(pid) INTO count FROM patient WHERE age >= Page;
END; $$
DELIMITER ;
#calling procedure
CALL AboveAgePatients(25, @count);
SELECT @count;
