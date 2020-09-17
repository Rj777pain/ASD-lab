use EPharm;

#relationships between entities

#pharmacy have contract with manufacturer
select pharmacy.phid as Phid,phname as Pharmacy,mname as Manufacturer,Period 
	from pharmacy,manufacturer,contract
    where pharmacy.phid=contract.phid and manufacturer.mid=contract.mid
    order by pharmacy.phid asc;

#manufacturer has drugs
select drugid as Id,drugname as Drug,manufacturer.mname as Manufacturer
	from drugs,manufacturer
    where drugs.mid=manufacturer.mid
    order by drugid asc;
    
#doctor prescribed drugs to patient
select prid,pname as Patient,drugname as Drug, drname as Doctor,quantity from drugs,patient,doctor,prescription
	where (prescription.pid=patient.pid and prescription.drid=doctor.drid and prescription.drugid=drugs.drugid)
    order by prid,pname;
    
#prescription has bill from pharmacy 
select distinct bid,pname,phname,drname,total from bill,pharmacy,prescription,patient,doctor
	where (pharmacy.phid=bill.phid and bill.prid=prescription.prid and prescription.pid=patient.pid and prescription.drid=doctor.drid)
    order by bid;