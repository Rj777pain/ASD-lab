use EPharm;

-- #string functions
-- select pid,pname from patient
-- 	where length(pname)=3;
-- select ucase(mname) as Upper,lcase(mname) as Lower from manufacturer;
-- update pharmacy 
-- 	set phname=replace(phname,"Medicals","Store");
-- update pharmacy 
-- 	set phname=replace(phname,"Store","Medicals");
-- update doctor
-- 	set drname=concat("Dr ",drname);

#Date functions
-- alter table bill
-- 	add column Date date not null;
-- update bill
-- 	set Date=curdate();
-- update bill
-- 	set Date=adddate(curdate(),interval bid-470 day);
-- select datediff(Date,curdate()) as Days from bill;
-- select bid,date_format(date,'%d %M %Y') as Date from bill;

#Numeric functions

-- #advanced funcions
-- select database() as DB,session_user() as User;
-- select Period,Bin(period) from contract;
-- select drugname,if(potency>=250,"High","Low") as Potency from drugs;