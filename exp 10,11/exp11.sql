use EPharm;

#set operations
#union
select drugname,price from drugs where drugid<5
union
select drugname,price from drugs where mid=202;

select drugname,price from drugs where drugid<5
union all
select drugname,price from drugs where mid=202;

#intersect, implemented using join beacause mysql doesn support intersect
select distinct B.phid,B.contact from pharmacy as B
	inner join (select * from pharmacy where phid<103) A on B.phid=A.phid;
#minus cannot be used in mysql but can be implemented using join

#nested queries
select phname,address from pharmacy 
	where phname in (select Pharmacy from billview);

select drugname,price from drugs
	where potency>=(select avg(potency) from drugs);
    
#Join queries
#inner join
select pharmacy.phname,contract.period,contract.mid
	from pharmacy 
    inner join contract on pharmacy.phid=contract.phid;

#left join
select pharmacy.phname, bill.phid, bill.Date
	from pharmacy
    left join bill on pharmacy.phid=bill.phid;
#right join
select prescription.prid,prescription.price,drugs.drugname
	from prescription
    right join drugs on prescription.drugid=drugs.drugid;
    
