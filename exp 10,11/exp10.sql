use EPharm;

#order by clause
#displaying the name and prices of drugs in ascending order
select drugname,price from drugs
	order by price asc;
    
#displaying period, manufacturer id, pharmacy id from contract in asc order of period and desc order of mid
select period,phid,mid from contract 
	order by period asc, mid desc;
    
#group by and having clause
#displaying mid, count, average price of drugs group by mid having average price greater than 11.0
select mid,count(*),avg(price) from drugs
	group by mid
    having avg(price)>11.00;

#displaying sex, count of patients order by sex with count >0
select sex,count(*) from patient
	group by sex
    having count(*)>0;
    
#displaying prid, total sum and count of prescription group by prid with count>1
select prid,sum(price),count(*) from prescription
	group by prid
    having count(*)>1;