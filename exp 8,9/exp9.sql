use EPharm;

select pharmacy,count(*) from conview
	group by pharmacy;
select min(price),max(price) from prescription;
select avg(age),sum(age) from patient;
