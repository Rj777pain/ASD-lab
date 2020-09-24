use EPharm;

#creating views
create view billView as select distinct bid as Id ,pname as Patient,phname as Pharmacy,drname as Doctor,Total from bill,pharmacy,prescription,patient,doctor
	where (pharmacy.phid=bill.phid and bill.prid=prescription.prid and prescription.pid=patient.pid and prescription.drid=doctor.drid)
    order by bid;
create view conView as select phname as Pharmacy, mname as Manufacturer, period+" Years" as Period 
	from pharmacy,manufacturer,contract
    where (pharmacy.phid=contract.phid and manufacturer.mid=contract.mid)
    order by phname asc;

    
#altering views
alter view billView as select distinct bid as Id ,pname as Patient,phname as Pharmacy,drname as Doctor,Total,total*1.10 as Grand_Total from bill,pharmacy,prescription,patient,doctor
	where (pharmacy.phid=bill.phid and bill.prid=prescription.prid and prescription.pid=patient.pid and prescription.drid=doctor.drid)
    order by bid;
    
#views
select * from conView;
select * from billView;

#drop view
drop view conView;

create view conView as select phname as Pharmacy, mname as Manufacturer, period+" Years" as Period 
	from pharmacy,manufacturer,contract
    where (pharmacy.phid=contract.phid and manufacturer.mid=contract.mid)
    order by phname asc;