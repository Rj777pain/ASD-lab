use Epharm;

#default contstraint
alter table prescription modify column quantity int default 5;
alter table drugs modify column price int default 0;
alter table drugs modify column potency int default 250;
alter table patient modify column sex enum('F','M') default 'M';

#auto increment constraint

alter table contract add column conid int unique auto_increment;

#unique constraint
alter table manufacturer modify column contact int unique not null;

#check constraint
alter table contract add constraint checkPeriod check(period<=5);
alter table pharmacy add constraint checkLen check(length(address)>5);

