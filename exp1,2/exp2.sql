use EPharm;

insert into pharmacy values(101,'Nanma Medicals',9999999, 'Westfort, Thrissur'),
	(102,'Daya Medicals',8888888,'Pallimoola,Ramavarmapram'),
    (103,'Sree Medicals',7777777,'Vadakke Stand, Thrissur'),
    (104,'Holy Medicals',6666666,'Sakthan Stand, Thrissur'),
    (105,'Life Medicals',5555555,'Poothole, Thrissur');


insert into manufacturer values(201,'MedA',212121),
    (202,'MedB',353535),   
    (203,'MedC',454545),
    (204,'MedC',787887),
    (205,'MedD',484848);

delete from manufacturer where mid>203;

insert into contract(phid,mid,period) values(101,202,2),
    (102,202,3),
    (101,203,1),
    (104,201,5),
    (103,201,1),
    (103,203,2),
    (105,202,1);
select * from contract;
select * from contract group by phid;

alter table drugs modify column price int not null; 

insert into drugs(drugid,drugname,mid,potency,price) values(1,'TA',202,500,25),
    (2,'TB',202,100,8),
    (3,'TC',201,250,20),
    (4,'TD',203,300,20),
    (5,'TE',201,50,2),
    (6,'TF',203,500,15),
    (7,'TG',202,150,5),
    (8,'TH',202,80,7),
    (9,'TA',201,250,13),
    (10,'TC',201,100,9);

select drugname,potency from drugs where price>15;

insert into patient(pid,pname,sex,age,contact) values(301,'Ram','m',22,9876541),
	(302,'Roy','m',51,4565456),
    (303,'Anna','f',15,1234567);
insert into doctor values(401,'Hari','Ortho'),(402,'Gouri','Physician');

alter table prescription modify column quantity int default 10;


insert into prescription(prid,drugid,pid,drid) values(1,1,301,401),
	(1,7,301,401),
    (1,2,301,401),
	(2,5,302,401),
    (3,6,303,402),
    (3,4,303,402);
select prid,drugname,pharmacy.phid,phname from drugs,pharmacy,manufacturer,contract,prescription
	where (pharmacy.phid=contract.phid and manufacturer.mid=contract.mid and drugs.mid=manufacturer.mid and prescription.drugid=drugs.drugid)
    order by prid,phname;
update prescription 
	set price=quantity*(select price from drugs where drugs.drugid=prescription.drugid);

alter table bill modify column total int default 0;
insert into bill(bid,prid,phid) values(501,1,102),(502,2,104),(503,3,103);
update bill
	set total=(select sum(price) from prescription where prescription.prid=bill.prid);

#displaying bill
select distinct bid,pname,phname,drname,total from bill,pharmacy,prescription,patient,doctor
	where (pharmacy.phid=bill.phid and bill.prid=prescription.prid and prescription.pid=patient.pid and prescription.drid=doctor.drid)
    order by bid;