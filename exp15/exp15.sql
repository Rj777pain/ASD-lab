use EPharm;

 create table new_drugs 
	(id int auto_increment primary key,act varchar(20),drugid int not null, drugname varchar(20) not null, mid int not null, potency int not null, price float not null, foreign key(mid) references manufacturer(mid));
#creating after insert trigger
delimiter //
create trigger new_drug_data
after insert on drugs
for each row 
insert into new_drugs
	set act='INSERT',drugid=new.drugid, drugname=new.drugname,mid=new.mid,potency=new.potency,price=new.price;
 //
delimiter ;

#creating after update trigger
delimiter //
create trigger alter_drug_data
after update on drugs
for each row 
insert into new_drugs
	set act='UPDATE',drugid=new.drugid, drugname=new.drugname,mid=new.mid,potency=new.potency,price=new.price;
 //
delimiter ;

#creating before delete trigger
delimiter //
create trigger deleted_drug_data
before delete on drugs
for each row 
insert into new_drugs
	set act='DELETE',drugid=old.drugid, drugname=old.drugname,mid=old.mid,potency=old.potency,price=old.price;
 //
delimiter ;
show triggers;
insert into drugs value(11,'TX',202,500,25);
update drugs set price=100 where drugid=11;
delete from drugs where drugid=11;
select * from new_drugs;

#create cluster
DELIMITER $$    
create procedure total_age(inout total integer)
begin
	declare flag integer default 0;
    declare temp integer;
    declare tAge cursor for
		select age from patient;
	declare continue handler for not found
		set flag=1;
    open tAge;
    
getAge: loop
	fetch tAge into temp;
    select temp;
    if flag=1 then leave getPrice;
    end if;
    set total=total+temp;
end loop getAge;
close tAge;
end;$$
DELIMITER ;
set @total=0;
call total_age(@total);
select @total;
-- drop table new_drugs;
-- drop trigger deleted_drug_data;
-- drop trigger new_drug_data;
-- drop trigger alter_drug_data;
