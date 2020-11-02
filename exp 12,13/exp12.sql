use EPharm;
#using CASE and RETURN
DELIMITER //

create function sex_of_person(s character)
returns text deterministic
begin
	declare sex varchar(20);
    case s
		when 'F' then set sex='FEMALE';
		when 'M' then set sex='MALE';
		else set sex='NIL';
	end case;
return sex;
end;//
DELIMITER ;
select pname,sex_of_person(sex) from patient;

#Using IF control structure and RETURN
DELIMITER //
create function contract_details(n int)
returns text deterministic
begin
declare cont varchar(20);
    if n<3
		then set cont="Long Contract";
	else
		set cont="Short Contract";
	end if;
return cont;
end;//
DELIMITER ;
select conid,contract_details(period) from contract;

#using WHILE
DELIMITER //
create function no_of_digits(n int)
returns int deterministic
begin
declare i int;
	set i=0;
	while n > 0 do
		set i=i+1;
        set n=n/10;
	end while;
return i;
end;//
DELIMITER ;
select contact,no_of_digits(contact) from pharmacy;

#using LOOP and ITERATE
DELIMITER //
create function factorial(n int)

returns int deterministic
begin
	declare fact int;
    set fact=1;
    loop_label:loop
		set fact=fact*n;
        set n=n-1;
        if n>0 then
			iterate loop_label;
		end if;
        LEAVE loop_label;
	END LOOP loop_label;
return fact;
end;//
DELIMITER ;
select drugid,factorial(drugid) from drugs where drugid<=5;





